import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../core/themes/color_palette.dart';

class Button_Add extends StatelessWidget {
  const Button_Add({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return FadeInDownBig(
      child: Align(
        alignment: Alignment.centerRight,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: BaseColorPalette.mainColor,
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.09, vertical: screenHeight * 0.010),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          onPressed: () {},
          child: Text(
            "add your ingredients",
            style: TextStyle(
                fontSize: screenWidth * 0.04, color: BaseColorPalette.white),
          ),
        ),
      ),
    );
  }
}
