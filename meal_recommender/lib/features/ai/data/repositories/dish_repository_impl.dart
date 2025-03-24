import 'package:dartz/dartz.dart';
import 'package:meal_recommender/core/errors/server_failure.dart';
import 'package:meal_recommender/features/ai/domain/entities/dish_entity.dart';

import '../../../../core/errors/failure.dart';
import '../datasources/dish_remote_data_source.dart';
import '../../domain/repositories/dish_repository.dart';


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
}
