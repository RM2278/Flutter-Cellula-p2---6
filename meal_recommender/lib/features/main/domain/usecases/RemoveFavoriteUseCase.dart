import 'package:dartz/dartz.dart';
import 'package:meal_recommender/features/main/domain/repositories/favorite_repository.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_failure.dart';

class RemoveFavoriteUseCase {
  FavoritesRepository favoritesRepository;
  RemoveFavoriteUseCase(this.favoritesRepository);
  Future<Either<Failure, void>> execute(String mealId) async {
    try {
      await favoritesRepository.removeFavorite(mealId);
      return const Right(null); 
    } catch (e) {
      return Left(ServerFailure(statusCode: "500", errMessage: e.toString()));
    }
  }
}