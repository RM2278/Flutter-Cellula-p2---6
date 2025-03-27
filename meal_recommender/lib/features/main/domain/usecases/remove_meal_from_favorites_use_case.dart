import 'package:dartz/dartz.dart';
import 'package:meal_recommender/core/errors/failure.dart';
import '../repositories/favorite_meals_repository.dart';

class RemoveMealFromFavoritesUseCase {
  final FavoriteMealsRepository repository;

  RemoveMealFromFavoritesUseCase({required this.repository});

  Future<Either<Failure, void>> call(String userId, String mealName) async {
    return await repository.removeMealFromFavorites(userId, mealName);
  }
}
