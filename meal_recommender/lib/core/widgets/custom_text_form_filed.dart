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
  final Color color;
  const CustomTextFormFiled({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.isObscure = false,
    this.keyBoardType = TextInputType.text,
    required this.controller,
    required this.validator,
    this.color=BaseColorPalette.white
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:  BorderSide(
            color: color,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:  BorderSide(
            color: color,
          ),
        ),
        hintText: hintText,
        hintStyle:  TextStyle(fontSize: 18, color: color),
        filled: true,
        fillColor: Colors.transparent,
      ),
      style:  TextStyle(
        fontSize: 18,
        color: color,
      ),
      keyboardType: keyBoardType,
      obscureText: isObscure,
      validator: validator,
      controller: controller,
      autofocus: false,
    );
  }
}
