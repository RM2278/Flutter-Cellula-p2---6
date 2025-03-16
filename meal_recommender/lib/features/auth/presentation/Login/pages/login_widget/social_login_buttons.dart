// social_login_buttons.dart
import 'package:flutter/material.dart';
import 'package:meal_recommender/core/constants/icon_paths.dart';
import 'package:meal_recommender/core/themes/color_palette.dart';

class SocialLoginButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Color(0xff0047FF),
          child: Image.asset(
            IconPaths.facebook,
            width: 35,
            height: 35,
          ),
        ),
        CircleAvatar(
          radius: 30,
          backgroundColor: BaseColorPalette.white,
          child: Image.asset(
            IconPaths.google,
            width: 35,
            height: 35,
          ),
        ),
      ],
    );
  }
}
