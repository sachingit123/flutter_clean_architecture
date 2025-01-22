part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {
  const AuthLoadingState();
  @override
  List<Object> get props => [];
}

class SignUpSuccessState extends AuthState {
  final SignUpModel signUpModel;
  const SignUpSuccessState({required this.signUpModel});
  @override
  List<Object> get props => [signUpModel];
}

class LoginSuccessState extends AuthState {
  final LoginModel loginModel;
  const LoginSuccessState({required this.loginModel});
  @override
  List<Object> get props => [loginModel];
}

class AuthErrorState extends AuthState {
  final String errorMsg;
  const AuthErrorState({required this.errorMsg});
  @override
  List<Object> get props => [];
}
