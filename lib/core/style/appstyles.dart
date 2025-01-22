import 'package:ecom/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

TextStyle customTextStyle({
  required double fontSize,
  FontWeight? fontWeight,
  Color color = AppColors.blackColor,
  FontStyle? fontStyle,
}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    fontFamily: "CircularStd",
  );
}
