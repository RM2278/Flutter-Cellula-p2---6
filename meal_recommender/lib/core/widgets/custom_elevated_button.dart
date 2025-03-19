import 'package:flutter/material.dart';
import 'package:meal_recommender/core/widgets/text_widget.dart';

import '../themes/color_palette.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.buttonColor = BaseColorPalette.white,
    this.textColor = BaseColorPalette.mainColor,
  });
  final VoidCallback? onPressed;
  final String text;
  final Color buttonColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width * 0.8,
            MediaQuery.of(context).size.height * 0.08),
        backgroundColor: buttonColor,
        padding: const EdgeInsets.all(14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: TextWidget(
        text: text,
        size: 24,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
    );
  }
}
