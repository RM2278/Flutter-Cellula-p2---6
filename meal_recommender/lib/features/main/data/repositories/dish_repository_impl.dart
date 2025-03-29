import 'package:dartz/dartz.dart';
import 'package:meal_recommender/core/errors/server_failure.dart';


import '../../../../core/errors/failure.dart';
import '../../domain/entities/dish_entity.dart';
import '../datasources/dish_remote_data_source.dart';
import '../../domain/repositories/dish_repository.dart';
import '../models/dish_model.dart';


class DishRepositoryImpl implements DishRepository {
  final DishRemoteDataSource remoteDataSource;

  DishRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Dish>>> getRecommendedDishes(int number) async {
    try {
      final dishes = await remoteDataSource.getRecommendedDishes(number);
      return Right(dishes);
    } catch (e) {
      return Left(ServerFailure(statusCode: "500", errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Dish>> getDishByName(String name) async {
    try {
      final dish = await remoteDataSource.getDishByName(name);
      return Right(dish);
    } catch (e) {
      return Left(ServerFailure(statusCode: "500", errMessage: e.toString()));
    }
  }

  @override
  Future<void> addFavorite(Dish dish) async {
    try {
      DishModel dishModel=DishModel.fromEntity(dish);
      await remoteDataSource.add(dishModel);

    } catch (e) {
      Left(ServerFailure(statusCode: "500", errMessage: e.toString()));
    }
  }


  @override
  Future<void> removeFavorite(String mealId) async {
    try {
      await remoteDataSource.remove(mealId);
    } catch (e) {
      Left(ServerFailure(statusCode: "500", errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Dish>>> getFavorites() async {
    try {
      final dishes = await remoteDataSource.get();
      return Right(dishes);
    } catch (e) {
      return Left(ServerFailure(statusCode: "500", errMessage: e.toString()));
    }
  }
}
