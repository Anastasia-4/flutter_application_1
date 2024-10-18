import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    surface: AppColors.darkBgColor,
    primary: AppColors.darkMainColor,
    primaryFixed: AppColors.darkMainColor,
    primaryContainer: AppColors.darkBgColor,
    tertiary: AppColors.greyText,
    tertiaryContainer: AppColors.whiteText,
    tertiaryFixed: Colors.transparent,
    secondary: AppColors.greyText,
    primaryFixedDim: AppColors.darkBgColor
  )
);

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: AppColors.lightBgColor,
    primary: AppColors.lightMainColor,
    primaryFixed: AppColors.lightContainerColor,
    primaryContainer: AppColors.lightContainerColor,
    tertiary: AppColors.blackText,
    tertiaryContainer: AppColors.blackText,
    tertiaryFixed: AppColors.greyText,
    secondary: AppColors.whiteText,
    primaryFixedDim: AppColors.yellowButtonColor
  )
);