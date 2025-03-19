import 'package:dartz/dartz.dart';
import 'package:meal_recommender/features/auth/domain/repositories/login_repo.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/login_user_entity.dart';

class SignInWithGoogle {
  final AuthRepo repository;

  SignInWithGoogle(this.repository);

  Future<Either<Failure, LoginUserEntity>> call() async {
    return await repository.signInWithGoogle();
  }
}
