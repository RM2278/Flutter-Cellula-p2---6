import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_recommender/features/profile/presentation/screens/profile_image_picker.dart';
import 'package:meal_recommender/features/profile/presentation/screens/profile_screen_body.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/themes/color_palette.dart';
import '../cubit/profile_cubit.dart';
import '../../domain/entities/profile_entity.dart';
import '../cubit/profile_state.dart';
import 'change_password_dialog.dart';

class ProfileScreenContent extends StatefulWidget {
  const ProfileScreenContent({super.key});

  @override
  State<ProfileScreenContent> createState() => _ProfileScreenContentState();
}

class _ProfileScreenContentState extends State<ProfileScreenContent> {
  File? _image;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().fetchProfile();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    newPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void _updateProfile() {
    if (nameController.text.isEmpty || emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(Constants.pleaseFillFields)),
      );
      return;
    }

    final updatedProfile = ProfileEntity(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: '',
      profileImageUrl: _image?.path ?? '',
    );

    context.read<ProfileCubit>().updateProfile(updatedProfile).then((_) {
      context.read<ProfileCubit>().fetchProfile();
    });
  }

  Future<bool> _changePassword() async {
    String currentPassword = passwordController.text.trim();
    String newPassword = newPasswordController.text.trim();

    if (currentPassword.isEmpty || newPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(Constants.pleaseEnterBothPassword)),
      );
      return false;
    }

    try {
      User? user = FirebaseAuth.instance.currentUser;
      AuthCredential credential = EmailAuthProvider.credential(
        email: user!.email!,
        password: currentPassword,
      );

      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(Constants.passwordUpdatedSuccces)),
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == Constants.wrongPassword) {
        return false;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("${Constants.Error} ${e.message}")),
      );
      return false;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("${Constants.unexpectedError} $e")),
      );
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu_sharp, color: BaseColorPalette.mainColor, size: screenWidth * 0.06),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: BaseColorPalette.mainColor, size: screenWidth * 0.08),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: ProfileBody(
          imageFile: _image,
          onEditPressed: () async {
            _image = await ProfileImagePicker.pickImage(context);
            if (_image != null) {
              setState(() {});
            }
          },
          nameController: nameController,
          emailController: emailController,
          phoneController: phoneController,
          onSavePressed: _updateProfile,
          onChangePressed: () => ChangePasswordDialog.show(
            context: context,
            passwordController: passwordController,
            newPasswordController: newPasswordController,
            onSave: _changePassword,
          ),
          profileImageUrl: (context.read<ProfileCubit>().state is ProfileLoaded)
              ? (context.read<ProfileCubit>().state as ProfileLoaded).profile.profileImageUrl
              : '',
        ),
      ),
    );
  }
}

