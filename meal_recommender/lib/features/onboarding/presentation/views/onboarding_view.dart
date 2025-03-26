import 'package:flutter/material.dart';

import '../widgets/splash_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnboardingScreen(),
    );
  }
}
