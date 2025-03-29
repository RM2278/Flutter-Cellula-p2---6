import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommender/core/themes/color_palette.dart';
import 'package:meal_recommender/features/ai/data/models/dish_model.dart';
import '../manager/bloc/favorite_bloc.dart';
import '../manager/bloc/favorite_event.dart';
import '../manager/bloc/favorite_state.dart';

class MealCard extends StatelessWidget {
  final DishModel dish;
  final VoidCallback onLike;
  final Function(double) onRate;

  const MealCard({
    super.key,
    required this.dish,
    required this.onLike,
    required this.onRate,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(bottom: screenHeight * 0.015),
      padding: EdgeInsets.all(screenWidth * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenWidth * 0.03),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(screenWidth * 0.09),
            child: CachedNetworkImage(
              imageUrl: dish.imageUrl,
              width: screenWidth * 0.21,
              height: screenWidth * 0.22,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.grey[200],
                child: const Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          SizedBox(width: screenWidth * 0.03),
          MealCardDetails(
              dish: dish, screenWidth: screenWidth, screenHeight: screenHeight),
          BlocBuilder<FavoritesBloc, FavoritesState>(
            builder: (context, state) {
              final isFavorite = (state is FavoritesLoaded) &&
                  state.favorites.any((fav) => fav.id == dish.id);

              return IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.grey,
                  size: screenWidth * 0.07,
                ),
                onPressed: () {
                  final favoritesBloc = context.read<FavoritesBloc>();

                  if (isFavorite) {
                    favoritesBloc.add(RemoveFavorite(dish.id));
                  } else {
                    favoritesBloc.add(AddFavorite(dish));
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class MealCardDetails extends StatelessWidget {
  const MealCardDetails({
    super.key,
    required this.dish,
    required this.screenWidth,
    required this.screenHeight,
  });

  final DishModel dish;
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dish.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.045,
              color: BaseColorPalette.black,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: screenHeight * 0.005),
          Row(
            children: [
              Text(
                "${dish.ingredients.length} ingredients",
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  color: BaseColorPalette.gray,
                ),
              ),
              SizedBox(width: screenWidth * 0.06),
              Text(
                "${dish.time} min",
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  color: BaseColorPalette.mainColor,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.005),
          const Row(
              // children: List.generate(
              //   5,
              //   (index) => Icon(
              //     Icons.star,
              //     color: index < dish.rating.round() ? Colors.amber : Colors.grey,
              //     size: screenWidth * 0.04,
              //   ),
              // ),
              ),
        ],
      ),
    );
  }
}
