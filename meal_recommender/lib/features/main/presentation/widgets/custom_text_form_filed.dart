import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/themes/color_palette.dart';


class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isObscure;
  final TextInputType keyBoardType;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  const CustomTextFormField({
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
    return Padding(
      padding: EdgeInsets.zero,
      child: TextFormField(

        textAlign: TextAlign.center,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: BaseColorPalette.gray,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: BaseColorPalette.gray,
            ),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 15, color: BaseColorPalette.black),
          filled: true,
          fillColor: Colors.transparent,
        ),
        style: const TextStyle(
          fontSize: 15,
          color: Colors.black,
        ),
        keyboardType: keyBoardType,
        obscureText: isObscure,
        validator: validator,
        controller: controller,
        autofocus: false,
      ),
    );
  }
}
