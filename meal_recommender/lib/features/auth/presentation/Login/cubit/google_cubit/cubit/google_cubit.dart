import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_recommender/features/auth/data/repositories/google_auth_repo.dart';
import 'package:meal_recommender/features/auth/presentation/Login/cubit/google_cubit/cubit/google_state.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  final GoogleAuthRepository googleAuthRepository;

  GoogleAuthCubit(this.googleAuthRepository) : super(GoogleAuthInitial());

  Future<void> signInWithGoogle() async {
    emit(GoogleAuthLoading());
    try {
      final User? user = await googleAuthRepository.signInWithGoogle();
      if (user != null) {
        print("✅ Google Sign-In Success: ${user.email}");
        emit(GoogleAuthSuccess(user));
      } else {
        print("⚠️ Google Sign-In was cancelled.");
        emit(GoogleAuthFailure("Google sign-in was cancelled"));
      }
    } catch (e) {
      print("❌ Google Sign-In Error: $e");
      emit(GoogleAuthFailure(e.toString()));
    }
  }

  Future<void> signOut() async {
    try {
      await googleAuthRepository.signOut();
      emit(GoogleAuthInitial());
    } catch (e) {
      emit(GoogleAuthFailure(e.toString()));
    }
  }
}
