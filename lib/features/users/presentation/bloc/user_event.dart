part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUserEvent extends UserEvent {
  const LoadUserEvent();
  @override
  List<Object> get props => [];
}

class LogOutEvent extends UserEvent {
  const LogOutEvent();
  @override
  List<Object> get props => [];
}
