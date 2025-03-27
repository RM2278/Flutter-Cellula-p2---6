import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meal_recommender/features/ai/data/models/dish_model.dart';


abstract class FavoriteMealsDataSource {
  Future<void> addMealToFavorites(String userId, DishModel dish);
  Future<void> removeMealFromFavorites(String userId, String mealName);
  Future<List<DishModel>> getFavoriteMeals(String userId);
}

class FavoriteMealsDataSourceImpl implements FavoriteMealsDataSource {
  final FirebaseFirestore firestore;

  FavoriteMealsDataSourceImpl({required this.firestore});

  CollectionReference getUserFavoritesCollection(String userId) {
    return firestore.collection('users').doc(userId).collection('favorites');
  }

  @override
  Future<void> addMealToFavorites(String userId, DishModel dish) async {
    try {
      await getUserFavoritesCollection(userId).doc(dish.name).set(dish.toJson());
    } catch (e) {
      throw Exception("Failed to add meal to favorites: $e");
    }
  }

  @override
  Future<void> removeMealFromFavorites(String userId, String mealName) async {
    try {
      await getUserFavoritesCollection(userId).doc(mealName).delete();
    } catch (e) {
      throw Exception("Failed to remove meal from favorites: $e");
    }
  }

  @override
  Future<List<DishModel>> getFavoriteMeals(String userId) async {
    try {
      final querySnapshot = await getUserFavoritesCollection(userId).get();
      return querySnapshot.docs
          .map((doc) => DishModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception("Failed to fetch favorite meals: $e");
    }
  }
}
