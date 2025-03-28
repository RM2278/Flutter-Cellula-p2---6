import 'package:dartz/dartz.dart';
import 'package:meal_recommender/core/errors/failure.dart';

import '../../../ai/domain/entities/dish_entity.dart';
import '../entities/meals.dart';

abstract class FavoritesRepository {
  Future addFavorite(Dish dish);
  Future removeFavorite(String mealId);
  Future<Either<Failure, List<Meal>>> getFavorites();
}
