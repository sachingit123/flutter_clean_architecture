part of 'splash_cubit.dart';

sealed class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

final class SplashInitial extends SplashState {}

final class DisplaySplash extends SplashState {}

final class Authenticated extends SplashState {}

final class UnAuthenticated extends SplashState {}
