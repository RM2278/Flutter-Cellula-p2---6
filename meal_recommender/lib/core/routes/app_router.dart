import 'package:flutter/material.dart';
import 'package:meal_recommender/core/routes/app_views.dart';
import 'package:meal_recommender/features/auth/presentation/pages/login.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.initial:
        return MaterialPageRoute(
          builder: (context) => const Login(),
          settings: settings,
        );
      case PageRouteName.onboardingView:
        return MaterialPageRoute(
          builder: (context) => const OnboardingView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const OnboardingView(),
          settings: settings,
        );

    }
  }
}


