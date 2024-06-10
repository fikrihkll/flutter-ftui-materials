import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
  // Define the primary and secondary colors
  primaryColor: const Color(0xFFF1E5D1),
  secondaryHeaderColor: const Color(0xFFDBB5B5),

  // Define the color scheme
  colorScheme: const ColorScheme(
    primary: Color(0xFFF1E5D1),
    primaryContainer: Color(0xFFF1E5D1),
    secondary: Color(0xFFDBB5B5),
    secondaryContainer: Color(0xFFDBB5B5),
    surface: Color(0xFFFFFFFF),
    background: Color(0xFFFFF9F0),
    error: Color(0xFFD9534F),
    onPrimary: Color(0xFF5A4A42),
    onSecondary: Color(0xFF5A4A42),
    onSurface: Color(0xFF5A4A42),
    onBackground: Color(0xFF5A4A42),
    onError: Color(0xFFFFFFFF),
    brightness: Brightness.light,
    tertiary: Color(0xFFA6C1D6),
  ),

  // Define the text themes
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 96.0, fontWeight: FontWeight.bold, color: Color(0xFF5A4A42),
    ),
    displayMedium: TextStyle(
      fontSize: 60.0, fontWeight: FontWeight.bold, color: Color(0xFF5A4A42),
    ),
    displaySmall: TextStyle(
      fontSize: 48.0, fontWeight: FontWeight.bold, color: Color(0xFF5A4A42),
    ),
    headlineLarge: TextStyle(
      fontSize: 34.0, fontWeight: FontWeight.bold, color: Color(0xFF5A4A42),
    ),
    headlineMedium: TextStyle(
      fontSize: 24.0, fontWeight: FontWeight.bold, color: Color(0xFF5A4A42),
    ),
    headlineSmall: TextStyle(
      fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF5A4A42),
    ),
    titleLarge: TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.bold, color: Color(0xFF5A4A42),
    ),
    titleMedium: TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w500, color: Color(0xFF5A4A42),
    ),
    titleSmall: TextStyle(
      fontSize: 12.0, fontWeight: FontWeight.w500, color: Color(0xFF5A4A42),
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0, fontWeight: FontWeight.normal, color: Color(0xFF5A4A42),
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.normal, color: Color(0xFF5A4A42),
    ),
    bodySmall: TextStyle(
      fontSize: 12.0, fontWeight: FontWeight.normal, color: Color(0xFF5A4A42),
    ),
    labelLarge: TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF),
    ),
    labelMedium: TextStyle(
      fontSize: 12.0, fontWeight: FontWeight.normal, color: Color(0xFF5A4A42),
    ),
    labelSmall: TextStyle(
      fontSize: 10.0, fontWeight: FontWeight.normal, color: Color(0xFF5A4A42),
    ),
  ),

  // Customize button themes
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFFDBB5B5),
    textTheme: ButtonTextTheme.primary,
  ),

  // Customize app bar theme
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFDBB5B5),
    foregroundColor: Color(0xFF5A4A42),
  ),
);