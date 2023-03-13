import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ishonch/utils/app_colors.dart';

class AppTheme {
  /// Light mode

  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColors.black,
      ),
      backgroundColor: AppColors.white,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    ),
    dialogBackgroundColor: AppColors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      elevation: 8,
    ),
    popupMenuTheme: const PopupMenuThemeData(
      color: AppColors.white,
      elevation: 6,
    ),
    hintColor: AppColors.grey,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: const ColorScheme.light(),
    primaryColorDark: AppColors.white,
    primaryColor: AppColors.white,
   // useMaterial3: true,
    cardColor: AppColors.black,
    shadowColor: AppColors.grey.withOpacity(0.5),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: AppColors.black),
    splashColor: AppColors.white,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.roboto(
        textStyle: TextStyle(
            color: AppColors.black,
            fontSize: 57.sp,
            fontWeight: FontWeight.w800),
      ),
      displayMedium: GoogleFonts.roboto(
        textStyle: TextStyle(
            color: AppColors.black,
            fontSize: 45.sp,
            fontWeight: FontWeight.w700),
      ),
      displaySmall: GoogleFonts.roboto(
        textStyle: TextStyle(
            color: AppColors.black,
            fontSize: 36.sp,
            fontWeight: FontWeight.w600),
      ),
      headlineMedium: GoogleFonts.roboto(
        textStyle: TextStyle(
            color: AppColors.black,
            fontSize: 28.sp,
            fontWeight: FontWeight.w500),
      ),
      headlineSmall: GoogleFonts.roboto(
        textStyle: TextStyle(
            color: AppColors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.w400),
      ),
      titleLarge: GoogleFonts.roboto(
        textStyle: TextStyle(
            color: AppColors.black,
            fontSize: 22.sp,
            fontWeight: FontWeight.w300),
      ),
      labelMedium: GoogleFonts.roboto(
        textStyle: TextStyle(
            color: AppColors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w200),
      ),
    ),
  );

  /// Dark mode

  static ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColors.white,
      ),
      backgroundColor: AppColors.black,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
    ),
    dialogBackgroundColor: AppColors.black,
    popupMenuTheme: const PopupMenuThemeData(
      color: AppColors.black,
      elevation: 6,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.grey.withOpacity(0.85),
      elevation: 8,
    ),
  //  useMaterial3: true,
    splashColor: AppColors.black,
    hintColor: AppColors.grey,
    cardColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.black,
    primaryColor: AppColors.black,
    colorScheme: const ColorScheme.dark(),
    primaryColorDark: AppColors.black,
    shadowColor: AppColors.grey.withOpacity(0.5),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: AppColors.white),
    textTheme: TextTheme(
      displayLarge: TextStyle(
            color: AppColors.white,
            fontSize: 57.sp,
            fontWeight: FontWeight.w800),
      displayMedium: TextStyle(
          color: AppColors.white,
          fontSize: 45.sp,
          fontWeight: FontWeight.w700),
      displaySmall: TextStyle(
            color: AppColors.white,
            fontSize: 36.sp,
            fontWeight: FontWeight.w600),
      headlineMedium: TextStyle(
            color: AppColors.white,
            fontSize: 28.sp,
            fontWeight: FontWeight.w500),

      headlineSmall: TextStyle(
            color: AppColors.white,
            fontSize: 24.sp,
            fontWeight: FontWeight.w400),

      titleLarge:TextStyle(
            color: AppColors.white,
            fontSize: 22.sp,
            fontWeight: FontWeight.w300),

      labelMedium: TextStyle(
            color: AppColors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w200),
    ),
  );
}
