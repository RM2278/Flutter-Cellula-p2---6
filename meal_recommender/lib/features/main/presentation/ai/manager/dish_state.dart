import 'package:equatable/equatable.dart';

import '../../../domain/entities/dish_entity.dart';


abstract class DishState extends Equatable {
  @override
  List<Object> get props => [];
}

class DishInitial extends DishState {}

class DishLoading extends DishState {}

class DishLoaded extends DishState {
  final List<Dish> dishes;
  DishLoaded(this.dishes);

  @override
  List<Object> get props => [dishes];
}

class DishSingleLoaded extends DishState {
  final Dish dish;
  DishSingleLoaded(this.dish);

  @override
  List<Object> get props => [dish];
}

class DishError extends DishState {
  final String message;
  DishError(this.message);

  @override
  List<Object> get props => [message];
}
