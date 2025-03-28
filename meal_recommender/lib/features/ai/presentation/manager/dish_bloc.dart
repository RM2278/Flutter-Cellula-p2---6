import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meal_recommender/features/ai/domain/usecases/addFavourite_usecase.dart';
import 'package:meal_recommender/features/ai/domain/usecases/removeFavourite_usecase.dart';
import '../../domain/entities/dish_entity.dart';
import '../../domain/usecases/get_recommended_dishes.dart';
import '../../domain/usecases/get_dish_by_name.dart';
import 'dish_event.dart';
import 'dish_state.dart';

class DishBloc extends Bloc<DishEvent, DishState> {
  final GetRecommendedDishes getRecommendedDishes;
  final GetDishByName getDishByName;
  final AddFavoriteUseCase addFavoriteUseCase;
  final RemoveFavoriteUseCase removeFavoriteUseCase;
  List<Dish> dishes = [];

  DishBloc({
    required this.getRecommendedDishes,
    required this.getDishByName,
    required this.addFavoriteUseCase,
    required this.removeFavoriteUseCase,
  }) : super(DishInitial()) {
    on<GetRecommendedDishesEvent>(_onGetRecommendedDishes);
    on<GetDishByNameEvent>(_onGetDishByName);
    on<AddFavoriteDishEvent>(_onAddFavoriteDish);
    on<RemoveFavoriteDishEvent>(_onRemoveFavoriteDish);
  }

  Future<void> _onGetRecommendedDishes(GetRecommendedDishesEvent event, Emitter<DishState> emit) async {
    emit(DishLoading());
    final result = await getRecommendedDishes(event.number);
    result.fold(
      (failure) => emit(DishError(failure.errMessage)),
      (dishes) => emit(DishLoaded(dishes)),
    );
  }

  Future<void> _onGetDishByName(GetDishByNameEvent event, Emitter<DishState> emit) async {
    emit(DishLoading());
    EasyLoading.show(status: 'Loading...');
    final result = await getDishByName.call(event.name);
    await result.fold(
      (failure)  async {
        EasyLoading.instance
          ..backgroundColor = Colors.red
          ..textColor = Colors.white
          ..indicatorColor = Colors.white;
        EasyLoading.showError(failure.errMessage);
        await Future.delayed(const Duration(milliseconds: 3000));
        EasyLoading.dismiss();
        emit(DishError(failure.errMessage));
      },
      (dish) {
        EasyLoading.dismiss();
        dishes.add(dish);
        emit(DishLoaded(dishes));
        },
    );
  }

  Future<void> _onAddFavoriteDish(AddFavoriteDishEvent event, Emitter<DishState> emit) async {
    emit(DishLoading());
    final result = await addFavoriteUseCase.execute(event.dish);
    result.fold(
          (failure) {
        EasyLoading.instance
          ..backgroundColor = Colors.red
          ..textColor = Colors.white
          ..indicatorColor = Colors.white;
        emit(DishError(failure.errMessage));
      },
          (_) {
        EasyLoading.showSuccess('Added to favorites!');
        emit(DishLoaded(dishes));
      },
    );
  }
  Future<void> _onRemoveFavoriteDish(RemoveFavoriteDishEvent event, Emitter<DishState> emit) async {
    emit(DishLoading());
    final result = await removeFavoriteUseCase.execute(event.id);
    result.fold(
          (failure) {
        EasyLoading.instance
          ..backgroundColor = Colors.red
          ..textColor = Colors.white
          ..indicatorColor = Colors.white;
        emit(DishError(failure.errMessage));
      },
          (_) {
        EasyLoading.showSuccess('remove to favorites!');
        emit(DishLoaded(dishes));
      },
    );
  }
}
