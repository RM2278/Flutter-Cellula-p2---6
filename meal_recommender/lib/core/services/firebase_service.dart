import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_recommender/core/errors/firebase_failure.dart';

import '../../features/profile/data/models/profile_model.dart';
import '../constants/constants.dart';

class FirebaseService{
  FirebaseAuth _auth;
  FirebaseFirestore store;
  FirebaseService(this._auth,this.store);

  Future login({required String email, required String password}) async{
    UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    //return credential;
    User? user = credential.user;
    return user;
  }
  Future register(String UserName,String email, String password, String phone) async{
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      //return credential;
        User? user = credential.user;
        print(UserName);
        if(user!=null){
          await user.updateDisplayName(UserName);
          await user.reload();
          user=await _auth.currentUser;
          var userId=user!.uid;
          try {
            await store.collection('users').doc(userId).set({
              'email': email,
              'username': UserName,
              'phone': phone,
              'photoUrl': " ",
              'createdAt': FieldValue.serverTimestamp(),
            });
            print("Done");
            DocumentSnapshot userDoc = await store.collection('users').doc(userId).get();
            var data=userDoc.data() as Map<String, dynamic>;
            print("${data}");
          } catch (e) {
            print("-------------------------");
            print("Error saving user data: $e");
            print("-------------------------");
          }
        }
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      return user;
      }

    }on FirebaseAuthException catch (e){
      //FirebaseAuthFailure(e.code.toString(),errMessage: e.code.toString(), statusCode: '400');
      if (e.code == 'invalid-email') {
        throw Exception('Invalid email');
      }
      if (e.code == 'email-already-in-use') {
        throw Exception('Hi, User not found');
      } else if (e.code == 'weak-password') {
        throw Exception ( "Your password is weak");
      }
      else{
        throw Exception("email and password are not correct");
      }
    }
  }
  Future Reload() async{
    try {
      User? user=await _auth.currentUser;
      await user!.reload();
      user=await _auth.currentUser;
return user;
    }catch(e){
      throw "Check your internet";
    }
  }

  Future<ProfileModel?> getProfile() async {
    // User? user = _auth.currentUser;
    UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: "ahmeddarwesh317@yahoo.com", password: 'Ahmed@123');
    //return credential;
    User? user = credential.user;
    if (user != null) {
      DocumentSnapshot userProfile = await store.collection(Constants.user).doc(user.uid).get();
      if (userProfile.exists) {
        final data = userProfile.data() as Map<String, dynamic>;
        return ProfileModel(
          name: data[Constants.name] ?? '',
          email: data[Constants.email] ?? '',
          phone: data[Constants.phone]??'',
          profileImageUrl: data[Constants.profileImageUrl] ?? '',
          password: user.uid,
        );
      }
    }

    return null;
  }

  Future<void> updateUserProfile(ProfileModel profile) async {
    User? user = _auth.currentUser;
    if (user != null) {
      await store.collection(Constants.user).doc(user.uid).update({
        Constants.name: profile.name,
        Constants.email: profile.email,
        Constants.profileImageUrl: profile.profileImageUrl,
        Constants.phone:profile.phone
      });
    }
  }
  Future sign_out() async {
    try{
      await _auth.signOut();
    }catch(e){
      throw Exception("Try Again");
    }
  }
  /*User? getUser()  {
      return _auth.currentUser;
  }*/


}