import 'package:flutter/material.dart';
import 'dart:io';

import '../../../../core/themes/color_palette.dart';

class ProfileAvatar extends StatelessWidget {
  final VoidCallback onEditPressed;
  final File? imageFile;
  final String profileImageUrl;

  const ProfileAvatar({
    Key? key,
    required this.onEditPressed,
    this.imageFile,
    required this.profileImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double avatarRadius = screenWidth * 0.18;
    double editIconRadius = screenWidth * 0.05;

    ImageProvider? imageProvider;
    if (imageFile != null) {
      imageProvider = FileImage(imageFile!);
    } else if (profileImageUrl.isNotEmpty) {
      imageProvider = NetworkImage(profileImageUrl);
    } else {
      imageProvider = null;
    }

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          backgroundColor: BaseColorPalette.lightGray,
          radius: avatarRadius,
          backgroundImage: imageProvider,
        ),
        GestureDetector(
          onTap: onEditPressed,
          child: CircleAvatar(
            radius: editIconRadius,
            backgroundColor: BaseColorPalette.mainColor,
            child: Icon(
              Icons.edit,
              color: Colors.white,
              size: screenWidth * 0.045,
            ),
          ),
        ),
      ],
    );
  }
}
