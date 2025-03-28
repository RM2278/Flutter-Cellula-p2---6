import '../../data/models/meal_model.dart';


abstract class MealsRepository {
  Future<List<MealDishModel>> getMeals();
  Future<void> likeMeal(String mealId);
  Future<void> rateMeal(String mealId, double rating);
  Future<MealDishModel?> getMealById(String mealId);
}

