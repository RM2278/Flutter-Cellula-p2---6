import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:meal_recommender/core/constants/constants.dart';
import 'package:meal_recommender/features/ai/data/datasources/dish_remote_data_source.dart';
import 'package:meal_recommender/features/ai/data/repositories/dish_repository_impl.dart';
import 'package:meal_recommender/features/ai/presentation/manager/dish_bloc.dart';
import 'package:meal_recommender/features/auth/data/datasources/RegisterDataRemote.dart';
import '../../features/ai/domain/repositories/dish_repository.dart';
import '../../features/ai/domain/usecases/get_dish_by_name.dart';
import '../../features/ai/domain/usecases/get_recommended_dishes.dart';
import '../../features/auth/data/repositories/login_repo_impl.dart';
import '../../features/auth/domain/repositories/login_repo.dart';
import '../../features/auth/domain/usecases/Register_usecase.dart';
import '../../features/auth/domain/usecases/Reload_UseCase.dart';
import '../../features/auth/presentation/register/cubit/register_cubit.dart';

import '../services/Gemini_service.dart';
import '../services/RecipeApiService.dart';
import '../services/firebase_service.dart';

final sl = GetIt.instance;

void intl() {
  //Register
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseService>(
      () => FirebaseService(sl<FirebaseAuth>(), sl<FirebaseFirestore>()));
  sl.registerLazySingleton(() => RegisterDataRemote(sl<FirebaseService>()));
  sl.registerSingleton<AuthRepo>(
      LoginRepoImpl(sl<FirebaseService>(), sl<RegisterDataRemote>()));

  sl.registerLazySingleton(() => RegisterUsecase(sl<AuthRepo>()));
  sl.registerLazySingleton(() => ReloadUsecase(sl<AuthRepo>()));
  sl.registerFactory(() => RegisterCubit());
//Login
  sl.registerLazySingleton(() =>RecipeApiService(apiKey: Constants.RecipeKey));
  sl.registerLazySingleton(() => GeminiApiService(apiKey: Constants.geminKey));
  sl.registerLazySingleton<DishRemoteDataSource>(
      () => DishRemoteDataSourceImpl(apiService: sl()));
  sl.registerLazySingleton<DishRepository>(
      () => DishRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton(() => GetRecommendedDishes(sl()));
  sl.registerLazySingleton(() => GetDishByName(sl()));
  sl.registerFactory(
      () => DishBloc(getRecommendedDishes: sl(), getDishByName: sl()));
}
