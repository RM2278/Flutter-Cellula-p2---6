import '../../../../core/dl/Dependency_Injection.dart';
import '../../../../core/services/Gemini_service.dart';
import '../../../../core/services/RecipeApiService.dart';
import '../models/dish_model.dart';


abstract class DishRemoteDataSource {
  Future<List<DishModel>> getRecommendedDishes(int number);
  Future<DishModel> getDishByName(String name);
}

class DishRemoteDataSourceImpl implements DishRemoteDataSource {
  final GeminiApiService apiService;

  DishRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<DishModel>> getRecommendedDishes(int number) async {
    final response = await apiService.recommendedFromGemini(number);
    for(int i=0 ;i<response.length;i++){
      response[i]['imageUrl']=await sl<RecipeApiService>().fetchRecipeImage(response[i]['name']) ?? '';
    }
    return response.map((json) => DishModel.fromJson(json)).toList();
  }

  @override
  Future<DishModel> getDishByName(String name) async {
    final response = await apiService.fetchRecipeFromGemini(name);
    response['imageUrl']=await sl<RecipeApiService>().fetchRecipeImage(response['name']) ?? '';
    return DishModel.fromJson(response);
  }
}
