import 'package:dartz/dartz.dart';
import 'package:meal_recommender/core/errors/failure.dart';
import 'package:meal_recommender/features/main/domain/entities/dish.dart';

import '../../data/models/meal_model.dart';
import '../entities/meals.dart';

abstract class FavoritesRepository {
  Future<void> addFavorite(Map<String,dynamic> meal);
   Future<void> removeFavorite(String mealId);
  Future<Either<Failure, List<Meal>>> getFavorites() ;
}
