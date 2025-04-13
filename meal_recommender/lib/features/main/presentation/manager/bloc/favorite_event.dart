import 'package:equatable/equatable.dart';



import '../../../domain/entities/dish_entity.dart';


/*abstract class FavoritesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadFavorites extends FavoritesEvent {}

class ToggleFavorite extends FavoritesEvent {
  final String mealId;
  ToggleFavorite(this.mealId);

  @override
  List<Object> get props => [mealId];
}

class NavigateToFavorites extends FavoritesEvent {}*/
abstract class FavoritesEvent {}

class LoadFavorites extends FavoritesEvent {}

class AddFavorite extends FavoritesEvent {
  final Dish dishModel;
  AddFavorite(this.dishModel);
}

class RemoveFavorite extends FavoritesEvent {
  final String dishId;
  RemoveFavorite(this.dishId);
}
