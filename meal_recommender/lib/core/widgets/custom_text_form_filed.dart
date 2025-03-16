import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../themes/color_palette.dart';

class CustomTextFormFiled extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isObscure;
  final TextInputType keyBoardType;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  const CustomTextFormFiled({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.isObscure = false,
    this.keyBoardType = TextInputType.text,
    required this.controller,
    required this.validator,
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
        hintStyle: const TextStyle(fontSize: 18, color: BaseColorPalette.white),
        filled: true,
        fillColor: Colors.transparent,
      ),
      style: const TextStyle(
        fontSize: 18,
        color: BaseColorPalette.white,
      ),
      keyboardType: keyBoardType,
      obscureText: isObscure,
      validator: validator,
      controller: controller,
      autofocus: false,
    );
  }
}
