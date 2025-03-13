import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:meal_recommender/features/auth/register/data/datasources/RegisterDataRemote.dart';
import 'package:meal_recommender/features/auth/register/data/repositories/RegisterRepoImp.dart';
import 'package:meal_recommender/features/auth/register/presentation/cubit/register_cubit.dart';

import '../../features/auth/register/domain/repositories/registerRepo.dart';
import '../../features/auth/register/domain/usecases/Register_usecase.dart';
import '../services/firebase_service.dart';
final sl = GetIt.instance;

void intl() {
  //Auth
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseService>(() => FirebaseService(sl<FirebaseAuth>()));
  sl.registerLazySingleton(() => RegisterDataRemote(sl<FirebaseService>()));
  sl.registerLazySingleton<RegisterRepo>(() =>RegisterRepoimp((sl<RegisterDataRemote>())));

  sl.registerLazySingleton(() =>RegisterUsecase(sl<RegisterRepo>()));
  sl.registerFactory(() =>RegisterCubit());


}