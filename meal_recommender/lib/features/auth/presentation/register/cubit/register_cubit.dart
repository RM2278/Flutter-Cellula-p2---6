import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';


import '../../../domain/usecases/Register_usecase.dart';
import '../../../domain/usecases/Reload_UseCase.dart';



part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  bool value = false;
  var key = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  bool isVisible = true;
  final RegisterUsecase registerUseCase = GetIt.instance<RegisterUsecase>();
  final ReloadUsecase reloadUsecase = GetIt.instance<ReloadUsecase>();
  User? user;
  RegisterCubit() : super(RegisterInitial());

  Future<void> register() async {
    try {
      emit(RegisterLoading());
      EasyLoading.show(status: 'loading...');
      user = await registerUseCase.excute(
        fullNameController.text,
        emailController.text,
        passwordController.text,
        phoneController.text
      );
      print(user);
      if (user != null && !user!.emailVerified) {
        EasyLoading.dismiss();
        emit(RegisterNotValid());
      }
      else if(user!.emailVerified){
        EasyLoading.dismiss();
        emit(RegisterValid());
      }
    } catch (e) {
      EasyLoading.dismiss();
      emit(RegisterError(e.toString()));
    }
  }
  Future<void> Reload() async {
    try {
      emit(RegisterLoading());
      EasyLoading.show(status: 'loading...');
      user =await reloadUsecase.excute();
      print("${user!.emailVerified}");
      if (user != null && !user!.emailVerified) {
        EasyLoading.dismiss();
        emit(RegisterNotValid());
      }
      else if(user!.emailVerified){
        EasyLoading.dismiss();
        emit(RegisterValid());
      }
    } catch (e) {
      emit(RegisterError(e.toString()));
    }
  }
}
