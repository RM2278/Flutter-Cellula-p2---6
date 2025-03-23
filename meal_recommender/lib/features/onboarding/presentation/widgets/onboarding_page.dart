import 'package:flutter/material.dart';

class OnboardingPage {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
  });

  Widget buildImage() {
    return SizedBox(
      width: 280,
      height: 280,
      child: Center(child: Image.asset(image)),
    );
  }
}
