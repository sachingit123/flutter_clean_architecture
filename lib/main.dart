import 'package:ecom/config/routes/app_routes.dart';
import 'package:ecom/config/routes/route_name.dart';
import 'package:ecom/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecom/features/users/presentation/bloc/user_bloc.dart';
import 'features/splash/presentation/cubit/splash_cubit.dart';
import 'package:ecom/config/theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.getIt<SplashCubit>()),
        BlocProvider(create: (context) => di.getIt<UserBloc>()),
        BlocProvider(create: (context) => di.getIt<AuthBloc>()),
      ],
      child: MaterialApp(
        theme: AppTheme.appTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: RouteNames.splash,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
