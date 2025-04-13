import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meal_recommender/features/main/presentation/manager/bloc/favorite_state.dart';
import '../../../../core/routes/page_route_name.dart';

import '../manager/bloc/favorite_bloc.dart';
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
            child: BlocBuilder<FavoritesBloc, FavoritesState>(
              builder: (context, state) {
                if (state is FavoritesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is FavoritesLoaded) {
                  if (state.favorites.isEmpty) {
                    return const Center(child: Text("No meals Favourite found!"));
                  }

                  return ListView.builder(
                    itemCount: state.favorites.length,
                    itemBuilder: (context, index) {
                      final dish = state.favorites[index];
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            PageRouteName.detailsView,
                            arguments: dish,
                          );
                        },
                        child: FadeInLeft(
                          child: MealCard(
                            isFavorite: true,
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
                        ),
                      );
                    },
                  );
                }
                else if(state is FavoritesInitial){
                  return const Center(child: Text(""));
                }
                else {
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
