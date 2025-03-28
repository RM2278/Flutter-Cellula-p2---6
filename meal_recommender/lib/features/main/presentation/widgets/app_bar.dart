
import 'package:flutter/material.dart';

import '../../../../core/themes/color_palette.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: BaseColorPalette.mainColor,
            size: screenWidth * 0.09,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications,
            color: BaseColorPalette.mainColor,
            size: screenWidth * 0.09,
          ),
        ),
      ],
    );
  }
}
