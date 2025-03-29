import 'package:flutter/material.dart';
import 'package:meal_recommender/core/routes/app_views.dart';

import '../../../../core/themes/color_palette.dart';

class Recipes_Header extends StatelessWidget {
  const Recipes_Header({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Top Recipes",
          style: TextStyle(
              color: BaseColorPalette.mainColor,
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: () => Navigator.pushNamed(context, PageRouteName.seeAllView),
          child: Text(
            "see all",
            style: TextStyle(
                color: BaseColorPalette.mainColor,
                fontSize: screenWidth * 0.04),
          ),
        ),
      ],
    );
  }
}
