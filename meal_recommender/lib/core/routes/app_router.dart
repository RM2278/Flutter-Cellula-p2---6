import 'package:flutter/material.dart';
import 'package:meal_recommender/core/routes/app_views.dart';

import '../../features/ai/domain/entities/dish_entity.dart';
import '../../features/ai/presentation/pages/ai_view.dart';
import 'package:meal_recommender/features/main/presentation/pages/home.dart';

import '../../features/auth/presentation/Login/pages/login_page.dart';
import '../../features/auth/presentation/register/pages/register_view.dart';
import '../../features/auth/presentation/register/pages/verification_view.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
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
      case PageRouteName.profile:
        return MaterialPageRoute(
          builder: (context) =>  ProfileScreen(),
          settings: settings,
        );
      case PageRouteName.AiView:
        return MaterialPageRoute(
          builder: (context) => AiView(),
          settings: settings,
        );
      default:
        if (settings.name == PageRouteName.detailsView && settings.arguments is Dish) {
          final Dish args = settings.arguments as Dish;
          return MaterialPageRoute(
            builder: (context) => DetailsView(data: args),
            settings: settings, // Keep settings to preserve arguments
          );
        }
        return null;
    }
  }
}


