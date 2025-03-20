// social_login_buttons.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommender/core/constants/icon_paths.dart';
import 'package:meal_recommender/core/themes/color_palette.dart';
import 'package:meal_recommender/features/auth/presentation/Login/cubit/google_cubit/cubit/google_cubit.dart';

class SocialLoginButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Color(0xff0047FF),
          child: Image.asset(
            IconPaths.facebook,
            width: 35,
            height: 35,
          ),
        ),
        InkWell(
          onTap: () {
            context.read<GoogleAuthCubit>().signInWithGoogle();
          },
          child: CircleAvatar(
            radius: 30,
            backgroundColor: BaseColorPalette.white,
            child: Image.asset(
              IconPaths.google,
              width: 35,
              height: 35,
            ),
          ),
        ),
      ],
    );
  }
}
