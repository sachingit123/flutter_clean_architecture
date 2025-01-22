import 'package:ecom/core/colors/app_colors.dart';
import 'package:ecom/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecom/features/auth/data/entity/auth_request.dart';
import 'package:ecom/features/auth/presentation/screen/login_screen.dart';
import 'package:ecom/utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/style/appstyles.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSignUpPressed(BuildContext context) {
    final email = _emailController.text;
    final password = _passwordController.text;
    final authRequest = AuthRequest(email: email, password: password);
    context.read<AuthBloc>().add(SignupUserEvent(authRequest: authRequest));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is SignUpSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                        'Signup successful! Token: ${state.signUpModel.token}')),
              );
              AppNavigator.pushReplacement(context, const LoginScreen());
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
                    onPressed: () => _onSignUpPressed(context),
                    child: const Text('Sign Up'),
                  ),
                ),
                if (state is SignUpSuccessState)
                  Text(
                    'Signup Success! Token: ${state.signUpModel.token}',
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
