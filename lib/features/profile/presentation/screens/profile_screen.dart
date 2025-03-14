import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/formField.dart';
import '../widgets/saveButton.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name_controller = new TextEditingController(text: 'Ahmed Muslim');
    TextEditingController email_controller = new TextEditingController(text: 'ahmedmuslim@gmail.com');
    TextEditingController phone_controller = new TextEditingController(text: '+201015466730');
    TextEditingController password_controller = new TextEditingController(text: '1234567890000');
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){},
          icon: Icon(
            Icons.menu_sharp,
            color: Color(0XFF001A3F),
            size: 30,
          ),
        ),
        actions: [
          IconButton(onPressed: (){},
              icon: Icon(
                Icons.notifications,
                color: Color(0XFF001A3F),
                size: 30,
              ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Center(
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0XFFD9D9D9),
                  radius: 75,
                ),
                CircleAvatar(
                  child: Image.asset('assets/icons/Edit.png',
                    width: 50,height: 50,),
                  backgroundColor: Color(0XFF001A3F),
                  radius: 28,
                ),
              ],
            ),
          ),
            SizedBox(height: screenWidth*0.09,),
            defaultTextFormField(name_controller,false),
            SizedBox(height: screenWidth*0.06,),
            defaultTextFormField(email_controller,false),
            SizedBox(height: screenWidth*0.06,),
            defaultTextFormField(phone_controller,false),
            SizedBox(height: screenWidth*0.06,),
            defaultTextFormField(password_controller,true),
            SizedBox(height: screenWidth*0.12,),
            saveButton((){},screenWidth),
          ],),
      ),
    );
  }
}

