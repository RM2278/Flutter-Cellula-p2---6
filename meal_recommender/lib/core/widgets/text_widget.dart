import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double size;
  final Color color;
  final TextAlign align;
  final TextDecoration? decoration;

  const TextWidget({
    super.key,
    required this.text,
    required this.size,
    this.fontWeight = FontWeight.w400,
    this.align = TextAlign.start,
    this.color = Colors.white,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        decoration: decoration,
        decorationColor: Colors.white,
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}