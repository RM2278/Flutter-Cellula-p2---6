import 'package:flutter/material.dart';
import 'package:meal_recommender/core/themes/color_palette.dart';
import 'package:meal_recommender/core/widgets/custom_text_form_filed.dart';
import 'package:meal_recommender/features/ai/presentation/widgets/ai_body.dart';

import '../../../../core/constants/icon_paths.dart';

class AiView extends StatelessWidget {
   AiView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: AiBody()


    );
  }
}