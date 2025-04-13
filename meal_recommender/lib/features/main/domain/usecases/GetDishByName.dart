import 'package:dartz/dartz.dart';


import '../../../../core/errors/failure.dart';
import '../entities/dish_entity.dart';
import '../repositories/dish_repository.dart';


class GetDishByName   {
  final DishRepository repository;

  GetDishByName(this.repository);


  Future<Either<Failure, Dish>> call(String dishName) async {
    return await repository.getDishByName(dishName);
  }
}