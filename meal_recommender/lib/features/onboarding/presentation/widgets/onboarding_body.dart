import 'package:flutter/material.dart';
import 'package:meal_recommender/core/routes/page_route_name.dart';
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
    const OnboardingPage(
      image: 'assets/images/onboarding1.png',
      title: 'Like in a Restaurant but at home',
      description:
          'consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea qui officia deserunt mollit anim id est laborum.',
    ),
    const OnboardingPage(
      image: 'assets/images/Onboarding2.png',
      title: 'Like in a Restaurant but at home',
      description:
          'consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea qui officia deserunt mollit anim id est laborum.',
    ),
    const OnboardingPage(
      image: 'assets/images/Onboarding3.png',
      title: 'Like in a Restaurant but at home',
      description:
          ' consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea qui officia deserunt mollit anim id est laborum.',
    ),
    const OnboardingPage(
      image: 'assets/images/Onboarding4.png',
      title: 'Like in a Restaurant but at home',
      description:
          'Get customized weekly meal plans based on your preferences, dietary restrictions, and cooking skill level for a truly tailored experience.',
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
    // Navigate to the log in screen
    Navigator.pushNamed(context, PageRouteName.loginView);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: CustomPaint(
                size: Size(MediaQuery.of(context).size.width, 200),
                painter: CurvedPainter(),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                // Top chef hat icon
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset('assets/images/logo.png',
                        width: 80, height: 80),
                  ),
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
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Image container
                          Container(
                            width: 300,
                            height: 300,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: const Color(0xff001A3F), width: 1),
                            ),
                            child: Container(
                              width: 250,
                              height: 250,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: ClipOval(
                                child: _pages[index].buildImage(),
                              ),
                            ),
                          ),

                          // Text content
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                Text(
                                  _pages[index].title,
                                  style: const TextStyle(
                                    color: Color(0xff001A3F),
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  _pages[index].description,
                                  style: const TextStyle(
                                    color: Color(0xff001A3F),
                                    fontSize: 16,
                                    height: 1.5,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                // Navigation
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Skip button
                      TextButton(
                        onPressed: _navigateToLogin,
                        child: const Text(
                          'skip',
                          style: TextStyle(
                            color: Color(0xff0A2E60),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // Page indicators
                      Row(
                        children: List.generate(
                          _pages.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            height: 12,
                            width: _currentPage == index ? 40 : 30,
                            decoration: BoxDecoration(
                              color: _currentPage == index
                                  ? const Color(0xFF0A2E60)
                                  : const Color(0xffD9D9D9),
                              borderRadius: BorderRadius.circular(8),
                              border: _currentPage == index
                                  ? Border.all(color: Colors.white, width: 1)
                                  : null,
                            ),
                          ),
                        ),
                      ),

                      // Next button with animation
                      TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0.0, end: 1.0),
                        duration: const Duration(milliseconds: 800),
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset(0.0, 50 * (1 - value)),
                            child: child,
                          );
                        },
                        child: TextButton(
                          onPressed: _onNextPressed,
                          child: Text(
                            _currentPage < _pages.length - 1 ? 'next' : 'Login',
                            style: const TextStyle(
                              color: Color(0xff0A2E60),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
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

  Widget buildImage() {
    return Container(
      width: 280,
      height: 280,
      child: Center(child: Image.asset(image)),
    );
  }
}