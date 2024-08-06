import 'package:flutter/material.dart';

class Themes {
  static Color accent = const Color(0xFF00B855);
  static Color bg1 = const Color(0xFFF2F6FF);
  static Color bg2 = const Color(0xFFE8EEFF);
  static Color bg3 = const Color(0xFFDDE6FF);
  static Color bg4 = const Color(0xFFBEBEBE);
  static Color darkBg1 = const Color(0xFF111111);
  static Color darkBg2 = const Color(0xFF222222);
  static Color darkBg3 = const Color(0xFF666666);

  static Color white = const Color(0xFFFFFFFF);
  static Color black = const Color(0xFF000000);

  static final light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: bg2,
    appBarTheme: AppBarTheme(
      toolbarHeight: 80,
      elevation: 0,
      backgroundColor: bg2,
      iconTheme: IconThemeData(
        color: darkBg1,
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: darkBg1,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: darkBg1,
      ),
      bodyLarge: TextStyle(
        color: darkBg1,
        fontSize: 18,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        color: darkBg3,
      ),
      bodySmall: const TextStyle(
        fontSize: 14.0,
      ),
    ),
  );

  static final dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: darkBg2,
    appBarTheme: AppBarTheme(
      toolbarHeight: 80,
      elevation: 0,
      backgroundColor: darkBg2,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: bg1,
      ),
      bodyLarge: TextStyle(
        color: bg1,
        fontSize: 18,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        color: bg4,
      ),
      bodySmall: const TextStyle(
        fontSize: 14.0,
      ),
    ),
  );
}
