import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:meal_recommender/core/constants/constants.dart';
import 'package:meal_recommender/features/ai/data/datasources/dish_remote_data_source.dart';
import 'package:meal_recommender/features/ai/data/repositories/dish_repository_impl.dart';
import 'package:meal_recommender/features/ai/domain/usecases/addFavourite_usecase.dart';
import 'package:meal_recommender/features/ai/domain/usecases/removeFavourite_usecase.dart';
import 'package:meal_recommender/features/ai/presentation/manager/dish_bloc.dart';
import 'package:meal_recommender/features/auth/data/datasources/RegisterDataRemote.dart';
import 'package:meal_recommender/features/main/data/repositories/meals_repository_impl.dart';
import 'package:meal_recommender/features/main/presentation/manager/bloc/meals_bloc.dart';
import '../../features/ai/domain/repositories/dish_repository.dart';
import '../../features/ai/domain/usecases/get_dish_by_name.dart';
import '../../features/ai/domain/usecases/get_recommended_dishes.dart';
import '../../features/auth/data/repositories/login_repo_impl.dart';
import '../../features/auth/domain/repositories/login_repo.dart';
import '../../features/auth/domain/usecases/Register_usecase.dart';
import '../../features/auth/domain/usecases/Reload_UseCase.dart';
import '../../features/auth/presentation/register/cubit/register_cubit.dart';

import '../../features/main/data/datasources/FavoriteDataRemote.dart';
import '../../features/main/data/repositories/favorite_repo_impl.dart';
import '../../features/main/domain/repositories/favorite_repository.dart';
import '../../features/main/domain/repositories/meals_repository.dart';
import '../../features/main/domain/usecases/GetMeals_Usecase.dart';
import '../../features/main/domain/usecases/get_meals.dart';
import '../../features/main/presentation/manager/bloc/favorite_bloc.dart';
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
  sl.registerLazySingleton(() =>RecipeApiService(apiKey: Constants.recipeKey));
  sl.registerLazySingleton(() => GeminiApiService(apiKey: Constants.geminKey));
  sl.registerLazySingleton<DishRemoteDataSource>(
      () => DishRemoteDataSourceImpl(apiService: sl(), firebaseService: sl<FirebaseService>(),));
  sl.registerLazySingleton<DishRepository>(
      () => DishRepositoryImpl(remoteDataSource: sl()));
  sl.registerLazySingleton(() => GetRecommendedDishes(sl()));
  sl.registerLazySingleton(() => GetDishByName(sl()));
  sl.registerLazySingleton(() => RemoveFavoriteUseCase(sl()));
  sl.registerLazySingleton(() => AddFavoriteUseCase(sl()));
  sl.registerFactory(
      () => DishBloc(getRecommendedDishes: sl(), getDishByName: sl(),addFavoriteUseCase: sl(),removeFavoriteUseCase: sl()));
  ///// Favourite
  sl.registerLazySingleton(() => FavoriteDataRemote(sl<FirebaseService>()));
  sl.registerSingleton<FavoritesRepository>(FavoritesRepositoryImpl(sl<FavoriteDataRemote>()));
  sl.registerLazySingleton(() =>GetMealsUseCase(sl<FavoritesRepository>()));
  sl.registerFactory(() =>FavoritesBloc(firebaseService: sl(), getMealsUseCase: sl()));



sl.registerLazySingleton<MealsRepository>(() => MealsRepositoryImpl(FirebaseFirestore.instance));
sl.registerLazySingleton(() => GetMeals(sl())); 
sl.registerFactory(() => MealsBloc(getMeals: sl(), repository: sl()));





}
