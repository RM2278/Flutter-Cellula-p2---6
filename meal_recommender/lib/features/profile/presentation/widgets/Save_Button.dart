import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_recommender/core/constants/constants.dart';

import '../../../../core/themes/application_theme_manager.dart';
import '../../../../core/themes/color_palette.dart';

class SaveButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double screenWidth;

  const SaveButton({
    Key? key,
    required this.onPressed,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
      child: Material(
        color: const Color(0XFF001A3F),
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          onPressed: onPressed,
          height:screenWidth * 0.1,
          child: Container(
            width: double.infinity,
            height:screenWidth * 0.14,
            decoration: BoxDecoration(
              color: BaseColorPalette.mainColor,
              borderRadius: BorderRadius.circular(14),
            ),
            alignment: Alignment.center,
            child: Text(
              Constants.Save,
              style: ApplicationThemeManager.lightThemeData.textTheme.bodyLarge?.copyWith(
                color:  BaseColorPalette.white,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}