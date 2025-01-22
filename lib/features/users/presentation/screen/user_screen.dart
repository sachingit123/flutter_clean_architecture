import 'package:ecom/core/colors/app_colors.dart';
import 'package:ecom/core/style/appstyles.dart';
import 'package:ecom/features/auth/presentation/screen/login_screen.dart';
import 'package:ecom/features/users/presentation/bloc/user_bloc.dart';
import 'package:ecom/features/users/presentation/widgets/user_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecom/utils/app_navigator.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    BlocProvider.of<UserBloc>(context).add(const LoadUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Information'),
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<UserBloc>(context).add(const LogOutEvent());
            },
            icon: const Icon(Icons.logout_outlined),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserLogOutSuccessState) {
            AppNavigator.pushAndRemove(context, const LoginScreen());
          }
        },
        builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserSuccessState) {
            return ListView.builder(
                itemCount: state.getUserModel.length,
                itemBuilder: (context, index) =>
                    UserDetails(user: state.getUserModel[index]));
          } else if (state is UserErrorState) {
            return Center(
                child: Text(
              state.errorMsg,
              style: customTextStyle(fontSize: 16, color: AppColors.redColor),
            ));
          }
          return Center(
              child: Text(
            'No data available.',
            style: customTextStyle(fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ));
        },
      ),
    );
  }
}
