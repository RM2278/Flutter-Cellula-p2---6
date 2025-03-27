import 'package:dartz/dartz.dart';
import 'package:meal_recommender/core/errors/failure.dart';
import '../../../ai/data/models/dish_model.dart';
import '../repositories/favorite_meals_repository.dart';

class AddMealToFavoritesUseCase {
  final FavoriteMealsRepository repository;

  AddMealToFavoritesUseCase({required this.repository});

  Future<Either<Failure, void>> call(String userId, DishModel dish) async {
    return await repository.addMealToFavorites(userId, dish);
  }
}
