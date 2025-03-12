import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService{
  FirebaseAuth _auth;

  FirebaseService(this._auth);

  Future login(String email, String password) async{

  }
  Future register(String email, String password) async{

  }



  Future sign_out() async {
    try{
      await _auth.signOut();
    }catch(e){
      throw Exception("Try Again");
    }
  }
  User? getUser()  {
      return _auth.currentUser;


  }


}