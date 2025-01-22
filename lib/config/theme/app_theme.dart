import 'package:ecom/core/style/appstyles.dart';
import 'package:flutter/material.dart';

import '../../core/colors/app_colors.dart';

class AppTheme {
  static final appTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.whiteColor,
    brightness: Brightness.light,
    fontFamily: 'CircularStd',
    snackBarTheme: SnackBarThemeData(
      contentTextStyle:
          customTextStyle(color: AppColors.whiteColor, fontSize: 14),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      hintStyle: customTextStyle(
        color: const Color(0xffA7A7A7),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      contentPadding: const EdgeInsets.all(16),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4), borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4), borderSide: BorderSide.none),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        elevation: 0,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    ),
  );
}
