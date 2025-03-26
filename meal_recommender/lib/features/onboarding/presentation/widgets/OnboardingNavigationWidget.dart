import 'package:flutter/material.dart';
import 'package:meal_recommender/features/onboarding/presentation/widgets/PageIndicatorWidget.dart';

class OnboardingNavigation extends StatelessWidget {
  final int currentPage;
  final int pageCount;
  final VoidCallback onSkip;
  final VoidCallback onNext;

  const OnboardingNavigation({
    Key? key,
    required this.currentPage,
    required this.pageCount,
    required this.onSkip,
    required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive text sizing
        final double buttonFontSize = constraints.maxWidth * 0.045 > 18
            ? 18
            : constraints.maxWidth * 0.045;

        return Padding(
          padding: EdgeInsets.all(constraints.maxWidth * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Skip button
              TextButton(
                onPressed: onSkip,
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: const Color(0xff0A2E60),
                    fontSize: buttonFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Page indicators
              Row(
                children: List.generate(
                  pageCount,
                  (index) => PageIndicator(
                    isActive: currentPage == index,
                    index: index,
                  ),
                ),
              ),

              // Next button with animation
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 800),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(0.0, 50 * (1 - value)),
                    child: child,
                  );
                },
                child: TextButton(
                  onPressed: onNext,
                  child: Text(
                    currentPage < pageCount - 1 ? 'Next' : 'Login',
                    style: TextStyle(
                      color: const Color(0xff0A2E60),
                      fontSize: buttonFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
