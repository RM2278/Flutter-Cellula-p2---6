import 'package:dartz/dartz.dart';
import 'package:meal_recommender/features/ai/domain/entities/dish_entity.dart';

import '../../../../core/errors/failure.dart';
import '../repositories/dish_repository.dart';


class GetDishByName   {
  final DishRepository repository;

  GetDishByName(this.repository);

  
  Future<Either<Failure, Dish>> execute(String dishName) {
    return repository.getDishByName(dishName);
  }
}
