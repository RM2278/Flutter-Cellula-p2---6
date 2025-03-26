import 'package:flutter/material.dart';

class SplashLogoAnimation extends StatelessWidget {
  final Animation<double> animation;
  final double screenWidth;
  final double screenHeight;

  const SplashLogoAnimation({
    Key? key,
    required this.animation,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate responsive dimensions
    final double logoSize = screenWidth * 0.25 > 100 ? 100 : screenWidth * 0.25;
    final double paddingSize = logoSize * 0.2;

    return Center(
      child: FadeTransition(
        opacity: animation,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(paddingSize),
          child: Image.asset(
            'assets/images/logo.png',
            width: logoSize,
            height: logoSize,
          ),
        ),
      ),
    );
  }
}
