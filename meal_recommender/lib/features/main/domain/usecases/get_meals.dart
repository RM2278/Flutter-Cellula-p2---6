import 'package:meal_recommender/features/ai/data/models/dish_model.dart';
import 'package:meal_recommender/features/main/domain/entities/meals.dart';
import 'package:meal_recommender/features/main/domain/repositories/meals_repository.dart';

import '../../data/models/meal_model.dart';

class GetMeals {
  final MealsRepository repository;

  GetMeals(this.repository);
  Future<List<DishModel>> call() async {
    try {
      return await repository.getRecommendedDishes(10);
    } catch (e) {
      rethrow;
    }
  }
}
