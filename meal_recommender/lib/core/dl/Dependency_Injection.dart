
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:meal_recommender/features/auth/data/datasources/RegisterDataRemote.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/auth/data/repositories/login_repo_impl.dart';
import '../../features/auth/domain/repositories/login_repo.dart';
import '../../features/auth/domain/usecases/Register_usecase.dart';
import '../../features/auth/domain/usecases/Reload_UseCase.dart';
import '../../features/auth/presentation/register/cubit/register_cubit.dart';

import '../../features/profile/data/datasource/profile_local_data_source.dart';
import '../../features/profile/data/datasource/profile_remote_data_source.dart';
import '../../features/profile/data/repositories/profile_repository_impl.dart';
import '../../features/profile/domain/repositories/profile_repository.dart';
import '../../features/profile/domain/usecase/get_profile_usecase.dart';
import '../../features/profile/domain/usecase/update_profile_usecase.dart';
import '../../features/profile/presentation/cubit/profile_cubit.dart';
import '../services/firebase_service.dart';
import '../services/shared_preferences_service.dart';
final sl = GetIt.instance;

Future<void> intl() async {
  //Register
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseService>(() => FirebaseService(sl<FirebaseAuth>(),sl<FirebaseFirestore>()));
  sl.registerLazySingleton(() => RegisterDataRemote(sl<FirebaseService>()));
  sl.registerSingleton<AuthRepo>(LoginRepoImpl(sl<FirebaseService>(),sl<RegisterDataRemote>()));

  sl.registerLazySingleton(() =>RegisterUsecase(sl<AuthRepo>()));
  sl.registerLazySingleton(() =>ReloadUsecase(sl<AuthRepo>()));
  sl.registerFactory(() =>RegisterCubit());

//Login
//Profile
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => SharedPreferencesService());

  // Services
  sl.registerLazySingleton(() => FirebaseService(sl<FirebaseAuth>(), sl<FirebaseFirestore>()));

  // Data Sources
  sl.registerLazySingleton<ProfileRemoteDataSource>(
          () => ProfileRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<ProfileLocalDataSource>(
          () => ProfileLocalDataSourceImpl(sl<SharedPreferencesService>()));

  // Repository
  sl.registerLazySingleton<ProfileRepository>(
          () => ProfileRepositoryImpl(sl(), sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetProfileUseCase(sl()));
  sl.registerLazySingleton(() => UpdateProfile(sl()));

  // Cubit
  sl.registerFactory(() => ProfileCubit(sl(), sl<SharedPreferencesService>()));


}