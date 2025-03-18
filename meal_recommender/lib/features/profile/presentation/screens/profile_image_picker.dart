import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/constants/constants.dart';

class ProfileImagePicker {
  static Future<File?> pickImage(BuildContext context) async {
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
        //if exist file return imagefile
        return imageFile;
      }
    }
    //if not file return null
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
      print("${Constants.imageUploadError} $e");
      return null;
    }
  }

  static Future<void> _saveImageUrlToFirestore(String imageUrl) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      await FirebaseFirestore.instance.collection(Constants.user).doc(user.uid).update({
        Constants.profileImageUrl : imageUrl,
      });

      print("${Constants.imageUrlSaved} $imageUrl");
    } catch (e) {
      print("${Constants.imageSaveFirestoreError} $e");
    }
  }
}

