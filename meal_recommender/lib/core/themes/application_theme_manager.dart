import 'package:flutter/material.dart';
import 'package:meal_recommender/core/constants/constants.dart';
import 'package:meal_recommender/core/themes/color_palette.dart';

class ApplicationThemeManager {
  static ThemeData lightThemeData = ThemeData(
    primaryColor: BaseColorPalette.mainColor,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 28,
          fontFamily: Constants.fontName,
          fontWeight: FontWeight.w700,
          color: BaseColorPalette.black),
      bodyLarge: TextStyle(
          fontSize: 20,
          fontFamily: Constants.fontName,
          fontWeight: FontWeight.w400,
          color: BaseColorPalette.black),
      bodyMedium: TextStyle(
          fontSize: 18,
          fontFamily: Constants.fontName,
          fontWeight: FontWeight.w700,
          color: BaseColorPalette.black),
      bodySmall: TextStyle(
          fontSize: 16,
          fontFamily: Constants.fontName,
          fontWeight: FontWeight.w700,
          color: BaseColorPalette.black),
    ),
  );
}
