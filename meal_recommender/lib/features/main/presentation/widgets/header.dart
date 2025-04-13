import 'package:flutter/material.dart';

import '../../../../core/themes/color_palette.dart';
import '../../../../core/widgets/text_widget.dart';

class Header extends StatelessWidget {
   Header({super.key,required this.ontap});
final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidget(text: "Filter", size: 24,color: Colors.black,fontWeight: FontWeight.bold,),
Spacer(),
        InkWell(
            onTap: (){

            },
            child: InkWell(
                onTap: ontap,
                child: TextWidget(text: "Reset", size: 18,color: BaseColorPalette.Rest_filter,))),
      ],
    );
  }
}
