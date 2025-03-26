import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../domain/entities/dish_entity.dart';
import '../../domain/usecases/get_recommended_dishes.dart';
import '../../domain/usecases/get_dish_by_name.dart';
import 'dish_event.dart';
import 'dish_state.dart';

class DishBloc extends Bloc<DishEvent, DishState> {
  final GetRecommendedDishes getRecommendedDishes;
  final GetDishByName getDishByName;
  List<Dish> dishes = [];

  DishBloc({
    required this.getRecommendedDishes,
    required this.getDishByName,
  }) : super(DishInitial()) {
    on<GetRecommendedDishesEvent>(_onGetRecommendedDishes);
    on<GetDishByNameEvent>(_onGetDishByName);
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
}
