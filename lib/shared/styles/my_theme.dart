import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: whiteColor,
          onPrimary: Colors.white,
          secondary: whiteColor,
          onSecondary: whiteColor,
          error: Colors.red,
          onError: Colors.deepPurple,
          background: Colors.pink,
          onBackground: Colors.greenAccent,
          surface: Colors.deepOrange,
          onSurface: Colors.black),
      primaryColor: primaryColor,
      scaffoldBackgroundColor: minit,
      textTheme: TextTheme(
        bodySmall: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
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
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: darkColor,
      primaryColor: whiteColor,
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: darkColor,
          onPrimary: Colors.white,
          secondary: darkColor,
          onSecondary: whiteColor,
          error: Colors.green,
          onError: Colors.deepPurple,
          background: Colors.pink,
          onBackground: Colors.greenAccent,
          surface: Colors.deepOrange,
          onSurface: Colors.white),
      textTheme: TextTheme(
      bodySmall: const TextStyle(
      fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white)
  )

  ,

  );
}
