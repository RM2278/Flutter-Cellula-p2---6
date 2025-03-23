// login_text.dart
import 'package:flutter/material.dart';
import 'package:meal_recommender/core/routes/app_views.dart';
import 'package:meal_recommender/core/themes/color_palette.dart';

import '../../widgets/customtext.dart';

class RegisterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TextWidget(
          text: 'Don\'t have an account? ',
          size: 18,
          color: BaseColorPalette.white,
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, PageRouteName.registerView);
          },
          child: const TextWidget(
            text: 'register',
            size: 18,
            color: BaseColorPalette.white,
          ),
        ),
      ],
    );
  }
}
