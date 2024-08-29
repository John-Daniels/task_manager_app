import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class DefaultTheme {
  static var defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide.none,
  );
  static var defaultFocusedInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(
      width: 1,
      color: Colors.black,
    ),
  );
}

class AppTheme {
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
    ),
    textTheme: GoogleFonts.nunitoSansTextTheme(),
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.inputBg,
      border: DefaultTheme.defaultInputBorder,
      enabledBorder: DefaultTheme.defaultInputBorder,
      focusedBorder: DefaultTheme.defaultFocusedInputBorder,
      hintStyle: TextStyle(color: AppColors.bodyText2.withOpacity(0.7)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        minimumSize: Size.fromHeight(50.h),
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15.sp,
        ),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    useMaterial3: true,
  );
}
