import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_failure.dart';
import '../repositories/dish_repository.dart';


class RemoveFavoriteUseCase {
  DishRepository favoritesRepository;
  RemoveFavoriteUseCase(this.favoritesRepository);
  Future<Either<Failure, void>> execute(String mealId) async {
    try {
      await favoritesRepository.removeFavorite(mealId);
      return const Right(null); // Success case
    } catch (e) {
      return Left(ServerFailure(statusCode: "500", errMessage: e.toString()));
    }
  }
}