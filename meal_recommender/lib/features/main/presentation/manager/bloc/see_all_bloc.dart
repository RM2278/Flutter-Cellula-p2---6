import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meal_recommender/features/main/presentation/manager/bloc/see_all_events.dart';
import 'package:meal_recommender/features/main/presentation/manager/bloc/see_all_states.dart';

import '../../../data/models/dish_model.dart';
import '../../../domain/entities/dish_entity.dart';
import '../../../domain/usecases/Recommend_meals.dart';
import '../../../domain/usecases/addFavourite_usecase.dart';
import '../../../domain/usecases/removeFavourite_usecase.dart';


class SeeAllBloc extends Bloc<SeeAllEvent, SeeAllState> {
  final RecommendMeals getRecommendedDishes;
  final AddFavoriteUseCase addFavoriteUseCase;
  final RemoveFavoriteUseCase removeFavoriteUseCase;
  List<Dish> recommendedMeals = [];
  List<Dish> trendingMeals=[];
  SeeAllBloc({required this.getRecommendedDishes,required this.addFavoriteUseCase,required this.removeFavoriteUseCase}) : super(SeeAllInitial()) {
    on<FetchTrendingMeals>(_fetchTrendingMeals);
    on<FetchRecommendedMeals>(_fetchRecommendedMeals);
    on<AddFavoriteDishEvent>(_onAddFavoriteDish);
    on<RemoveFavoriteDishEvent>(_onRemoveFavoriteDish);
  }

  void _fetchTrendingMeals(FetchTrendingMeals event, Emitter<SeeAllState> emit) async {
    emit(SeeAllLoading());
    try {
      await Future.delayed(Duration(seconds: 2));
      final result = await getRecommendedDishes(event.number);
      result.fold(
            (failure) => emit(SeeAllError("Failed to fetch trending meals")),
            (dishes) { trendingMeals=dishes;},
      );


      final currentState = state;

      if (currentState is SeeAllLoaded) {
        recommendedMeals = currentState.recommendedMeals;
      }

      emit(SeeAllLoaded(trendingMeals, recommendedMeals));

    } catch (e) {
      emit(SeeAllError("Failed to fetch trending meals"));
    }
  }

  void _fetchRecommendedMeals(FetchRecommendedMeals event, Emitter<SeeAllState> emit) async {
    emit(SeeAllLoading());
    try {

      await Future.delayed(Duration(seconds: 2));
      final result = await getRecommendedDishes(event.number);
      result.fold(
            (failure) => emit(SeeAllError("Failed to fetch trending meals")),
            (dishes) { recommendedMeals=dishes;},
      );


      // Preserve trending meals from the previous state
      final currentState = state;
      if (currentState is SeeAllLoaded) {
        trendingMeals = currentState.trendingMeals;
      }

      emit(SeeAllLoaded(trendingMeals, recommendedMeals));

    } catch (e) {
      emit(SeeAllError("Failed to fetch recommended meals"));
    }
  }

  Future<void> _onAddFavoriteDish(AddFavoriteDishEvent event, Emitter<SeeAllState> emit) async {
    final result = await addFavoriteUseCase.execute(event.dish);
    result.fold(
          (failure) {
        EasyLoading.instance
          ..backgroundColor = Colors.red
          ..textColor = Colors.white
          ..indicatorColor = Colors.white;
        emit(SeeAllError(failure.errMessage));
      },
          (_) {
        EasyLoading.showSuccess('Added to favorites!');
      },
    );
  }
  Future<void> _onRemoveFavoriteDish(RemoveFavoriteDishEvent event, Emitter<SeeAllState> emit) async {

    final result = await removeFavoriteUseCase.execute(event.id);
    result.fold(
          (failure) {
        EasyLoading.instance
          ..backgroundColor = Colors.red
          ..textColor = Colors.white
          ..indicatorColor = Colors.white;
        emit(SeeAllError(failure.errMessage));
      },
          (_) {
        EasyLoading.showSuccess('remove to favorites!');

      },
    );
  }
}
