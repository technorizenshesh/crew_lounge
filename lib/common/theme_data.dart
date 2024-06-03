import 'package:flutter/material.dart';

class MThemeData {
  static ThemeData themeData() {
    return ThemeData(
      fontFamily: 'FontBold',
      primarySwatch: Colors.blue,
      // primarySwatch:  Colors.lightBlue,
      primaryColor: const Color(0xff0054B4),
      secondaryHeaderColor: const Color(0xff0054B4), //Primary2Color
      backgroundColor: const Color(0xff0054B4),
      hintColor: const Color(0xff0054B4),
      focusColor: const Color(0xff0054B4), // TextColor
      hoverColor: const Color(0xff0054B4),
      highlightColor: const Color(0xff0054B4), // primary3Color
      unselectedWidgetColor: const Color(0xff0054B4), // primary3Color
    );
  }
}
