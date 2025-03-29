import 'package:flutter/material.dart';
import 'package:meal_recommender/features/profile/presentation/widgets/Form_Field.dart';

class ProfileForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  const ProfileForm({
    Key? key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        defaultTextFormField(nameController, false, context),
        SizedBox(height: screenWidth * 0.06),
        defaultTextFormField(emailController, false, context),
        SizedBox(height: screenWidth * 0.06),
        defaultTextFormField(phoneController, false, context),
      ],
    );
  }
}

