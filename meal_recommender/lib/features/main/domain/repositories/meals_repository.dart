// import 'package:meal_recommender/features/ai/data/models/dish_model.dart';

// import '../../data/models/meal_model.dart';

// abstract class MealsRepository {
//     Future<List<DishModel>> getRecommendedDishes(int number);
//   Future<List<MealDishModel>> getMeals();
//   Future<void> likeMeal(String mealId);
//   Future<void> rateMeal(String mealId, double rating);
//   Future<MealDishModel?> getMealById(String mealId);
// }

import 'package:meal_recommender/features/ai/data/models/dish_model.dart';

abstract class MealsRepository {
  Future<List<DishModel>> getRecommendedDishes(int number);
}
