// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:meal_recommender/features/main/domain/entities/meals.dart';
// import 'package:meal_recommender/features/main/domain/repositories/meals_repository.dart';

// import '../models/meal_model.dart';

// class MealsRepositoryImpl implements MealsRepository {
//   final FirebaseFirestore firestore;

//   MealsRepositoryImpl(this.firestore);

//   @override
//   Future<List<MealDishModel>> getMeals() async {
//     final snapshot = await firestore.collection('meals').get();
//      for (var doc in snapshot.docs) {
//     final data = doc.data();
//     print("🔥 Firestore Data: $data");

//     data.forEach((key, value) {
//       print("🔍 Key: $key, Type: ${value.runtimeType}, Value: $value");
//     });
//   }
//     return snapshot.docs
//         .map((doc) => MealDishModel.fromJson(doc.data()))
//         .toList();
//   }

//   @override
//   Future<void> likeMeal(String mealId) async {
//     final mealRef = firestore.collection('meals').doc(mealId);
//     final mealSnapshot = await mealRef.get();
//     if (mealSnapshot.exists) {
//       int currentLikes = mealSnapshot['likes'] ?? 0;
//       await mealRef.update({'likes': currentLikes + 1});
//     }
//   }

//   @override
//   Future<void> rateMeal(String mealId, double rating) async {
//     final mealRef = firestore.collection('meals').doc(mealId);
//     await mealRef.update({'rating': rating});
//   }

//   @override
//   Future<MealDishModel?> getMealById(String mealId) async {
//     final mealRef = firestore.collection('meals').doc(mealId);
//     final mealSnapshot = await mealRef.get();

//     if (mealSnapshot.exists) {
//       return MealDishModel.fromJson(mealSnapshot.data()!);
//     }
//     return null;
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meal_recommender/core/dl/Dependency_Injection.dart';
import 'package:meal_recommender/core/services/Gemini_service.dart';
import 'package:meal_recommender/core/services/RecipeApiService.dart';
import 'package:meal_recommender/features/ai/data/models/dish_model.dart';

import 'package:meal_recommender/features/main/domain/repositories/meals_repository.dart';

class MealsRepositoryImpl implements MealsRepository {
  final GeminiApiService apiService;
  MealsRepositoryImpl(this.apiService);

  @override
  Future<List<DishModel>> getRecommendedDishes(int number) async {
    final response = await apiService.recommendedFromGemini(number);
    for (int i = 0; i < response.length; i++) {
      response[i]['imageUrl'] =
          await sl<RecipeApiService>().fetchRecipeImage(response[i]['name']) ??
              '';
      response[i]['id'] = DateTime.now().millisecondsSinceEpoch.toString();
    }
    return response.map((json) => DishModel.fromJson(json)).toList();
  }
}
