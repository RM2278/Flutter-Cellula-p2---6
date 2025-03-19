import 'package:flutter/material.dart';
import 'package:meal_recommender/core/routes/app_views.dart';

import 'package:meal_recommender/features/main/presentation/pages/home.dart';

import '../../features/auth/presentation/Login/pages/login_page.dart';
import '../../features/auth/presentation/register/pages/register_view.dart';
import '../../features/auth/presentation/register/pages/verification_view.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.LoginView:
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
