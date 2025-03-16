import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());

  final LoginRepo loginRepo;

  Future<void> login(String email, String password) async {
    try {
      emit(LoginLoading());
      var result = await loginRepo.signinWithEmailAndPassword(email, password);
      result.fold(
        (failure) => emit(LoginFailure(message: failure.errMessage)),
        (loginUserEntity) {
          if (loginUserEntity != null) {
            emit(LoginSuccess(loginUserEntity: loginUserEntity));
          } else {
            emit(LoginFailure(message: "User not found or invalid credentials."));
          }
        },
      );
    } catch (e) {
      emit(LoginFailure(message: "Unexpected error occurred. Please try again."));
    }
  }
}
