import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightThemeData() {
  return ThemeData(
    primaryColor: HexColor('f6f6f6'),
    primaryColorDark: Colors.black87,
    shadowColor: Colors.black,
    dividerColor: Colors.black87,
    errorColor: Colors.redAccent,
    highlightColor: Colors.green,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.lato(
        textStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w700,
          fontSize: 25,
        ),
      ),
      headlineLarge: GoogleFonts.lato(
        textStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w600,
          fontSize: 22,
        ),
      ),
      headlineMedium: GoogleFonts.lato(
        textStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
      bodyLarge: GoogleFonts.lato(
        textStyle: const TextStyle(
          color: Colors.black26,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
      bodyMedium: GoogleFonts.lato(
        textStyle: const TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),
      bodySmall: GoogleFonts.lato(
        textStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ),
      labelLarge: GoogleFonts.lato(
        textStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
      labelSmall: GoogleFonts.lato(
        textStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
      displayLarge: GoogleFonts.lato(
        textStyle: const TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
      displaySmall: GoogleFonts.lato(
        textStyle: const TextStyle(
          color: Colors.redAccent,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.raleway(
        textStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w700,
          fontSize: 30,
        ),
      ),
      color: Colors.white,
      elevation: 0,
    ),
    navigationBarTheme: const NavigationBarThemeData(
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      elevation: 10,
      height: 50,
      backgroundColor: Colors.white,
      indicatorColor: Colors.transparent,
    ),
    iconTheme: const IconThemeData (
      color: Colors.black87,
    ),
  );
}

ThemeData darkThemeData() {
  return ThemeData(
    primaryColor: Colors.white12,
    primaryColorDark: Colors.white70,
    shadowColor: Colors.white,
    dividerColor: Colors.white70,
    errorColor: Colors.redAccent,
    highlightColor: Colors.green,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.raleway(
        textStyle: const TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.w700,
          fontSize: 30,
        ),
      ),
      headlineLarge: GoogleFonts.raleway(
        textStyle: const TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      headlineMedium: GoogleFonts.raleway(
        textStyle: const TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
      bodyMedium: GoogleFonts.raleway(
        textStyle: const TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ),
      bodySmall: GoogleFonts.raleway(
        textStyle: const TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.w400,
          fontSize: 10,
        ),
      ),
      labelLarge: GoogleFonts.raleway(
        textStyle: const TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
      labelSmall: GoogleFonts.raleway(
        textStyle: const TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
      displayLarge: GoogleFonts.raleway(
        textStyle: const TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
      displaySmall: GoogleFonts.raleway(
        textStyle: const TextStyle(
          color: Colors.redAccent,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.raleway(
        textStyle: const TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.w700,
          fontSize: 30,
        ),
      ),
      color: Colors.black,
      elevation: 0,
    ),
    navigationBarTheme: const NavigationBarThemeData(
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      elevation: 10,
      height: 50,
      backgroundColor: Colors.black,
      indicatorColor: Colors.transparent,
    ),
    iconTheme: const IconThemeData (
      color: Colors.white70,
    ),
  );
}
