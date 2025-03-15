import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:meal_recommender/features/auth/register/domain/usecases/Register_usecase.dart';
import 'package:meal_recommender/features/auth/register/domain/usecases/Reload_UseCase.dart';

import '../../domain/repositories/registerRepo.dart';

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
      user = await registerUseCase.excute(
        fullNameController.text,
        emailController.text,
        passwordController.text,
      );
      print(user);
      if (user != null && !user!.emailVerified) {
        print("${user!.displayName}");
        emit(RegisterNotValid());
      }
      else if(user!.emailVerified){
        emit(RegisterValid());
      }
    } catch (e) {
      emit(RegisterError(e.toString()));
    }
  }
  Future<void> Reload() async {
    try {
      emit(RegisterLoading());
      user =await reloadUsecase.excute();
      print(user);
      print("${user!.emailVerified}");
      if (user != null && !user!.emailVerified) {
        emit(RegisterNotValid());
      }
      else if(user!.emailVerified){
        emit(RegisterValid());
      }
    } catch (e) {
      emit(RegisterError(e.toString()));
    }
  }
}
