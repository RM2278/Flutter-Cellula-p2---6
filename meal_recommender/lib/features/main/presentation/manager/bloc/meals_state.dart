import 'package:equatable/equatable.dart';


import '../../../domain/entities/dish_entity.dart';


abstract class MealsState extends Equatable {
  const MealsState();

  @override
  List<Object?> get props => [];
}

class MealsInitial extends MealsState {}

class MealsLoading extends MealsState {}

class MealsLoaded extends MealsState {
  final List<Dish> dishes;

  MealsLoaded(this.dishes);
}

class MealsError extends MealsState {
  final String message;

  const MealsError(this.message);

  @override
  List<Object?> get props => [message];
}
