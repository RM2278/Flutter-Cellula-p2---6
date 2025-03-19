import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommender/core/errors/failure.dart';
import 'package:meal_recommender/features/auth/domain/usecases/signin_with_google.dart';
import 'package:meal_recommender/features/auth/presentation/Login/cubit/google_state.dart';
import 'package:meal_recommender/features/auth/domain/entities/login_user_entity.dart';
import 'package:dartz/dartz.dart';

class GoogleCubit extends Cubit<AuthState> {
  final SignInWithGoogle signInWithGoogle;

  GoogleCubit(param0, {required this.signInWithGoogle}) : super(AuthInitial());

  Future<void> loginWithGoogle() async {
    emit(AuthLoading());
    try {
      final Either<Failure, LoginUserEntity> result = await signInWithGoogle();

      result.fold(
        (failure) => emit(AuthError(failure.errMessage)),
        (userEntity) => emit(AuthAuthenticated(userEntity)),
      );
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
