import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightThemeData(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
        error: Colors.red,
        secondary: Colors.grey,
        onTertiary: Colors.orange,
        brightness: Brightness.light,
      ),
      textTheme: GoogleFonts.rubikTextTheme().copyWith(
        bodyMedium: TextStyle(
          color: Color(0xFF96c490), // Varsayılan metin rengi
        ),
      ),
    );
  }

  static ThemeData darkThemeData() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
        secondary: Colors.grey,
        error: Colors.red,
        onTertiary: Colors.orange,
        brightness: Brightness.dark,
      ),
      textTheme: GoogleFonts.rubikTextTheme().copyWith(
        bodyMedium: TextStyle(
          color:
              Color(0xFF96c490), // Varsayılan metin rengi (karanlık tema için)
        ),
      ),
    );
  }
}
