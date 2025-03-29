import 'package:equatable/equatable.dart';

import '../../../domain/entities/dish_entity.dart';

abstract class MealsEvent extends Equatable {
  const MealsEvent();

  @override
  List<Object?> get props => [];
}

class LoadMeals extends MealsEvent {}


class AddFavoriteDishEvent extends MealsEvent {
  final Dish dish;

  AddFavoriteDishEvent(this.dish);
}
class RemoveFavoriteDishEvent extends MealsEvent {
  final String id;

  RemoveFavoriteDishEvent(this.id);
}


class LikeMeal extends MealsEvent {
  final String mealId;

  const LikeMeal(this.mealId);

  @override
  List<Object?> get props => [mealId];
}

class RateMeal extends MealsEvent {
  final String mealId;
  final double rating;

  const RateMeal(this.mealId, this.rating);

  @override
  List<Object?> get props => [mealId, rating];
}
