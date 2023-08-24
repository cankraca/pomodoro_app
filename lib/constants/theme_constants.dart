import 'package:flutter/material.dart';

class ThemeConstants {
  static final ThemeData lightTheme = ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.green,
          width: 2,
        ),
      ),
    ),
    colorSchemeSeed: Colors.greenAccent,
    brightness: Brightness.light,
    sliderTheme: const SliderThemeData(
      showValueIndicator: ShowValueIndicator.always,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.green,
          width: 2,
        ),
      ),
    ),
    colorSchemeSeed: Colors.greenAccent,
    brightness: Brightness.dark,
    sliderTheme: const SliderThemeData(
      showValueIndicator: ShowValueIndicator.always,
    ),
  );
}
