import 'package:flutter/material.dart';
import 'package:meal_recommender/features/onboarding/presentation/widgets/OnboardingImageWidget.dart';
import 'package:meal_recommender/features/onboarding/presentation/widgets/OnboardingTextWidget.dart';

class OnboardingPageContent extends StatelessWidget {
  final dynamic page;
  final BoxConstraints constraints;
  final bool isPortrait;

  const OnboardingPageContent({
    Key? key,
    required this.page,
    required this.constraints,
    this.isPortrait = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate responsive image size
    final double imageSize = isPortrait
        ? (constraints.maxWidth * 0.7 > 300 ? 300 : constraints.maxWidth * 0.7)
        : (constraints.maxHeight * 0.5 > 250
            ? 250
            : constraints.maxHeight * 0.5);

    // Adjust layout based on orientation
    return SingleChildScrollView(
      child: isPortrait
          ? _buildPortraitLayout(imageSize)
          : _buildLandscapeLayout(imageSize),
    );
  }

  Widget _buildPortraitLayout(double imageSize) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: constraints.maxHeight * 0.05),
        OnboardingImage(
          imagePath: page.image,
          imageSize: imageSize,
        ),
        OnboardingText(
          title: page.title,
          description: page.description,
          maxWidth: constraints.maxWidth * 0.9,
        ),
      ],
    );
  }

  Widget _buildLandscapeLayout(double imageSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OnboardingImage(
          imagePath: page.image,
          imageSize: imageSize,
        ),
        OnboardingText(
          title: page.title,
          description: page.description,
          maxWidth: constraints.maxWidth * 0.4,
        ),
      ],
    );
  }
}
