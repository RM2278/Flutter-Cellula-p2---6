import 'package:equatable/equatable.dart';
import 'package:meal_recommender/features/main/data/models/meal_model.dart';
import 'package:meal_recommender/features/main/domain/entities/meals.dart';

abstract class MealsState extends Equatable {
  const MealsState();

  @override
  List<Object?> get props => [];
}

class MealsInitial extends MealsState {}

class MealsLoading extends MealsState {}

class MealsLoaded extends MealsState {
  final List<MealDishModel> meals;

  const MealsLoaded(this.meals);

  @override
  List<Object?> get props => [meals];
}

class MealsError extends MealsState {
  final String message;

  const MealsError(this.message);

  @override
  List<Object?> get props => [message];
}
