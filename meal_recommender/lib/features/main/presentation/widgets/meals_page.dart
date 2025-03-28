import 'package:flutter/material.dart';
import 'package:meal_recommender/features/main/presentation/manager/bloc/meals_bloc.dart';
import 'package:meal_recommender/features/main/presentation/manager/bloc/meals_event.dart';
import 'package:meal_recommender/features/main/presentation/manager/bloc/meals_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'recpie_card.dart';

class MealsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealsBloc, MealsState>(
      builder: (context, state) {
        if (state is MealsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MealsLoaded) {
          return ListView.builder(
            itemCount: state.meals.length,
            itemBuilder: (context, index) {
              final meal = state.meals[index];
              return MealCard(
                
                meal: meal, 
                onLike: () => context.read<MealsBloc>().add(LikeMeal(meal.id)),
                onRate: (rating) => context.read<MealsBloc>().add(
                      RateMeal(meal.id, rating),
                    ),
              );
            },
          );
        } else {
          return const Center(child: Text("Error loading meals"));
        }
      },
    );
  }
}
