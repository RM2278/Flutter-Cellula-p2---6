import 'package:equatable/equatable.dart';
import '../../../ai/data/models/dish_model.dart';

abstract class FavoriteMealsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddMealToFavoritesEvent extends FavoriteMealsEvent {
  final String userId;
  final DishModel meal;

  AddMealToFavoritesEvent({required this.userId, required this.meal});

  @override
  List<Object?> get props => [userId, meal];
}

class RemoveMealFromFavoritesEvent extends FavoriteMealsEvent {
  final String userId;
  final String mealName;

  RemoveMealFromFavoritesEvent({required this.userId, required this.mealName});

  @override
  List<Object?> get props => [userId, mealName];
}

class GetFavoriteMealsEvent extends FavoriteMealsEvent {
  final String userId;

  GetFavoriteMealsEvent({required this.userId});

  @override
  List<Object?> get props => [userId];
}
