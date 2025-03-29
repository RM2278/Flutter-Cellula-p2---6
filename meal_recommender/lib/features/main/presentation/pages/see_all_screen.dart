import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommender/core/routes/app_views.dart';

import '../../../../core/constants/icon_paths.dart';
import '../../../../core/dl/Dependency_Injection.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../core/themes/color_palette.dart';
import '../manager/bloc/see_all_events.dart';
import '../manager/bloc/see_all_states.dart';
import '../widgets/recommened.dart';
import '../manager/bloc/see_all_bloc.dart';

import '../widgets/trending.dart';

class SeeAllScreen extends StatefulWidget {
  @override
  State<SeeAllScreen> createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> {
  Set<String> favoriteDishes = {};
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => sl<SeeAllBloc>()
        ..add(FetchTrendingMeals(4))
        ..add(FetchRecommendedMeals(8)),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu_sharp,
                color: BaseColorPalette.mainColor, size: screenWidth * 0.07),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications,
                  color: BaseColorPalette.mainColor, size: screenWidth * 0.07),
            ),
          ],
        ),
        body: BlocBuilder<SeeAllBloc, SeeAllState>(
          builder: (context, state) {
            if (state is SeeAllLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SeeAllLoaded) {
              print("Trending Items Length: ${state.trendingMeals.length}");
              print(
                  "Recommended Items Length: ${state.recommendedMeals.length}");

              return Padding(
                padding: EdgeInsets.all(screenWidth * 0.045),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Trending Recipes',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: screenWidth * 0.05,
                    ),
                    SizedBox(
                      height: screenWidth * 0.45,
                      child: Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.trendingMeals.length,
                          itemBuilder: (context, index) {
                            final dish = state.trendingMeals[index];
                            return InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, PageRouteName.detailsView,
                                  arguments: dish),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: TrendingItemBuilder(
                                    MediaQuery.of(context).size.height,
                                    MediaQuery.of(context).size.width,
                                    dish.imageUrl,
                                    dish.name,
                                    '${dish.ingredients.length} ingredients',
                                    '${dish.time} min'),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 0.05,
                    ),
                    const Text('Recommended For You',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: screenWidth * 0.05,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.recommendedMeals.length,
                        itemBuilder: (context, index) {
                          final dish = state.recommendedMeals[index];
                          final isFavorite = favoriteDishes.contains(dish.id);
                          return InkWell(
                            onTap: () => Navigator.pushNamed(
                                context, PageRouteName.detailsView,
                                arguments: dish),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RecommendedItemBuilder(
                                MediaQuery.of(context).size.width,
                                dish.imageUrl,
                                dish.name,
                                '${dish.ingredients.length} ingredients',
                                '${dish.time} min',
                                () {
                                  setState(() {
                                    if (isFavorite) {
                                      favoriteDishes.remove(dish.id);
                                      BlocProvider.of<SeeAllBloc>(context).add(
                                          RemoveFavoriteDishEvent(dish.id));
                                      SnackBarService.showErrorMessage(
                                          "Removed from Favorites! 💔");
                                    } else {
                                      favoriteDishes.add(dish.id!);
                                      BlocProvider.of<SeeAllBloc>(context)
                                          .add(AddFavoriteDishEvent(dish));
                                      SnackBarService.showSuccessMessage(
                                          "Added to Favorites! ❤️");
                                    }
                                  });
                                },
                                Image.asset(
                                  isFavorite
                                      ? IconPaths.heart2
                                      : IconPaths.heart1,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is SeeAllError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
