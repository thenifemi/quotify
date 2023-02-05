import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

final themeData = ThemeData(
  primaryColor: AppColors.primary,
  colorScheme: ColorScheme(
    background: AppColors.primary,
    brightness: Brightness.light,
    error: AppColors.primary,
    onBackground: AppColors.primary,
    onError: AppColors.primary,
    onPrimary: AppColors.primary,
    onSecondary: AppColors.primary,
    onSurface: AppColors.primary,
    primary: AppColors.primary,
    secondary: AppColors.primary,
    surface: AppColors.primary,
  ),
  scaffoldBackgroundColor: AppColors.primary,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    centerTitle: false,
    iconTheme: IconThemeData(
      color: AppColors.dark,
    ),
  ),
  textTheme: TextTheme(
    titleLarge: GoogleFonts.cormorantGaramond(
      color: AppColors.dark,
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: GoogleFonts.robotoSerif(
      color: AppColors.dark,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: GoogleFonts.robotoSerif(
      color: AppColors.dark,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: GoogleFonts.robotoSerif(
      color: AppColors.dark,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ),
);
