import 'package:equatable/equatable.dart';

abstract class MealsEvent extends Equatable {
  const MealsEvent();

  @override
  List<Object?> get props => [];
}

class LoadMeals extends MealsEvent {}

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
