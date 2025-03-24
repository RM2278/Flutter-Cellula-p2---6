import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/dish_entity.dart';

abstract class DishRepository {
  Future<Either<Failure, List<Dish>>> getRecommendedDishes(int number);
  Future<Either<Failure, Dish>> getDishByName(String name);
}
