import 'package:dartz/dartz.dart';
import 'package:meal_recommender/features/main/domain/repositories/favorite_meals_repository.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_failure.dart';
import '../../../ai/data/models/dish_model.dart';

import '../datasources/favorite_meal_data_source.dart';

class FavoriteMealsRepositoryImpl implements FavoriteMealsRepository {
  final FavoriteMealsDataSource dataSource;

  FavoriteMealsRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, void>> addMealToFavorites(
      String userId, DishModel dish) async {
    try {
      await dataSource.addMealToFavorites(userId, dish);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(
          errMessage: "Failed to add meal to favorites: $e", statusCode: ""));
    }
  }

  @override
  Future<Either<Failure, void>> removeMealFromFavorites(
      String userId, String mealName) async {
    try {
      await dataSource.removeMealFromFavorites(userId, mealName);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(
          errMessage: "Failed to remove meal from favorites: $e",
          statusCode: ""));
    }
  }

  @override
  Future<Either<Failure, List<DishModel>>> getFavoriteMeals(
      String userId) async {
    try {
      final meals = await dataSource.getFavoriteMeals(userId);
      return Right(meals);
    } catch (e) {
      return Left(ServerFailure(
          errMessage: "Failed to fetch favorite meals: $e", statusCode: ""));
    }
  }
}
