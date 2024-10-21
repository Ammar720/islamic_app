import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color lightPrimary = Color(0xFFB7935F);
  static const Color darkPrimary = Color(0xFF141A2E);
  static const Color black = Color(0xFF242424);
  static const Color gold = Color(0xFFFACC1D);
  static const Color white = Color(0xFFF8F8F8);

  static ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimary,
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
        headlineSmall: GoogleFonts.inter(
            fontSize: 25, fontWeight: FontWeight.w400, color: black),
        titleLarge: GoogleFonts.inter(
            fontSize: 20, fontWeight: FontWeight.w400, color: black),
        headlineMedium: GoogleFonts.elMessiri(
            fontSize: 25, fontWeight: FontWeight.w600, color: black)),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: GoogleFonts.elMessiri(
          color: black,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: lightPrimary,
        unselectedItemColor: white,
        selectedItemColor: black,
        selectedLabelStyle: GoogleFonts.inter(
          color: black,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
        unselectedLabelStyle: GoogleFonts.inter(
          color: black,
          fontWeight: FontWeight.w500,
          fontSize: 10,
        ),
        selectedIconTheme: const IconThemeData(size: 40 ,) ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: darkPrimary,
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: TextTheme(
        headlineSmall: GoogleFonts.inter(
            fontSize: 25, fontWeight: FontWeight.w400, color: white),
        titleLarge: GoogleFonts.inter(
            fontSize: 20, fontWeight: FontWeight.w400, color: gold),
        headlineMedium: GoogleFonts.elMessiri(
            fontSize: 25, fontWeight: FontWeight.w600, color: white)),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: white,
        centerTitle: true,
        titleTextStyle: GoogleFonts.elMessiri(
          color: white,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: darkPrimary,
        unselectedItemColor: white,
        selectedItemColor: gold,
        selectedLabelStyle: GoogleFonts.inter(
          color: black,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        unselectedLabelStyle: GoogleFonts.inter(
          color: black,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
        selectedIconTheme: const IconThemeData(size: 40)),
  );
}
