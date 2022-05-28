import 'package:flutter/material.dart';

class AppColors {
  static const purpleColor = Color(0xFF431AA1);
  static const whiteColor = Color(0xFFFAF8FC);
  static const lightPurpleColor = Color(0xFF9345F2);
  static const magentaColor = Color(0xFFB9A2D8);
  static const orangeColor = Color(0xFFE6704A);

  static const darkPurpleColor = Color(0xFF1E0771);
}

ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.purpleColor,
  scaffoldBackgroundColor: AppColors.whiteColor,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.purpleColor,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(color: AppColors.darkPurpleColor),
    bodyText2: TextStyle(color: AppColors.darkPurpleColor),
  ),
);

ThemeData darkTheme = ThemeData(
  primaryColor: AppColors.darkPurpleColor,
  scaffoldBackgroundColor: AppColors.darkPurpleColor,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.darkPurpleColor,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(color: AppColors.whiteColor),
    bodyText2: TextStyle(color: AppColors.whiteColor),
  ),
);
