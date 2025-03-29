import 'dart:developer';

import 'package:meal_recommender/core/services/firebase_service.dart';

import '../../../../core/dl/Dependency_Injection.dart';
import '../../../../core/services/Gemini_service.dart';
import '../../../../core/services/RecipeApiService.dart';
import '../models/dish_model.dart';


abstract class DishRemoteDataSource {
  Future<List<DishModel>> getRecommendedDishes(int number);
  Future<DishModel> getDishByName(String name);
  Future add(DishModel meal) ;
  Future remove(String mealId);
  Future get();
}

class DishRemoteDataSourceImpl implements DishRemoteDataSource {
  final GeminiApiService apiService;
final FirebaseService firebaseService;
  DishRemoteDataSourceImpl({required this.apiService,required this.firebaseService});

  @override
  Future<List<DishModel>> getRecommendedDishes(int number) async {
    final response = await apiService.recommendedFromGemini(number);
    for(int i=0 ;i<response.length;i++){
      response[i]['imageUrl']=await sl<RecipeApiService>().fetchRecipeImage(response[i]['name']) ?? '';
      response[i]['id']=DateTime.now().millisecondsSinceEpoch.toString();
    }
    return response.map((json) => DishModel.fromJson(json)).toList();
  }

  @override
  Future<DishModel> getDishByName(String name) async {
    final response = await apiService.fetchRecipeFromGemini(name);
    log(response.toString());
    response['imageUrl']=await sl<RecipeApiService>().fetchRecipeImage(response['name']) ?? '';
    response['id']=DateTime.now().millisecondsSinceEpoch.toString();
    return DishModel.fromJson(response);
  }

  @override
  Future add(DishModel dish) async {
    Map<String,dynamic>meal=dish.toJson();
    await firebaseService.addFavorites(meal);
  }

  @override
  Future get() async {
    var data = await firebaseService.getFavorites();
    return data.map((json) => DishModel.fromJson(json)).toList();
  }

  @override
  Future remove(String mealId) async {
    await firebaseService.removeFavorite(mealId);
  }
}
