import 'package:equatable/equatable.dart';
import 'package:meal_recommender/features/ai/data/models/dish_model.dart';

abstract class MealsState extends Equatable {
  const MealsState();

  @override
  List<Object?> get props => [];
}

class MealsInitial extends MealsState {}

class MealsLoading extends MealsState {}

class MealsLoaded extends MealsState {
  final List<DishModel> dishes;

  MealsLoaded(this.dishes);
}

class MealsError extends MealsState {
  final String message;

  const MealsError(this.message);

  @override
  List<Object?> get props => [message];
}
