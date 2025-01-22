import 'package:ecom/core/colors/app_colors.dart';
import 'package:ecom/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecom/features/auth/data/entity/auth_request.dart';
import 'package:ecom/features/users/presentation/screen/user_screen.dart';
import 'package:ecom/utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/style/appstyles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed(BuildContext context) {
    final email = _emailController.text;
    final password = _passwordController.text;
    final authRequest = AuthRequest(email: email, password: password);
    context.read<AuthBloc>().add(LoginUserEvent(authRequest: authRequest));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Login successful')),
              );
              AppNavigator.pushReplacement(context, const UserScreen());
            } else if (state is AuthErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMsg)),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _onLoginPressed(context),
                    child: const Text('Login'),
                  ),
                ),
                if (state is LoginSuccessState)
                  Text(
                    'Login Success! Token: ${state.loginModel.token}',
                    style: customTextStyle(
                        color: AppColors.greyColor, fontSize: 14),
                  ),
                if (state is AuthErrorState)
                  Text(
                    'Error: ${state.errorMsg}',
                    style: customTextStyle(
                        color: AppColors.redColor, fontSize: 14),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
