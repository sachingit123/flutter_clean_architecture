part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignupUserEvent extends AuthEvent {
  final AuthRequest authRequest;
  const SignupUserEvent({required this.authRequest});

  @override
  List<Object> get props => [authRequest];
}

class LoginUserEvent extends AuthEvent {
  final AuthRequest authRequest;
  const LoginUserEvent({required this.authRequest});

  @override
  List<Object> get props => [authRequest];
}
