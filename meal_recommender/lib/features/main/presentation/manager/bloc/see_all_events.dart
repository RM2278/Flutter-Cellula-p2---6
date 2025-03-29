import '../../../domain/entities/dish_entity.dart';

abstract class SeeAllEvent {}

class FetchTrendingMeals extends SeeAllEvent {
  int number;
  FetchTrendingMeals(this.number);
}

class FetchRecommendedMeals extends SeeAllEvent {
  int number;
  FetchRecommendedMeals(this.number);
}
class AddFavoriteDishEvent extends SeeAllEvent {
  final Dish dish;

  AddFavoriteDishEvent(this.dish);
}
class RemoveFavoriteDishEvent extends SeeAllEvent {
  final String id;

  RemoveFavoriteDishEvent(this.id);
}