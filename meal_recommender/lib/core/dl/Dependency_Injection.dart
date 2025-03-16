
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:meal_recommender/features/auth/data/datasources/RegisterDataRemote.dart';
import '../../features/auth/data/repositories/login_repo_impl.dart';
import '../../features/auth/domain/repositories/login_repo.dart';
import '../../features/auth/domain/usecases/Register_usecase.dart';
import '../../features/auth/domain/usecases/Reload_UseCase.dart';
import '../../features/auth/presentation/register/cubit/register_cubit.dart';

import '../services/firebase_service.dart';
final sl = GetIt.instance;

void intl() {
  //Register

  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseService>(() => FirebaseService(sl<FirebaseAuth>()));
  sl.registerLazySingleton(() => RegisterDataRemote(sl<FirebaseService>()));
  sl.registerSingleton<AuthRepo>(LoginRepoImpl(sl<FirebaseService>(),sl<RegisterDataRemote>()));

  sl.registerLazySingleton(() =>RegisterUsecase(sl<AuthRepo>()));
  sl.registerLazySingleton(() =>ReloadUsecase(sl<AuthRepo>()));
  sl.registerFactory(() =>RegisterCubit());
//Login



}