import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommender/features/ai/domain/entities/dish_entity.dart';
import '../../../../core/routes/page_route_name.dart';
import '../../domain/entities/meals.dart';
import '../../domain/repositories/meals_repository.dart';
import '../manager/bloc/meals_bloc.dart';
import '../manager/bloc/meals_event.dart';
import '../manager/bloc/meals_state.dart';
import 'recpie_card.dart';
import 'app_bar.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenHeight * 0.02,
      ),
      child: Column(
        children: [
          AppBarHome(screenWidth: screenWidth),
          SizedBox(height: screenHeight * 0.02),
          Expanded(
            child: BlocBuilder<MealsBloc, MealsState>(
              builder: (context, state) {
                if (state is MealsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MealsLoaded) {
                  if (state.dishes.isEmpty) {
                    return const Center(child: Text("No meals found!"));
                  }

                  return ListView.builder(
                    itemCount: state.dishes.length,
                    itemBuilder: (context, index) {
                      final dish = state.dishes[index];
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            PageRouteName.detailsView,
                            arguments: dish,
                          );
                        },
                        child: MealCard(
                          dish: dish,
                          onLike: () {
                            context.read<MealsBloc>().add(LikeMeal(dish.id));
                          },
                          onRate: (rating) {
                            context
                                .read<MealsBloc>()
                                .add(RateMeal(dish.id, rating));
                          },
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text("Error loading meals"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
