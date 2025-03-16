// login_text.dart
import 'package:flutter/material.dart';
import 'package:meal_recommender/core/themes/color_palette.dart';

import '../../../../../core/routes/page_route_name.dart';
import '../../../../../core/widgets/text_widget.dart';


class LoginText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TextWidget(
          text: 'Do have an account? ',
          size: 18,
          color: BaseColorPalette.white,
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, PageRouteName.initial);
          },
          child: const TextWidget(
            text: 'Login',
            size: 18,
            color: BaseColorPalette.white,
          ),
        ),
      ],
    );
  }
}