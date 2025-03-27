import 'package:dartz/dartz.dart';
import 'package:meal_recommender/core/errors/failure.dart';

import '../../../ai/data/models/dish_model.dart';

abstract class FavoriteMealsRepository {
  Future<Either<Failure, void>> addMealToFavorites(String userId, DishModel dish);
  Future<Either<Failure, void>> removeMealFromFavorites(String userId, String mealName);
  Future<Either<Failure, List<DishModel>>> getFavoriteMeals(String userId);
}
