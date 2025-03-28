import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meal_recommender/features/main/data/models/meal_model.dart';
import 'package:meal_recommender/features/main/domain/repositories/favorite_repository.dart';
import 'package:meal_recommender/features/main/domain/usecases/GetMeals_Usecase.dart';
import 'package:meal_recommender/features/main/presentation/manager/bloc/favorite_event.dart';
import 'package:meal_recommender/features/main/presentation/manager/bloc/favorite_state.dart';

import '../../../../../core/services/firebase_service.dart';
import '../../../data/models/DishModel.dart';
import '../../../domain/entities/meals.dart';
import '../../../domain/repositories/meals_repository.dart';

/*class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoritesRepository favoritesRepository;
  final String userId;

  FavoritesBloc({required this.favoritesRepository, required this.userId})
      : super(FavoritesLoading()) {
    on<LoadFavorites>(_onLoadFavorites);
    on<ToggleFavorite>(_onToggleFavorite);
    on<NavigateToFavorites>(_onNavigateToFavorites);
  }

  Future<void> _onLoadFavorites(
      LoadFavorites event, Emitter<FavoritesState> emit) async {
    emit(FavoritesLoading());
    try {
      final favorites = await favoritesRepository.getFavorites(userId);
      emit(FavoritesLoaded(List<String>.from(favorites)));
    } catch (e) {
      emit(FavoritesError("Failed to load favorites"));
    }
  }

  Future<void> _onToggleFavorite(
      ToggleFavorite event, Emitter<FavoritesState> emit) async {
    if (state is FavoritesLoaded) {
      final currentState = state as FavoritesLoaded;
      final updatedFavorites = Set<String>.from(currentState.favorites);
      
      if (updatedFavorites.contains(event.mealId)) {
        await favoritesRepository.removeFavorite(userId, event.mealId);
        updatedFavorites.remove(event.mealId);
      } else {
        await favoritesRepository.addFavorite(userId, event.mealId);
        updatedFavorites.add(event.mealId);
      }
      
      emit(FavoritesLoaded(updatedFavorites.toList()));
    }
  }

  void _onNavigateToFavorites(
      NavigateToFavorites event, Emitter<FavoritesState> emit) {
    emit(NavigateToFavoritesState());
  }
}*/
class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FirebaseService firebaseService;
final GetMealsUseCase getMealsUseCase;
  FavoritesBloc({required this.firebaseService,required this.getMealsUseCase}) : super(FavoritesInitial()) {
    on<LoadFavorites>((event, emit) async {
      emit(FavoritesLoading());
      final result = await getMealsUseCase.excute();
      result.fold(
            (failure) {
          EasyLoading.instance
            ..backgroundColor = Colors.red
            ..textColor = Colors.white
            ..indicatorColor = Colors.white;
          emit(FavoritesError(failure.errMessage));
        },
            (data) {
          emit(FavoritesLoaded(data));
        },
      );
    });

    /*on<AddFavorite>((event, emit) async {
      try {
        await firebaseService.addFavorites(event.dishModel.toJson());
        
        List<MealDishModel> updatedFavorites =
            (await firebaseService.getFavorites())
                .map((data) => MealDishModel.fromJson(data))
                .toList();

        emit(FavoritesLoaded(updatedFavorites));
      } catch (e) {
        emit(FavoritesError("Failed to add favorite!"));
      }
    });*/

    on<RemoveFavorite>((event, emit) async {
      try {
        await firebaseService.removeFavorite(event.dishId);
        
        List<MealDishModel> updatedFavorites =
            (await firebaseService.getFavorites())
                .map((data) => MealDishModel.fromJson(data))
                .toList();

        emit(FavoritesLoaded(updatedFavorites));
      } catch (e) {
        emit(FavoritesError("Failed to remove favorite!"));
      }
    });
  }
}