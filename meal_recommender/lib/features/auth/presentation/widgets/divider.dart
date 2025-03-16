import 'package:flutter/material.dart';
import 'package:meal_recommender/core/themes/color_palette.dart';
import 'package:meal_recommender/features/auth/presentation/widgets/customtext.dart';

class customDivider extends StatelessWidget {
  const customDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return             Row(
  children: [
    Expanded(
      child: Divider(
        color: BaseColorPalette.white,
        thickness: 1,
  
      ),
    ),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 10), 
      child: TextWidget(text: 'or login with ', size: 12, color: BaseColorPalette.white,),
    ),
    Expanded(
      child: Divider(
         color: BaseColorPalette.white,
        thickness: 1,
       
      ),
    ),
  ],
);
  }
}