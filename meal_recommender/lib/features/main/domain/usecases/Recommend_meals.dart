

import 'package:dartz/dartz.dart';

import 'package:meal_recommender/core/errors/failure.dart';


import '../entities/dish_entity.dart';
import '../repositories/dish_repository.dart';

class RecommendMeals {
  final DishRepository repository;

  RecommendMeals(this.repository);
  Future<Either<Failure, List<Dish>>> call(int number) async {
    try {
      return await repository.getRecommendedDishes(number);
    } catch (e) {
      rethrow;
    }
  }
}
