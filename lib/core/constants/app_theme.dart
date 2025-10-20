import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme {
    final interTextTheme = GoogleFonts.interTextTheme();
    final encodeSansTextTheme = GoogleFonts.encodeSansTextTheme();

    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Color(0xFF1C2127),
       appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1C2127),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      textTheme: TextTheme(
        // Maps to "Heading/Mobile/Medium"
        headlineMedium: encodeSansTextTheme.headlineMedium?.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w800,
          height: 32 / 24,
          letterSpacing: 0,
        ),

        // Maps to "Heading/Mobile/Small"
        titleMedium: encodeSansTextTheme.titleMedium?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          height: 24 / 16,
          letterSpacing: 0,
        ),

        // Maps to "Heading/Mobile/Extrasmall"
        labelLarge: encodeSansTextTheme.labelLarge?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          height: 24 / 14, // 1.71
          letterSpacing: 0,
        ),

        // Maps to "Heading/Mobile/XXSmall"
        labelMedium: encodeSansTextTheme.labelMedium?.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          height: 16 / 12, 
          letterSpacing: 0,
        ),

        // Maps to "Text/Medium/Regular"
        bodyLarge: interTextTheme.bodyLarge?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w400, 
          height: 24 / 16, 
          letterSpacing: 0,
        ),

        // Maps to "Text/Small/Regular"
        bodyMedium: interTextTheme.bodyMedium?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w400, 
          height: 20 / 14, 
          letterSpacing: 0,
        ),

        // Maps to "Text/Small/Medium"
        titleSmall: interTextTheme.titleSmall?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w500, 
          height: 20 / 14, 
          letterSpacing: 0,
        ),

        // Maps to "Text/Extrasmall/Regular"
        bodySmall: interTextTheme.bodySmall?.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w400, 
          height: 18 / 12, 
          letterSpacing: 0,
        ),
      )
    );
  }
}
