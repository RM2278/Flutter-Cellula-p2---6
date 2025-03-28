import '../repositories/favorite_repository.dart';

class GetMealsUseCase{
  FavoritesRepository favoritesRepository;
  GetMealsUseCase(this.favoritesRepository);

  Future excute() async {
    var data=await favoritesRepository.getFavorites();
    return data;
  }
}