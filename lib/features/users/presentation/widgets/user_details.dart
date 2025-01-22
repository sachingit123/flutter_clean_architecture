import 'package:ecom/core/style/appstyles.dart';
import 'package:ecom/features/users/domain/model/user_model.dart';
import 'package:ecom/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  final UserModel user;

  const UserDetails({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${user.firstname} ${user.lastname}",
                style: customTextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.email, size: 20, color: Colors.blue),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      user.email ?? 'N/A',
                      style: customTextStyle(
                        fontSize: 16,
                        color: AppColors.blackColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.link, size: 20, color: Colors.blue),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      user.website ?? 'N/A',
                      style: customTextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
