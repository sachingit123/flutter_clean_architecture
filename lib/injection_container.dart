import 'package:ecom/features/auth/data/datasources/auth_api_remote_repository.dart';
import 'package:ecom/features/auth/domain/usecases/login_usecase.dart';
import 'package:ecom/features/auth/domain/usecases/signup_usecase.dart';
import 'package:ecom/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecom/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:ecom/features/users/presentation/bloc/user_bloc.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/users/data/datasources/users_api_remote_repository.dart';
import 'features/users/data/repositories/users_api_repository_impl.dart';
import 'features/users/domain/repositories/users_repositories.dart';
import 'features/users/domain/usecases/get_users_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecom/utils/app_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> init() async {
  // Initialize SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  // Register SharedPreferences and PreferenceService
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  getIt.registerLazySingleton(() => PreferenceService(sharedPreferences));

  // Register http.Client
  getIt.registerLazySingleton<http.Client>(() => http.Client());

  //---------------Splash--------------
  //-----------------------------------
  getIt.registerFactory(
      () => SplashCubit(preferenceService: getIt<PreferenceService>()));

  //---------------Get-Users-------------
  //-------------------------------------
  // Register-Data-Layer
  getIt.registerLazySingleton<UsersApiRemoteRepository>(
      () => UsersApiRemoteRepositoryImpl(httpClient: getIt()));
  getIt.registerLazySingleton<UsersRepository>(
      () => UsersRepositoryImpl(remoteDataSource: getIt()));
  // Register-Domain-Layer
  getIt.registerLazySingleton(() => GetUsersUseCase(repository: getIt()));
  // Register-Presentation-Layer
  getIt.registerFactory(
    () => UserBloc(
      getUsersUseCase: getIt(),
      preferenceService: getIt<PreferenceService>(),
    ),
  );

  getIt.allReady().then((_) {
    getIt<http.Client>();
    getIt<UsersApiRemoteRepository>();
    getIt<UsersRepository>();
    getIt<GetUsersUseCase>();
    debugPrint("Users Dependency registration completed successfully.");
  }).catchError((error) {
    debugPrint("Users Error during dependency registration: $error");
  });

  //--------------User-Auth--------------
  //-------------------------------------
  // Register-Data-Layer
  getIt.registerLazySingleton<AuthApiRemoteRepository>(
      () => AuthApiRemoteDataSourceImpl(httpClient: getIt()));
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authApiRemoteRepository: getIt()));
  // Register-Domain-Layer
  getIt.registerLazySingleton(() => SignUpUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => LoginUsecase(repository: getIt()));
  // Register-Presentation-Layer
  getIt.registerFactory(
    () => AuthBloc(
      signUpUsecase: getIt<SignUpUseCase>(),
      loginUsecase: getIt<LoginUsecase>(),
      preferenceService: getIt<PreferenceService>(),
    ),
  );

  getIt.allReady().then((_) {
    getIt<http.Client>();
    getIt<AuthApiRemoteRepository>();
    getIt<AuthRepository>();
    getIt<LoginUsecase>();
    getIt<SignUpUseCase>();
    debugPrint("Auth Dependency registration completed successfully.");
  }).catchError((error) {
    debugPrint("Auth Error during dependency registration: $error");
  });
}
