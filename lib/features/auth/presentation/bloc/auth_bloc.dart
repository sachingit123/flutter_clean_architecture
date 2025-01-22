import 'package:ecom/features/auth/data/entity/auth_request.dart';
import 'package:ecom/features/auth/domain/model/login_model.dart';
import 'package:ecom/features/auth/domain/model/signup_model.dart';
import 'package:ecom/features/auth/domain/usecases/login_usecase.dart';
import 'package:ecom/features/auth/domain/usecases/signup_usecase.dart';
import 'package:ecom/utils/app_preferences.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUseCase signUpUsecase;
  final LoginUsecase loginUsecase;
  final PreferenceService preferenceService;
  AuthBloc({
    required this.signUpUsecase,
    required this.loginUsecase,
    required this.preferenceService,
  }) : super(AuthInitial()) {
    //---Signup---
    on<SignupUserEvent>((event, emit) async {
      emit(const AuthLoadingState());
      var result = await signUpUsecase.execute(authRequest: event.authRequest);
      result.fold(
        (left) {
          emit(const AuthErrorState(errorMsg: "Something went wrong"));
        },
        (right) {
          emit(SignUpSuccessState(signUpModel: right));
        },
      );
    });

    //---Login---
    on<LoginUserEvent>((event, emit) async {
      emit(const AuthLoadingState());
      var result = await loginUsecase.execute(authRequest: event.authRequest);
      result.fold(
        (left) {
          emit(const AuthErrorState(errorMsg: "Something went wrong"));
        },
        (right) {
          preferenceService.setToken(right.token ?? "").then((val) {
            emit(LoginSuccessState(loginModel: right));
          });
        },
      );
    });
  }
}
