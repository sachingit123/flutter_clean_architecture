import 'package:ecom/config/routes/route_name.dart';
import 'package:ecom/features/auth/presentation/screen/login_screen.dart';
import 'package:ecom/features/auth/presentation/screen/signup_screen.dart';
import 'package:ecom/features/splash/presentation/screens/splash_screen.dart';
import 'package:ecom/features/users/presentation/screen/user_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteNames.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteNames.signupScreen:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case RouteNames.userScreen:
        return MaterialPageRoute(builder: (_) => const UserScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No Page Found')),
          ),
        );
    }
  }
}
