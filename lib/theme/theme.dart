import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: AppColors.darkBgColor,
    primary: AppColors.darkMainColor
  )
);

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: AppColors.lightBgColor,
    primary: AppColors.lightMainColor
  )
);