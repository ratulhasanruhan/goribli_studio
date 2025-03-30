import 'package:flutter/material.dart';

import 'app_colors.dart';

final mainTheme = ThemeData(
  primarySwatch: AppColors.primarySwatch,
  scaffoldBackgroundColor: AppColors.secondaryColor,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: AppColors.textColor),
  ),
  fontFamily: 'Ador',
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: AppColors.primaryColor,
  )),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: AppColors.textColor.withOpacity(0.5)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: AppColors.primaryColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: AppColors.textColor.withOpacity(0.3)),
    ),
    labelStyle: const TextStyle(color: AppColors.textColor),
    hintStyle: TextStyle(color: AppColors.textColor.withOpacity(0.6)),
    fillColor: Colors.white,
    filled: true,
  ),
);
