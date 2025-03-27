import 'package:equatable/equatable.dart';
import '../../../ai/data/models/dish_model.dart';

abstract class FavoriteMealsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FavoriteMealsInitial extends FavoriteMealsState {}

class FavoriteMealsLoading extends FavoriteMealsState {}

class FavoriteMealsLoaded extends FavoriteMealsState {
  final List<DishModel> meals;

  FavoriteMealsLoaded(this.meals);

  @override
  List<Object?> get props => [meals];
}

class FavoriteMealsError extends FavoriteMealsState {
  final String message;

  FavoriteMealsError(this.message);

  @override
  List<Object?> get props => [message];
}
