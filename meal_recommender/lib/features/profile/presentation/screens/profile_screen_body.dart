import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/constants.dart';
import '../widgets/Change_Password_Button.dart';
import '../widgets/Save_Button.dart';
import 'ProfileAvatar.dart';
import 'ProfileForm.dart';
import '../cubit/profile_cubit.dart';
import '../cubit/profile_state.dart';

class ProfileBody extends StatelessWidget {
   File? imageFile;
  final VoidCallback onEditPressed;
  final VoidCallback onChangePressed;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final VoidCallback onSavePressed;
   String profileImageUrl;

   ProfileBody({
    required this.imageFile,
    required this.onEditPressed,
    required this.onChangePressed,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.onSavePressed,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoaded) {
          nameController.text = state.profile.name;
          emailController.text = state.profile.email;
          phoneController.text=state.profile.phone;

        }


        else if (state is ProfileUpdated) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text(Constants.profileUpdatedSuccces)),
          );
        } else if (state is ProfileError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoaded) {
            nameController.text = state.profile.name;
            emailController.text = state.profile.email;
            phoneController.text=state.profile.phone;
            profileImageUrl = state.profile.profileImageUrl;

          } else if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: ProfileAvatar(
                    onEditPressed: onEditPressed,
                    imageFile: imageFile,
                    profileImageUrl: profileImageUrl,
                  ),
                ),
                SizedBox(height: screenWidth * 0.09),
                ProfileForm(
                  nameController: nameController,
                  emailController: emailController,
                  phoneController: phoneController,
                ),
                SizedBox(height: screenWidth * 0.09),
                ChangePasswordButton(screenWidth,onChangePressed),
                SizedBox(height: screenWidth * 0.05),
                SaveButton(
                  onPressed: onSavePressed,
                  screenWidth: screenWidth,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}