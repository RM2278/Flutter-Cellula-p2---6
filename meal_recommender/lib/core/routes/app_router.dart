import 'package:flutter/material.dart';
import 'package:meal_recommender/core/routes/app_views.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
      case PageRouteName.onboardingView:
        return MaterialPageRoute(
          builder: (context) => const OnboardingView(),
          settings: settings,
        );
      case PageRouteName.registerView:
        return MaterialPageRoute(
          builder: (context) => const RegisterView(),
          settings: settings,
        );
      case PageRouteName.verificationView:
        return MaterialPageRoute(
          builder: (context) => const VerificationView(),
          settings: settings,
        );
      case PageRouteName.HomeView:
        return MaterialPageRoute(
          builder: (context) => const Home(),
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


