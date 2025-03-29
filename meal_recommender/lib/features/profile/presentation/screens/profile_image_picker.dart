import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/constants/constants.dart';

class ProfileImagePicker {
  static bool _isPicking = false;

  static Future<File?> pickImage(BuildContext context) async {
    if (_isPicking) return null;
    _isPicking = true;

    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);
        String? downloadUrl = await _uploadImageToFirebase(imageFile);

        if (downloadUrl != null) {
          await _saveImageUrlToFirestore(downloadUrl);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(Constants.imageUploadSuccess)),
          );
          _isPicking = false;
          return imageFile;
        }
      }
    } catch (e) {
      print(e);
    } finally {
      _isPicking = false;
    }

    return null;
  }

  static Future<String?> _uploadImageToFirebase(File image) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return null;

      String fileName = 'profile_images/${user.uid}.jpg';
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref().child(fileName);
      firebase_storage.UploadTask uploadTask = ref.putFile(image);
      firebase_storage.TaskSnapshot snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      return null;
    }
  }

  static Future<void> _saveImageUrlToFirestore(String imageUrl) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      await FirebaseFirestore.instance.collection(Constants.user).doc(user.uid).update({
        Constants.profileImageUrl: imageUrl,
      });
    } catch (e) {
      print("${Constants.imageSaveFirestoreError} $e");
    }
  }
}
