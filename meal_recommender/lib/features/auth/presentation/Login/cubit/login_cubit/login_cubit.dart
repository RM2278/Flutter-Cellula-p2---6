import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../domain/repositories/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());

  final AuthRepo loginRepo;

  Future<void> login(String email, String password) async {
    try {
      emit(LoginLoading());
      EasyLoading.show(status: 'loading...');
      var result = await loginRepo.signinWithEmailAndPassword(email, password);
      result.fold(
        (failure) => emit(LoginFailure(message: failure.errMessage)),
        (loginUserEntity) {
          if (loginUserEntity != null) {
            EasyLoading.dismiss();
            emit(LoginSuccess(loginUserEntity: loginUserEntity));
          } else {
            EasyLoading.dismiss();
            emit(LoginFailure(message: "User not found or invalid credentials."));
          }
        },
      );
    } catch (e) {
      EasyLoading.dismiss();
      emit(LoginFailure(message: "Unexpected error occurred. Please try again."));
    }
  }
}
