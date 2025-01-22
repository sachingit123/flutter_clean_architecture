import 'package:ecom/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppUtility {
  //------Display Snack bar------
  static displayCustomSnackBar({
    required BuildContext context,
    required String message,
    Color? textColor,
    Color? backgroundColor,
  }) {
    var snackDemo = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: textColor ?? AppColors.whiteColor),
      ),
      backgroundColor: backgroundColor ?? AppColors.greenColor,
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(5),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackDemo);
  }
}
