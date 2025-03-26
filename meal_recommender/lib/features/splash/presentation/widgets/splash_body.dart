import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meal_recommender/core/routes/page_route_name.dart';
import 'package:meal_recommender/features/splash/presentation/widgets/SplashLogoAnimationWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    _animationController.forward();
    _checkFirstTimeAndNavigate();
    //   Timer(const Duration(milliseconds: 4000), () {
    //     Navigator.pushNamed(context, PageRouteName.onboardingView);
    //   });
  }

  Future<void> _checkFirstTimeAndNavigate() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // Check if it's the first time opening the app
      bool? isFirstTime = prefs.getBool('first_time_open');

      // Wait for the animation to complete
      await Future.delayed(const Duration(milliseconds: 4000));

      if (isFirstTime == null || isFirstTime == true) {
        // First time opening the app
        // Mark that onboarding has been shown
        await prefs.setBool('first_time_open', false);

        // Navigate to OnboardingView
        Navigator.pushReplacementNamed(context, PageRouteName.onboardingView);
      } else {
        // Not first time, go to login or home screen
        Navigator.pushReplacementNamed(context, PageRouteName.loginView);
      }
    } catch (e) {
      // Fallback navigation in case of any errors
      Navigator.pushReplacementNamed(context, PageRouteName.onboardingView);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001A3F),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SplashLogoAnimation(
            animation: _animation,
            screenWidth: constraints.maxWidth,
            screenHeight: constraints.maxHeight,
          );
        },
      ),
    );
  }
}
