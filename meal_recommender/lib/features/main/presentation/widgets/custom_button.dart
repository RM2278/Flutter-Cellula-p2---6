import 'package:flutter/material.dart';

import '../../../../core/themes/color_palette.dart';
import '../../../../core/widgets/custom_text_form_filed.dart';
import '../../../../core/widgets/text_widget.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key,required this.text,this.size_radius=10,required this.type,required this.ontap});
final text;
  final type;
final double size_radius;
final VoidCallback ontap;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool IsSelected=false;
  TextEditingController count=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:widget.ontap,
      child: Container(
       // padding: EdgeInsets.all(5),
        height: MediaQuery.sizeOf(context).height*49/776,
        width:MediaQuery.sizeOf(context).width*102/360,
        decoration: BoxDecoration(
          color: widget.text==widget.type?BaseColorPalette.mainColor:BaseColorPalette.white,
          border: Border.all(color:widget.text==widget.type?BaseColorPalette.mainColor:BaseColorPalette.gray,width: 1 ),
          borderRadius: BorderRadius.circular(widget.size_radius),
        ),
        alignment: Alignment.center,
        child: TextWidget(text: widget.text, size: 18,color: widget.text==widget.type?BaseColorPalette.white:BaseColorPalette.gray,),
      ),
    );
  }
}
