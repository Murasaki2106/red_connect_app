import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryRed = Color(0xFFE63946);
  static const Color darkRed = Color(0xFF1D3557);
  static const Color teal = Color(0xFF2A9D8F);
  static const Color gray = Color(0xFF8D99AE);
  static const Color orange = Color(0xFFF4A261);

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryRed,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
  displayLarge: GoogleFonts.montserrat(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  titleLarge: GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  ),
  titleMedium: GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  ),
  bodyMedium: GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  ),
),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryRed,
          foregroundColor: Colors.white,
          textStyle: GoogleFonts.roboto(fontSize: 16),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: primaryRed,
        titleTextStyle: GoogleFonts.montserrat(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        centerTitle: true,
        elevation: 0,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: teal,
        error: darkRed,
      ),
    );
  }
}
