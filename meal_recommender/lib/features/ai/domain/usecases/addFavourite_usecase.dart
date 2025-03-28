import 'package:dartz/dartz.dart';
import 'package:meal_recommender/features/ai/domain/entities/dish_entity.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_failure.dart';
import '../repositories/dish_repository.dart';

class AddFavoriteUseCase{
  DishRepository favoritesRepository;
  AddFavoriteUseCase(this.favoritesRepository);

  Future<Either<Failure, void>> execute(Dish meal) async {
    try {
      await favoritesRepository.addFavorite(meal);
      return const Right(null); // Success case
    } catch (e) {
      return Left(ServerFailure(statusCode: "500", errMessage: e.toString()));
    }
  }
}