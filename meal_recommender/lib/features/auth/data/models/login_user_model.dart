import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entities/login_user_entity.dart';

class LoginUserModel extends LoginUserEntity {
  LoginUserModel({
    required super.name,
    required super.email,
    required super.uid,
  });

  factory LoginUserModel.fromFirebaseUser(User user) {
    return LoginUserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uid: user.uid ,
    );
  }
}