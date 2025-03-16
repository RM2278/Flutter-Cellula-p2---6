import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommender/core/constants/image_paths.dart';
import 'package:meal_recommender/core/themes/color_palette.dart';


import '../../cubit/checkbox_cubit.dart';
import 'login_form.dart';
import 'register_text.dart';
import 'social_login_buttons.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (_) => CheckboxCubit(),
      child: Scaffold(
        body: Stack(
          children: [
            _buildBackground(),
            Container(
              width: double.infinity,
              height: double.infinity,
              color: BaseColorPalette.mainColor.withOpacity(0.9),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.08,
                        vertical: screenHeight * 0.05,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: screenHeight * 0.05),
                          Image.asset(
                            ImagePaths.logo,
                            height: screenHeight * 0.15,
                          ),
                          SizedBox(height: screenHeight * 0.1),
                          LoginForm(),
                          SizedBox(height: screenHeight * 0.02),
                          SocialLoginButtons(),
                          SizedBox(height: screenHeight * 0.03),
                          RegisterText(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
