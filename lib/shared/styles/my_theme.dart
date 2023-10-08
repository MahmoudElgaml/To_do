import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: minit,
      textTheme: TextTheme(
        bodySmall:TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blue
        ),
        bodyLarge: GoogleFonts.elMessiri(
          color: blackColor,
          fontSize: 30,
          fontWeight: FontWeight.w500,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
      ));
  static ThemeData darkTheme = ThemeData();
}
