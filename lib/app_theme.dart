import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color lightPrimary = Color(0xFFB7935F);
  static const Color darkPrimary = Color(0xFF141A2E);
  static const Color black = Color(0xFF242424);
  static const Color gold = Color(0xFFFACC1D);
  static const Color white = Color(0xFFF8F8F8);

  static ThemeData lightTheme =ThemeData(
    primaryColor: lightPrimary ,
    textTheme: GoogleFonts.elMessiriTextTheme(),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true ,
      titleTextStyle: GoogleFonts.elMessiri(
         color: black ,
        fontWeight: FontWeight.bold ,
        fontSize: 30,
      )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: lightPrimary ,
      unselectedItemColor: white ,
      selectedItemColor: black 
    )
  );

  static ThemeData darkTheme =ThemeData();
 
}