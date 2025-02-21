import 'package:flutter/material.dart';

import '../utils_export.dart';

ThemeData lightTheme() {
  return ThemeData(
    useMaterial3: false,
    primaryColor: ConstantColors.primaryColor,
    primarySwatch:  const MaterialColor(0xff0F5936, <int, Color>{
      900: Color(0xFF674010),
      800: Color(0xff784a13),
      700: Color(0xFF8a5516),
      600: Color(0xFF9b5f18),
      500: Color(0xFF9b5f18),
      400: Color(0xFFac6a1b),
      300: Color(0xFFb47932),
      200: Color(0xFFbd8849),
      100: Color(0xFFc5975f),
      50: Color(0xFFcda676),
    }),
    scaffoldBackgroundColor: Colors.white,
    textTheme: customTextTheme,
  );
}

const TextTheme customTextTheme = TextTheme(
  displayLarge: TextStyle(
      fontSize: 96, fontWeight: FontWeight.bold, letterSpacing: -1.5, fontFamily: FontFamily.gillSansStdFontFamily,color: Colors.black),
  displayMedium: TextStyle(
      fontSize: 60, fontWeight: FontWeight.bold, letterSpacing: -0.5, fontFamily: FontFamily.gillSansStdFontFamily,color: Colors.black),
  displaySmall: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, fontFamily: FontFamily.gillSansStdFontFamily,color: Colors.black),
  headlineLarge: TextStyle(
      fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 0.25, fontFamily: FontFamily.gillSansStdFontFamily,color: Colors.black),
  headlineMedium: TextStyle(
      fontSize: 28, fontWeight: FontWeight.bold, letterSpacing: 0.25, fontFamily: FontFamily.gillSansStdFontFamily,color: Colors.black),
  headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: FontFamily.gillSansStdFontFamily,color: Colors.black),
  titleLarge: TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 0.15, fontFamily: FontFamily.gillSansStdFontFamily,color: Colors.black),
  titleMedium: TextStyle(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15, fontFamily: FontFamily.gillSansStdFontFamily,color: Colors.black),
  titleSmall: TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1, fontFamily: FontFamily.gillSansStdFontFamily,color: Colors.black),
  bodyLarge: TextStyle(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5, fontFamily: FontFamily.gillSansStdFontFamily,color: Colors.black),
  bodyMedium: TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25, fontFamily: FontFamily.gillSansStdFontFamily,color: Colors.black),
  labelLarge: TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25, fontFamily: FontFamily.gillSansStdFontFamily,color: Colors.black),
  bodySmall: TextStyle(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4, fontFamily: FontFamily.gillSansStdFontFamily,color: Colors.black),
  labelSmall: TextStyle(
      fontSize: 8, fontWeight: FontWeight.w400, letterSpacing: 1.5, fontFamily: FontFamily.gillSansStdFontFamily,color: Colors.black),
);