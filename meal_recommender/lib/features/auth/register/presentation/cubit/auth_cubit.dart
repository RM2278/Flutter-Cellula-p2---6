import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_recommender/features/auth/register/domain/usecases/Register_usecase.dart';

part 'auth_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterUsecase registerUsecase;
  RegisterCubit(this.registerUsecase) : super(RegisterInitial());


  Future<void> register(String email, String password) async {
    try {
      emit(RegisterLoading());
      final user = await registerUsecase.excute(email, password);
      print(user);
      if (user != null) {
        emit(RegisterDone());
      } else {
        emit(RegisterError("Sign up failed"));
      }
    } catch (e) {
      emit(RegisterError(e.toString()));
    }
  }

}
