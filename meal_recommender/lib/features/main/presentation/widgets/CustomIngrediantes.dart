import 'package:flutter/material.dart';

import '../../../../core/themes/color_palette.dart';
import '../../../../core/widgets/text_widget.dart';
import 'custom_text_form_filed.dart';

class CustomIngrediantes extends StatelessWidget {
   CustomIngrediantes({super.key,required this.ingredientsCount});
final ingredientsCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(text: "Number of \ningrediantes ", size: 20,color: BaseColorPalette.mainColor,fontWeight: FontWeight.bold,),
        SizedBox(width:  MediaQuery.sizeOf(context).width*70/360,),
        Container(
          width:  MediaQuery.sizeOf(context).width*100/360,
          height:  MediaQuery.sizeOf(context).height*80/776,
          child: CustomTextFormField(hintText: "", controller: ingredientsCount, validator: (_){

          },keyBoardType: TextInputType.number,),
        )
      ],
    );
  }
}
