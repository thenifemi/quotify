import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

final themeData = ThemeData(
  // brightness: Brightness.light,
  primaryColor: AppColors.primary,
  backgroundColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.primary,
  appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      color: Colors.transparent,
      elevation: 0.0,
      centerTitle: false,
      iconTheme: IconThemeData(
        color: AppColors.dark,
      )),
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
