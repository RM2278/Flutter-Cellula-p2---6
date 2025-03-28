import '../../../../core/services/firebase_service.dart';
import '../models/DishModel.dart';
import '../models/meal_model.dart';

abstract class BaseFavoriteDataRemote {
  Future add(Map<String, dynamic> meal);
  Future get();
  Future remove(String mealId);
}

class FavoriteDataRemote extends BaseFavoriteDataRemote {
  FirebaseService firebaseService;
  FavoriteDataRemote(this.firebaseService);

  @override
  Future add(Map<String, dynamic> meal) async {
    await firebaseService.addFavorites(meal);
  }

  @override
  Future get() async {
    var data = await firebaseService.getFavorites();
    return data.map((json) => MealDishModel.fromJson(json)).toList();
  }

  @override
  Future remove(String mealId) async {
    await firebaseService.removeFavorite(mealId);
  }
}
