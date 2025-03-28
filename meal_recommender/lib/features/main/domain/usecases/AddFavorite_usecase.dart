import '../repositories/favorite_repository.dart';

class AddFavoriteUseCase{
  FavoritesRepository favoritesRepository;
  AddFavoriteUseCase(this.favoritesRepository);

  Future excute(Map<String,dynamic> meal) async {
     await favoritesRepository.addFavorite(meal);
  }
}