import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../repositories/dish_repository.dart';
import '../entities/dish_entity.dart';


class GetRecommendedDishes {
  final DishRepository repository;

  GetRecommendedDishes(this.repository);

  Future<Either<Failure, List<Dish>>> execute(int number) {
    return repository.getRecommendedDishes(number);
  }
}
