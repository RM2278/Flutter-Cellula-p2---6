import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meal_recommender/core/routes/page_route_name.dart';

class SplashScreenBody extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  // ignore: unused_field
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 5000),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    _animationController.forward();

    Timer(Duration(milliseconds: 4000), () {
      Navigator.pushNamed(context, PageRouteName.onboardingView);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF001A3F),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(20),
          child: Image.asset(
            'assets/images/logo.png',
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}
