import 'package:flutter/material.dart';

import '../../../../core/themes/color_palette.dart';

class Search_Bar extends StatelessWidget {
  const Search_Bar({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: BaseColorPalette.border,
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(4, 6),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            Icons.search,
            color: BaseColorPalette.mainColor,
            size: screenWidth * 0.07,
          ),
          suffixIcon: Icon(
            Icons.filter_list,
            color: BaseColorPalette.mainColor,
            size: screenWidth * 0.06,
          ),
          hintText: "Search Recipes",
          hintStyle: TextStyle(
            fontSize: screenWidth * 0.05,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
                color: BaseColorPalette.border), // لون الحدود الافتراضي
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
                color: BaseColorPalette.border,
                width: 1), // الحدود عند عدم التركيز
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: BaseColorPalette.border,
              width: 1,
            ), // الحدود عند التركيز
          ),
        ),
      ),
    );
  }
}
