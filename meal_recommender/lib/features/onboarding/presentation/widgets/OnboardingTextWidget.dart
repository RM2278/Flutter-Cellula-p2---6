import 'package:flutter/material.dart';

class OnboardingText extends StatelessWidget {
  final String title;
  final String description;
  final double maxWidth;

  const OnboardingText({
    Key? key,
    required this.title,
    required this.description,
    required this.maxWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate responsive font sizes
        final double titleSize = _calculateResponsiveFontSize(
            maxWidth: constraints.maxWidth, baseSize: 24, scaleFactor: 0.06);

        final double descriptionSize = _calculateResponsiveFontSize(
            maxWidth: constraints.maxWidth, baseSize: 16, scaleFactor: 0.04);

        return Container(
          constraints: BoxConstraints(maxWidth: maxWidth),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: const Color(0xff001A3F),
                  fontSize: titleSize,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
              const SizedBox(height: 20),
              Text(
                description,
                style: TextStyle(
                  color: const Color(0xff001A3F),
                  fontSize: descriptionSize,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ],
          ),
        );
      },
    );
  }

  double _calculateResponsiveFontSize(
      {required double maxWidth,
      required double baseSize,
      required double scaleFactor}) {
    final double calculatedSize = maxWidth * scaleFactor;
    return calculatedSize > baseSize ? baseSize : calculatedSize;
  }
}
