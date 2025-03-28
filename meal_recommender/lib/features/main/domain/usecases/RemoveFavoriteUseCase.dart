import '../repositories/favorite_repository.dart';

class RemoveFavoriteUseCase {
  FavoritesRepository favoritesRepository;
  RemoveFavoriteUseCase(this.favoritesRepository);

  Future<void> execute(String mealId) async {
    await favoritesRepository.removeFavorite(mealId);
  }
}