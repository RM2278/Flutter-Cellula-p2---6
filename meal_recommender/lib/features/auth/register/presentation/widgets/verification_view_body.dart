import 'package:flutter/material.dart';
import 'package:meal_recommender/core/widgets/custom_elevated_button.dart';
import 'package:meal_recommender/core/widgets/text_widget.dart';

import '../../../../../core/constants/image_paths.dart';
import '../../../../../core/themes/color_palette.dart';

class VerificationViewBody extends StatelessWidget {
  const VerificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColorPalette.mainColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Image.asset(
                    ImagePaths.logo,
                  ),
                ),
                const TextWidget(
                  align: TextAlign.center,
                  text: "Check your inbox ",
                  size: 18,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.03,
                ),
                CustomElevatedButton(
                  onPressed: () {},
                  text: "Continue",
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
