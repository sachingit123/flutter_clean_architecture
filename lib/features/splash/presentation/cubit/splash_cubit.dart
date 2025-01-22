import 'package:ecom/utils/app_preferences.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final PreferenceService preferenceService;
  SplashCubit({required this.preferenceService}) : super(SplashInitial()) {
    appStarted();
  }

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));
    var isLoggedIn = preferenceService.getToken() ?? "";
    if (isLoggedIn.trim() != "") {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
