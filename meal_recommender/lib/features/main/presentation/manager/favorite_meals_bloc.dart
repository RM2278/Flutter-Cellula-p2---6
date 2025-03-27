import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommender/core/errors/failure.dart';
import 'package:meal_recommender/core/errors/server_failure.dart';
import 'package:meal_recommender/features/main/domain/usecases/add_meal_to_favorites_use_case.dart';
import 'package:meal_recommender/features/main/domain/usecases/get_favorite_meals_use_case.dart';
import 'package:meal_recommender/features/main/domain/usecases/remove_meal_from_favorites_use_case.dart';
import 'favorite_meals_event.dart';
import 'favorite_meals_state.dart';

class FavoriteMealsBloc extends Bloc<FavoriteMealsEvent, FavoriteMealsState> {
  final AddMealToFavoritesUseCase _addMealToFavoritesUseCase;
  final RemoveMealFromFavoritesUseCase _removeMealFromFavoritesUseCase;
  final GetFavoriteMealsUseCase _getFavoriteMealsUseCase;

  FavoriteMealsBloc({
    required AddMealToFavoritesUseCase addMealToFavoritesUseCase,
    required RemoveMealFromFavoritesUseCase removeMealFromFavoritesUseCase,
    required GetFavoriteMealsUseCase getFavoriteMealsUseCase,
  })  : _addMealToFavoritesUseCase = addMealToFavoritesUseCase,
        _removeMealFromFavoritesUseCase = removeMealFromFavoritesUseCase,
        _getFavoriteMealsUseCase = getFavoriteMealsUseCase,
        super(FavoriteMealsInitial()) {
    on<AddMealToFavoritesEvent>(_onAddMeal);
    on<RemoveMealFromFavoritesEvent>(_onRemoveMeal);
    on<GetFavoriteMealsEvent>(_onGetMeals);
  }

  Future<void> _onAddMeal(
      AddMealToFavoritesEvent event, Emitter<FavoriteMealsState> emit) async {
    emit(FavoriteMealsLoading());

    final result = await _addMealToFavoritesUseCase(event.userId, event.meal);

    result.fold(
      (failure) => emit(FavoriteMealsError(_mapFailureToMessage(failure))),
      (_) => add(GetFavoriteMealsEvent(userId: event.userId)),
    );
  }

  Future<void> _onRemoveMeal(RemoveMealFromFavoritesEvent event,
      Emitter<FavoriteMealsState> emit) async {
    emit(FavoriteMealsLoading());

    final result =
        await _removeMealFromFavoritesUseCase(event.userId, event.mealName);

    result.fold(
      (failure) => emit(FavoriteMealsError(_mapFailureToMessage(failure))),
      (_) => add(GetFavoriteMealsEvent(userId: event.userId)),
    );
  }

  Future<void> _onGetMeals(
      GetFavoriteMealsEvent event, Emitter<FavoriteMealsState> emit) async {
    emit(FavoriteMealsLoading());

    final result = await _getFavoriteMealsUseCase(event.userId);

    result.fold(
      (failure) => emit(FavoriteMealsError(_mapFailureToMessage(failure))),
      (meals) => emit(FavoriteMealsLoaded(meals)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return failure.errMessage;
    } else {
      return "Unexpected error occurred";
    }
  }
}
