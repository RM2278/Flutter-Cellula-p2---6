import 'package:flutter/material.dart';
import 'package:meal_recommender/core/routes/app_views.dart';

import '../widgets/splash_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }
}
