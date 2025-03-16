import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/login_user_entity.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginUserEntity>> signinWithEmailAndPassword(
      String email, String password);
}