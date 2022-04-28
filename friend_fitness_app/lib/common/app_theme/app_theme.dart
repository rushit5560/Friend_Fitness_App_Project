import 'package:flutter/material.dart';

ThemeData appLightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedLabelStyle: TextStyle(fontSize: 0),
    ),
  );
}