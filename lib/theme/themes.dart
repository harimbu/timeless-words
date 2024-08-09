import 'package:flutter/material.dart';

class Themes {
  static Color accent = const Color(0xFF00B855);
  static Color bg1 = const Color(0xFFEAEAEA);
  static Color bg2 = const Color(0xFFE0E0E0);
  static Color primary = const Color(0xFF000000);
  static Color second = const Color(0xFF333333);

  static Color darkBg1 = const Color(0xFF111111);
  static Color darkBg2 = const Color(0xFF000000);
  static Color darkPrimary = const Color(0xFFFFFFFF);
  static Color darkSecond = const Color(0xFFD4D4D4);

  static final dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: darkBg1,
    appBarTheme: AppBarTheme(
      toolbarHeight: 90,
      elevation: 0,
      backgroundColor: darkBg1,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        color: darkPrimary,
      ),
      bodyLarge: TextStyle(
        color: darkPrimary,
        fontSize: 18,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.0,
        color: darkSecond,
      ),
      bodySmall: TextStyle(
        fontSize: 14.0,
        color: darkSecond,
      ),
    ),
    iconTheme: IconThemeData(
      color:darkSecond,
    ),

  );

  static final light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: bg1,
    appBarTheme: AppBarTheme(
      toolbarHeight: 90,
      elevation: 0,
      backgroundColor: bg1,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: primary,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: primary,
      ),
      bodyLarge: TextStyle(
        color: primary,
        fontSize: 18,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.0,
        color: second,
      ),
      bodySmall: TextStyle(
        fontSize: 14.0,
        color: second,
      ),
    ),
    iconTheme: IconThemeData(
      color: second,
    ),
  );
}
