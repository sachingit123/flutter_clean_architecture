import 'package:ecom/features/auth/data/datasources/auth_api_remote_repository.dart';
import 'package:ecom/features/auth/domain/model/login_model.dart';
import 'package:ecom/features/auth/domain/repositories/auth_repository.dart';
import 'package:ecom/features/auth/domain/model/signup_model.dart';
import 'package:ecom/features/auth/data/entity/auth_request.dart';
import 'package:ecom/core/error/failures.dart';
import 'package:either_dart/either.dart';
import 'dart:developer';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiRemoteRepository authApiRemoteRepository;
  AuthRepositoryImpl({required this.authApiRemoteRepository});

  @override
  Future<Either<Failure, SignUpModel>> signUpUser(
      {required AuthRequest authRequest}) async {
    try {
      final authEnity =
          await authApiRemoteRepository.signUpWithApi(authRequest: authRequest);
      return Right(authEnity);
    } catch (e) {
      log(e.toString());
      if (e is ServerFailure) {
        return Left(e);
      } else {
        return const Left(ServerFailure(errorMessage: 'SignUp Failed'));
      }
    }
  }

  @override
  Future<Either<Failure, LoginModel>> loginUser(
      {required AuthRequest authRequest}) async {
    try {
      final authEnity =
          await authApiRemoteRepository.loginWithApi(authRequest: authRequest);
      return Right(authEnity);
    } catch (e) {
      log(e.toString());
      if (e is ServerFailure) {
        return Left(e);
      } else {
        return const Left(ServerFailure(errorMessage: 'SignUp Failed'));
      }
    }
  }

  // @override
  // Future<Either<Failure, AuthEntity>> loginWithApi(
  //     {required LogInRequest logInRequest}) async {
  //   if (await networkInfo.isConnected == true) {
  //     try {
  //       final authEnity =
  //           await remoteDataSource.loginWithApi(logInRequest: logInRequest);
  //       return Right(authEnity);
  //     } catch (e) {
  //       log(e.toString());
  //       if (e is ServerFailure) {
  //         return Left(e);
  //       } else {
  //         return const Left(ServerFailure(errorMessage: 'Login Failed'));
  //       }
  //     }
  //   } else {
  //     return Left(ConnectionFailure());
  //   }
  // }
}
