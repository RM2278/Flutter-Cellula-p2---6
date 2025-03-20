import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meal_recommender/features/auth/domain/repositories/login_repo.dart';
import 'package:meal_recommender/features/auth/presentation/Login/cubit/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());

  final AuthRepo loginRepo;
  String _email = "";
  String _password = "";

  void updateEmail(String email) {
    _email = email;
    emit(LoginFormUpdated(isFormValid()));
  }

  void updatePassword(String password) {
    _password = password;
    emit(LoginFormUpdated(isFormValid()));
  }

  bool isFormValid() {
    return _email.isNotEmpty &&
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}")
            .hasMatch(_email) &&
        _password.length >= 6;
  }

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      EasyLoading.show(status: 'loading...');
      var result = await loginRepo.signinWithEmailAndPassword(email, password);
      result.fold(
        (failure) => emit(LoginFailure(message: failure.errMessage)),
        (loginUserEntity) {
          EasyLoading.dismiss();
          if (loginUserEntity != null) {
            emit(LoginSuccess(loginUserEntity: loginUserEntity));
          } else {
            emit(LoginFailure(
                message: "User not found or invalid credentials."));
          }
        },
      );
    } catch (e) {
      EasyLoading.dismiss();
      emit(LoginFailure(
          message: "Unexpected error occurred. Please try again."));
    }
  }
}
