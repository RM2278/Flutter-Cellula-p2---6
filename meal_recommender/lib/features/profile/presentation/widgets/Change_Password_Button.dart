import 'package:flutter/material.dart';
import 'package:meal_recommender/core/constants/constants.dart';

import '../../../../core/themes/application_theme_manager.dart';
import '../../../../core/themes/color_palette.dart';

Widget ChangePasswordButton(double screenWidth, VoidCallback onPressed) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
    child: SizedBox(
      width: double.infinity,
      height: screenWidth * 0.14,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: BaseColorPalette.mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child:  Text(
          Constants.changePassword,
          style: ApplicationThemeManager.lightThemeData.textTheme.bodyLarge?.copyWith(
            color:  BaseColorPalette.white,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    ),
  );
}
