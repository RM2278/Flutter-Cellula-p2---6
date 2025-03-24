import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_recommended_dishes.dart';
import '../../domain/usecases/get_dish_by_name.dart';
import 'dish_event.dart';
import 'dish_state.dart';

class DishBloc extends Bloc<DishEvent, DishState> {
  final GetRecommendedDishes getRecommendedDishes;
  final GetDishByName getDishByName;

  DishBloc({
    required this.getRecommendedDishes,
    required this.getDishByName,
  }) : super(DishInitial()) {
    on<GetRecommendedDishesEvent>(_onGetRecommendedDishes);
    on<GetDishByNameEvent>(_onGetDishByName);
  }

  void _onGetRecommendedDishes(GetRecommendedDishesEvent event, Emitter<DishState> emit) async {
    emit(DishLoading());
    final result = await getRecommendedDishes(event.number);
    result.fold(
      (failure) => emit(DishError(failure.errMessage)),
      (dishes) => emit(DishLoaded(dishes)),
    );
  }

  void _onGetDishByName(GetDishByNameEvent event, Emitter<DishState> emit) async {
    emit(DishLoading());
    final result = await getDishByName(event.name);
    result.fold(
      (failure) => emit(DishError(failure.errMessage)),
      (dish) => emit(DishSingleLoaded(dish)),
    );
  }
}
