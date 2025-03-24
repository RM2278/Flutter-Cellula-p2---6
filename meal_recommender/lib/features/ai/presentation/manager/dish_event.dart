abstract class DishEvent {}

class GetRecommendedDishesEvent extends DishEvent {
  final int number;

  GetRecommendedDishesEvent(this.number);
}

class GetDishByNameEvent extends DishEvent {
  final String name;

  GetDishByNameEvent(this.name);
}
