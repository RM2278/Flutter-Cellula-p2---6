// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meal_recommender/features/main/domain/repositories/meals_repository.dart';
// import 'package:meal_recommender/features/main/domain/usecases/get_meals.dart';
// import 'meals_event.dart';
// import 'meals_state.dart';

// class MealsBloc extends Bloc<MealsEvent, MealsState> {
//   final GetMeals getMeals;
//   final MealsRepository repository;

//   MealsBloc({required this.getMeals, required this.repository})
//       : super(MealsInitial()) {
//     on<LoadMeals>(_onLoadMeals);
//     on<LikeMeal>(_onLikeMeal);
//     on<RateMeal>(_onRateMeal);
//   }

//   Future<void> _onLoadMeals(LoadMeals event, Emitter<MealsState> emit) async {
//     emit(MealsLoading());
//     try {
//       final meals = await getMeals();
//       emit(MealsLoaded(meals));
//     } catch (e) {
//       emit(MealsError("$e: Failed to load meals"));
//     }
//   }

//   Future<void> _onLikeMeal(LikeMeal event, Emitter<MealsState> emit) async {
//     await repository.likeMeal(event.mealId);
//     add(LoadMeals());
//   }

//   Future<void> _onRateMeal(RateMeal event, Emitter<MealsState> emit) async {
//     await repository.rateMeal(event.mealId, event.rating);
//     add(LoadMeals());
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommender/features/main/domain/repositories/meals_repository.dart';
import 'package:meal_recommender/features/main/domain/usecases/get_meals.dart';
import 'meals_event.dart';
import 'meals_state.dart';

class MealsBloc extends Bloc<MealsEvent, MealsState> {
  final GetMeals getMeals;
  final MealsRepository repository;

  MealsBloc({required this.getMeals, required this.repository})
      : super(MealsInitial()) {
    on<LoadMeals>(_onLoadMeals);
  }
  Future<void> _onLoadMeals(LoadMeals event, Emitter<MealsState> emit) async {
    emit(MealsLoading());
    try {
      final recommendedDishes = await repository.getRecommendedDishes(10);
      emit(MealsLoaded(recommendedDishes));
    } catch (e) {
      emit(MealsError("$e: Failed to load meals"));
    }
  }
}
