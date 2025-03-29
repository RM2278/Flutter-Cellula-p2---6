
import 'package:meal_recommender/features/main/domain/entities/dish_entity.dart';

import '../../../data/models/dish_model.dart';


abstract class SeeAllState {}

class SeeAllInitial extends SeeAllState {}

class SeeAllLoading extends SeeAllState {}

class SeeAllLoaded extends SeeAllState {
  final List<Dish> trendingMeals;
  final List<Dish> recommendedMeals;

  SeeAllLoaded(this.trendingMeals, this.recommendedMeals);
}

class SeeAllError extends SeeAllState {
  final String message;

  SeeAllError(this.message);
}
