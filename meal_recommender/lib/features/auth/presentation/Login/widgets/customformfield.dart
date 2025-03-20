import 'package:flutter/material.dart';
import 'package:meal_recommender/core/themes/color_palette.dart';

class CustomTextFormFiled extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isObscure;
  final TextInputType keyBoardType;

  //final TextEditingController controller;
  const CustomTextFormFiled({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.isObscure = false,
    this.keyBoardType = TextInputType.text,
    //required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: BaseColorPalette.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: BaseColorPalette.white,
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 19, color: BaseColorPalette.white),
        filled: true,
        fillColor: Colors.transparent,
      ),
      style: const TextStyle(
        fontSize: 20,
        color: BaseColorPalette.white,
      ),
      keyboardType: keyBoardType,
      obscureText: isObscure,
      //controller: controller,
      autofocus: false,
    );
  }
}
