

import '../../../domain/entities/dish_entity.dart';

abstract class DishEvent {}

class GetRecommendedDishesEvent extends DishEvent {
  final int number;

  GetRecommendedDishesEvent(this.number);
}

class GetDishByNameEvent extends DishEvent {
  final String name;

  GetDishByNameEvent(this.name);
}
class AddFavoriteDishEvent extends DishEvent {
  final Dish dish;

  AddFavoriteDishEvent(this.dish);
}
class RemoveFavoriteDishEvent extends DishEvent {
  final String id;

  RemoveFavoriteDishEvent(this.id);
}
