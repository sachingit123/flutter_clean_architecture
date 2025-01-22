import 'package:ecom/core/colors/app_colors.dart';
import 'package:ecom/features/auth/presentation/screen/login_screen.dart';
import 'package:ecom/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:ecom/features/users/presentation/screen/user_screen.dart';
import 'package:ecom/utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_vectors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          debugPrint("UnAuthenticated");
          AppNavigator.pushAndRemove(context, const LoginScreen());
        }
        if (state is Authenticated) {
          debugPrint("Authenticated");
          AppNavigator.pushAndRemove(context, const UserScreen());
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: SvgPicture.asset(
            AppVectors.appLogo,
          ),
        ),
      ),
    );
  }
}
