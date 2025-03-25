import 'package:flutter/material.dart';

import '../../../../core/constants/icon_paths.dart';
import '../../../../core/themes/color_palette.dart';
import '../../../../core/widgets/custom_text_form_filed.dart';

class AiBody extends StatelessWidget {
   AiBody({super.key});
  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context,index){
                  return Text("");
                })
        ),
        SizedBox(height: 32),
        Spacer(),
        Padding(
          padding: EdgeInsets.all(8),
          child: CustomTextFormFiled(
            color: BaseColorPalette.mainColor,
            hintText: "Enter your ingredients and your goal",
            controller: controller,
            validator: (_) {},
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Image.asset(IconPaths.send),
            ),
          ),
        )
      ],
    );
  }
}
