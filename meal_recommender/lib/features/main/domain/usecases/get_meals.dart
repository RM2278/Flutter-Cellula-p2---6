import 'package:meal_recommender/features/main/domain/entities/meals.dart';
import 'package:meal_recommender/features/main/domain/repositories/meals_repository.dart';

import '../../data/models/meal_model.dart';

class GetMeals {
  final MealsRepository repository;

  GetMeals(this.repository);

  Future<List<MealDishModel>> call() async {
    try {
      return await repository.getMeals();
    } catch (e) {
      rethrow;
    }
  }
}
