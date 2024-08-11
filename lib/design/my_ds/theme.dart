import 'package:catat/design/my_ds/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData myDsTheme(BuildContext context) {
  final themeData = Theme.of(context);
  final textTheme = themeData.textTheme;

  /// You can change the font-family as you need
  final myDsTextTheme = GoogleFonts.interTextTheme(textTheme).copyWith(
    displayLarge: TextStyle(
      fontSize: 40.sp,
      fontWeight: FontWeight.w800,
    ),
    displayMedium: TextStyle(
      fontSize: 36.sp,
      fontWeight: FontWeight.w800,
    ),
    displaySmall: TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w800,
    ),
    headlineLarge: TextStyle(
      fontSize: 28.sp,
      fontWeight: FontWeight.w800,
    ),
    headlineMedium: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w800,
    ),
    headlineSmall: TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.w800,
    ),
    titleLarge: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w800,
    ),
    titleMedium: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w800,
    ),
    titleSmall: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w800,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.sp,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.sp,
    ),
    bodySmall: TextStyle(
      fontSize: 12.sp,
    ),
    labelLarge: TextStyle(
      fontSize: 14.sp,
    ),
    labelMedium: TextStyle(
      fontSize: 12.sp,
    ),
    labelSmall: TextStyle(
      fontSize: 11.sp,
    ),
  );

  return ThemeData(
    colorScheme: const ColorScheme.light(
      primary: MyDsColors.newPrimaryBase,
      secondary: MyDsColors.newPrimaryLight,
      tertiary: MyDsColors.newPrimaryInvert,
      onPrimary: MyDsColors.white,
      onBackground: MyDsColors.neutralOne,
      error: MyDsColors.alert,
    ),
    useMaterial3: false,
    textTheme: myDsTextTheme,
  );
}
