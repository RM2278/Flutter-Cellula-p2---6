import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_failure.dart';
import '../../../../core/services/firebase_service.dart';
import '../../domain/entities/login_user_entity.dart';
import '../../domain/repositories/login_repo.dart';
import '../datasources/RegisterDataRemote.dart';
import '../models/login_user_model.dart';

class LoginRepoImpl extends AuthRepo {
  final FirebaseService firebaseAuthService;
  BaseAuthDataRemote baseAuthDataRemote;
  LoginRepoImpl(this.firebaseAuthService,this.baseAuthDataRemote);

  @override
  Future<Either<Failure, LoginUserEntity>> signinWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.login(
          email: email, password: password);

      if (user != null) {
        return Right(LoginUserModel.fromFirebaseUser(user));
      } else {
        return Left(ServerFailure(statusCode: "404", errMessage: "User not found."));
      }
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(
        statusCode: e.code,
        errMessage: _mapFirebaseError(e.code),
      ));
    } catch (e) {
      log('Exception in LoginRepoImpl.signinWithEmailAndPassword: ${e.toString()}');
      return Left(ServerFailure(
        statusCode: "500",
        errMessage: 'An unexpected error occurred. Please try again later.',
      ));
    }
  }
  @override
  Future register(String UserName,String email, String password, String phone) async{
    return await baseAuthDataRemote.register(UserName ,email, password,phone);
  }

  @override
  Future reload() async{
    // TODO: implement reload
    return await baseAuthDataRemote.reload();
  }

  String _mapFirebaseError(String errorCode) {
    switch (errorCode) {
      case 'user-not-found':
        return 'No user found for this email.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'invalid-email':
        return 'Invalid email format.';
      case 'network-request-failed':
        return 'Network error. Check your internet connection.';
      default:
        return 'Something went wrong. Please try again.';
    }
  }
}
