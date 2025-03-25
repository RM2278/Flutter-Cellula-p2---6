import 'package:flutter/material.dart';
import 'package:meal_recommender/core/routes/app_views.dart';

import '../../features/ai/presentation/pages/ai_view.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      /*case PageRouteName.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );*/
        case PageRouteName.loginView:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
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
      case PageRouteName.homeView:
        return MaterialPageRoute(
          builder: (context) => const Home(),
          settings: settings,
        );
      case PageRouteName.AiView:
        return MaterialPageRoute(
          builder: (context) =>  AiView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const DetailsView(),
          settings: settings,
        );

    }
  }
}



