import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/themes/color_palette.dart';

Widget defaultTextFormField(TextEditingController controller, bool isPass, BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
    child: TextFormField(
      obscureText: isPass,
      controller: controller,
      style: TextStyle(
        color: BaseColorPalette.mainColor,
        fontSize: screenWidth * 0.045,
      ),
      cursorColor: BaseColorPalette.mainColor,
      decoration: InputDecoration(
        fillColor: BaseColorPalette.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.02),
          borderSide: const BorderSide(
            color: BaseColorPalette.gray,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.02),
          borderSide: const BorderSide(
            color: BaseColorPalette.gray,
            width: 1,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.02,
          horizontal: screenWidth * 0.04,
        ),
      ),
    ),
  );
}
