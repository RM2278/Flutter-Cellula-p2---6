import 'package:flutter/material.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlutterLogo(size: 100),
          SizedBox(height: 20),
          Text(
            'Welcome to Meal Recommender',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
