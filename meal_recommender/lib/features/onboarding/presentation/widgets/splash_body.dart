import 'package:flutter/material.dart';
import 'package:meal_recommender/core/routes/page_route_name.dart';
import 'package:meal_recommender/features/onboarding/presentation/widgets/OnboardingHeaderWidget.dart';
import 'package:meal_recommender/features/onboarding/presentation/widgets/OnboardingNavigationWidget.dart';
import 'package:meal_recommender/features/onboarding/presentation/widgets/OnboardingPageContentWidget.dart';
import 'package:meal_recommender/features/onboarding/presentation/widgets/curve.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      image: 'assets/images/onboarding1.png',
      title: 'Like in a Restaurant but at home',
      description:
          'Enjoy restaurant-quality meals in the comfort of your own kitchen with personalized recommendations.',
    ),
    OnboardingPage(
      image: 'assets/images/Onboarding2.png',
      title: 'Personalized Meal Plans',
      description:
          'Discover meals tailored to your taste preferences, dietary needs, and cooking skills.',
    ),
    OnboardingPage(
      image: 'assets/images/Onboarding3.png',
      title: 'Easy Recipes',
      description:
          'Step-by-step recipes that make cooking fun and accessible for all skill levels.',
    ),
    OnboardingPage(
      image: 'assets/images/Onboarding4.png',
      title: 'Customized Experience',
      description:
          'Get customized weekly meal plans based on your preferences, dietary restrictions, and cooking skills.',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _navigateToLogin();
    }
  }

  void _navigateToLogin() {
    Navigator.pushNamed(context, PageRouteName.loginView);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: OrientationBuilder(
        builder: (context, orientation) {
          return LayoutBuilder(
            builder: (context, constraints) {
              // Calculate responsive sizes
              final double screenWidth = constraints.maxWidth;
              final double screenHeight = constraints.maxHeight;
              final bool isPortrait = orientation == Orientation.portrait;

              // Responsive sizing
              final double logoSize = isPortrait
                  ? screenWidth * 0.2 > 100
                      ? 100
                      : screenWidth * 0.2
                  : screenHeight * 0.2 > 100
                      ? 100
                      : screenHeight * 0.2;

              return Stack(
                children: [
                  // Background curve
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: screenHeight * 0.56,
                      child: CustomPaint(
                        size: Size(screenWidth, 200),
                        painter: CurvedPainter(),
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Column(
                      children: [
                        // Logo header
                        OnboardingHeader(
                          logoSize: logoSize,
                        ),

                        // Page content
                        Expanded(
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: _pages.length,
                            onPageChanged: (int page) {
                              setState(() {
                                _currentPage = page;
                              });
                            },
                            itemBuilder: (context, index) {
                              return OnboardingPageContent(
                                page: _pages[index],
                                constraints: constraints,
                                isPortrait: isPortrait,
                              );
                            },
                          ),
                        ),

                        // Navigation
                        OnboardingNavigation(
                          currentPage: _currentPage,
                          pageCount: _pages.length,
                          onSkip: _navigateToLogin,
                          onNext: _onNextPressed,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class OnboardingPage {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
  });
}
