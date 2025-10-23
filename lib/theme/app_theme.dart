import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFE8ECF1),
    primaryColor: const Color(0xFF1E3A8A),
    colorScheme: ColorScheme.light(
      primary: const Color(0xFF1E3A8A),
      secondary: const Color(0xFFD3E0EA),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF0F172A),
    primaryColor: const Color(0xFF38BDF8),
    colorScheme: ColorScheme.dark(
      primary: const Color(0xFF38BDF8),
      secondary: const Color(0xFF1E293B),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF1E293B),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
    ),
  );
}
