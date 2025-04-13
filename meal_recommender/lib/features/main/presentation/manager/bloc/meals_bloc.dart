// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meal_recommender/features/main/domain/repositories/meals_repository.dart';
// import 'package:meal_recommender/features/main/domain/usecases/Recommend_meals.dart';
// import 'meals_event.dart';
// import 'meals_state.dart';

// class MealsBloc extends Bloc<MealsEvent, MealsState> {
//   final GetMeals getMeals;
//   final MealsRepository repository;

//   MealsBloc({required this.getMeals, required this.repository})
//       : super(MealsInitial()) {
//     on<LoadMeals>(_onLoadMeals);
//     on<LikeMeal>(_onLikeMeal);
//     on<RateMeal>(_onRateMeal);
//   }

//   Future<void> _onLoadMeals(LoadMeals event, Emitter<MealsState> emit) async {
//     emit(MealsLoading());
//     try {
//       final meals = await getMeals();
//       emit(MealsLoaded(meals));
//     } catch (e) {
//       emit(MealsError("$e: Failed to load meals"));
//     }
//   }

//   Future<void> _onLikeMeal(LikeMeal event, Emitter<MealsState> emit) async {
//     await repository.likeMeal(event.mealId);
//     add(LoadMeals());
//   }

//   Future<void> _onRateMeal(RateMeal event, Emitter<MealsState> emit) async {
//     await repository.rateMeal(event.mealId, event.rating);
//     add(LoadMeals());
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meal_recommender/features/main/domain/repositories/dish_repository.dart';

import 'package:meal_recommender/features/main/domain/usecases/Recommend_meals.dart';

import '../../../domain/entities/dish_entity.dart';
import '../../../domain/usecases/addFavourite_usecase.dart';
import '../../../domain/usecases/removeFavourite_usecase.dart';
import 'meals_event.dart';
import 'meals_state.dart';

class MealsBloc extends Bloc<MealsEvent, MealsState> {
  final RecommendMeals getMeals;
  final DishRepository repository;
  final AddFavoriteUseCase addFavoriteUseCase;
  final RemoveFavoriteUseCase removeFavoriteUseCase;
  List<Dish> dishes = [];
  MealsBloc({required this.getMeals, required this.repository,required this.addFavoriteUseCase,required this.removeFavoriteUseCase})
      : super(MealsInitial()) {
    on<LoadMeals>(_onLoadMeals);
    on<AddFavoriteDishEvent>(_onAddFavoriteDish);
    on<RemoveFavoriteDishEvent>(_onRemoveFavoriteDish);
  }
  Future<void> _onLoadMeals(LoadMeals event, Emitter<MealsState> emit) async {
    emit(MealsLoading());
      final recommendedDishes = await repository.getRecommendedDishes(7);
      recommendedDishes.fold(
            (failure) {
          EasyLoading.instance
            ..backgroundColor = Colors.red
            ..textColor = Colors.white
            ..indicatorColor = Colors.white;
          emit(MealsError("$failure: Failed to load meals"));
        },
            (data) {
              emit(MealsLoaded(data));
        },
      );

    }

  Future<void> _onAddFavoriteDish(AddFavoriteDishEvent event, Emitter<MealsState> emit) async {
    final result = await addFavoriteUseCase.execute(event.dish);
    result.fold(
          (failure) {
        EasyLoading.instance
          ..backgroundColor = Colors.red
          ..textColor = Colors.white
          ..indicatorColor = Colors.white;
        emit(MealsError(failure.errMessage));
      },
          (_) {
        EasyLoading.showSuccess('Added to favorites!');
      },
    );
  }
  Future<void> _onRemoveFavoriteDish(RemoveFavoriteDishEvent event, Emitter<MealsState> emit) async {

    final result = await removeFavoriteUseCase.execute(event.id);
    result.fold(
          (failure) {
        EasyLoading.instance
          ..backgroundColor = Colors.red
          ..textColor = Colors.white
          ..indicatorColor = Colors.white;
        emit(MealsError(failure.errMessage));
      },
          (_) {
        EasyLoading.showSuccess('remove to favorites!');

      },
    );
  }

}
