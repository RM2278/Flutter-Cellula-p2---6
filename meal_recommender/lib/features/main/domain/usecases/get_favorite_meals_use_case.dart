import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../ai/data/models/dish_model.dart';
import '../repositories/favorite_meals_repository.dart';

class GetFavoriteMealsUseCase {
  final FavoriteMealsRepository repository;

  GetFavoriteMealsUseCase({required this.repository});

  Future<Either<Failure, List<DishModel>>> call(String userId) async {
    return await repository.getFavoriteMeals(userId);
  }
}
