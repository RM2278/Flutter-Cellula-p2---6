import 'package:flutter/material.dart';
import '../../../../core/themes/color_palette.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final VoidCallback onToggleObscure;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.obscureText,
    required this.onToggleObscure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(
        fontSize: screenWidth * 0.03,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(fontSize: screenWidth * 0.045),
        contentPadding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.03,
          horizontal: screenWidth * 0.04,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: BaseColorPalette.mainColor, width: 2),
          borderRadius: BorderRadius.circular(screenWidth * 0.025),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color:BaseColorPalette.gray , width: 2),
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey.shade600,
            size: screenWidth * 0.05,
          ),
          onPressed: onToggleObscure,
        ),
      ),
    );
  }
}
