part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitialState extends UserState {}

class UserLoadingState extends UserState {
  const UserLoadingState();
  @override
  List<Object> get props => [];
}

class UserSuccessState extends UserState {
  final List<UserModel> getUserModel;
  const UserSuccessState({required this.getUserModel});
  @override
  List<Object> get props => [];
}

class UserErrorState extends UserState {
  final String errorMsg;
  const UserErrorState({required this.errorMsg});

  @override
  List<Object> get props => [];
}

class UserLogOutSuccessState extends UserState {
  const UserLogOutSuccessState();
  @override
  List<Object> get props => [];
}
