import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget saveButton(var onPressed,var screenwidth)
{
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: screenwidth*0.06,),
    child: Material(
      color: Color(0XFF001A3F),
      borderRadius: BorderRadius.circular(10),
      child: MaterialButton(
        onPressed: onPressed,
        height: 68,
        child: Container(
          width: double.infinity,
          height: 68,
          decoration: BoxDecoration(
            color: Color(0XFF001A3F),
            borderRadius: BorderRadius.circular(14),
          ),
          // padding: EdgeInsetsDirectional.symmetric(vertical: 15),
          alignment: Alignment.center,
          child: Text(
            'Save',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    ),
  );
}