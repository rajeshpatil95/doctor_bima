import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData appThemeLight() {
    return ThemeData(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(color: Colors.white));
  }
}
