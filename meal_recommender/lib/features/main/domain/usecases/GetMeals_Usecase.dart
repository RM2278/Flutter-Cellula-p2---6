import '../repositories/dish_repository.dart';

class GetMealsUseCase{
  DishRepository favoritesRepository;
  GetMealsUseCase(this.favoritesRepository);

  Future excute() async {
    var data=await favoritesRepository.getFavorites();
    return data;
  }
}