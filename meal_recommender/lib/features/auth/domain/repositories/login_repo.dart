import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/errors/failure.dart';
import '../entities/login_user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginUserEntity>> signinWithEmailAndPassword(
      String email, String password);
  Future register(String UserName, String email, String password);
  Future reload();
  Future<Either<Failure, LoginUserEntity>> signInWithGoogle();
}
