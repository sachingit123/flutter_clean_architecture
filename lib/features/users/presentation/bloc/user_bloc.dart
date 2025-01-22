import 'package:ecom/features/users/domain/model/user_model.dart';
import 'package:ecom/features/users/domain/usecases/get_users_usecase.dart';
import 'package:ecom/utils/app_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsersUseCase getUsersUseCase;
  final PreferenceService preferenceService;
  UserBloc({
    required this.getUsersUseCase,
    required this.preferenceService,
  }) : super(UserInitialState()) {
    //--Get-Users---
    on<LoadUserEvent>((event, emit) async {
       emit(const UserLoadingState());
      var auth = await getUsersUseCase.execute();
      auth.fold(
        (left) {
          emit(const UserErrorState(errorMsg: "Something went wrong"));
        },
        (right) {
          emit(UserSuccessState(getUserModel: right));
        },
      );
    });

    //--Logout-User---
    on<LogOutEvent>((event, emit) async {
      preferenceService.clearToken().then((val) {
        emit(const UserLogOutSuccessState());
      });
    });
  }
}
