import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meal_recommender/features/auth/domain/usecases/signin_with_google.dart';
import '../../../../domain/repositories/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo, this.signInWithGoogle) : super(LoginInitial());
  final SignInWithGoogle signInWithGoogle;
  final AuthRepo loginRepo;
  bool isButtonEnabled = false;
  bool isCheckboxChecked = false;

  void updateButtonState(bool isChecked, String email, String password) {
    isCheckboxChecked = isChecked;
    bool isValid = isChecked &&
        email.isNotEmpty &&
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
            .hasMatch(email) &&
        password.length >= 6;

    if (isValid != isButtonEnabled) {
      isButtonEnabled = isValid;
      emit(LoginButtonStateChanged(isButtonEnabled: isValid));
    }
  }

  Future<void> login(String email, String password) async {
    try {
      emit(LoginLoading());
      EasyLoading.show(status: 'Loading...');

      var result = await loginRepo.signinWithEmailAndPassword(email, password);
      result.fold(
        (failure) {
          EasyLoading.dismiss();
          emit(LoginFailure(message: failure.errMessage));
        },
        (loginUserEntity) {
          EasyLoading.dismiss();
          emit(LoginSuccess(loginUserEntity: loginUserEntity));
        },
      );
    } catch (e) {
      EasyLoading.dismiss();
      emit(LoginFailure(
          message: "Unexpected error occurred. Please try again."));
    }
  }
}
