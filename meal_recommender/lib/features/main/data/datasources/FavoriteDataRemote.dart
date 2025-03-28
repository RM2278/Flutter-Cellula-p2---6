import 'package:meal_recommender/features/ai/domain/entities/dish_entity.dart';

import '../../../../core/services/firebase_service.dart';
import '../../../ai/data/models/dish_model.dart';
import '../models/meal_model.dart';

abstract class BaseFavoriteDataRemote {
  Future<void>add(DishModel meal);
  Future get();
  Future<void> remove(String mealId);
}

class FavoriteDataRemote extends BaseFavoriteDataRemote {
  FirebaseService firebaseService;
  FavoriteDataRemote(this.firebaseService);

  @override
  Future get() async {
    var data = await firebaseService.getFavorites();
    return data.map((json) => MealDishModel.fromJson(json)).toList();
  }

  @override
  Future remove(String mealId) async {
    await firebaseService.removeFavorite(mealId);
  }

  @override
  Future<void>add(DishModel meal) async {
    Map<String, dynamic> dish = meal.toJson();
    await firebaseService.addFavorites(dish);
  }
}
