import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultTextFormField(TextEditingController controller,bool isPass)
{
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: TextFormField(
      obscureText: isPass,
      controller: controller,
      style: TextStyle(
          color: Color(0XFF001A3F),
        fontSize: 18,
      ),
      cursorColor: Color(0XFF001A3F),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Color(0XFF838383),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Color(0XFF838383),
            width: 1,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
      ),
    ),
  );
}