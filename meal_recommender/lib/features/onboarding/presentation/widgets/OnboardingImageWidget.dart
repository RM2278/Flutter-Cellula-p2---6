import 'package:flutter/material.dart';

class OnboardingImage extends StatelessWidget {
  final String imagePath;
  final double imageSize;

  const OnboardingImage({
    Key? key,
    required this.imagePath,
    required this.imageSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate responsive sizing
        final double containerWidth = constraints.maxWidth < imageSize
            ? constraints.maxWidth * 0.9
            : imageSize * 1.1;

        final double containerHeight = containerWidth;

        return Container(
          width: containerWidth,
          height: containerHeight,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xff001A3F), width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: containerWidth * 0.9,
              height: containerHeight * 0.9,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
