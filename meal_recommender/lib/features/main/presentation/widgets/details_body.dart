import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:meal_recommender/features/main/presentation/widgets/build_direction_tab.dart';


import '../../domain/entities/dish_entity.dart';
import 'build_ingredients_tab.dart';
import 'build_summary_tab.dart';

class DetailsBody extends StatelessWidget {
  final Dish dish;
  const DetailsBody({
    super.key,
    required this.theme,
    required TabController tabController,
    required this.dish,
  }) : _tabController = tabController;

  final ThemeData theme;
  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _mealCachedImage(),
        const SizedBox(height: 15),
        _mealMainContent(),
        const SizedBox(height: 10),
        _tabBar(),
        _tabBarView(),
      ],
    );
  }

  FadeInLeftBig _mealCachedImage() {
    return FadeInLeftBig(
        child: CachedNetworkImage(
          imageUrl: dish.imageUrl,
          width: double.infinity,
          height: 250,
          fit: BoxFit.cover,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      );
  }

  Padding _mealMainContent() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInLeftBig(
              child: Text(
                dish.name,
                style: theme.textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 5),
            FadeInLeftBig(
              child: Text(
                "${dish.typeOfMeal} • ${dish.time} min • 1 serving",
                style:
                    theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
              ),
            ),
            FadeInLeftBig(
              child: Text(
                "Diffeculty: ${dish.diffeculty}",
                style:
                    theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
              ),
            ),
          ],
        ),
      );
  }

  Expanded _tabBarView() {
    return Expanded(
        child: TabBarView(
          controller: _tabController,
          children: [
            buildSummaryTab(theme,dish),
            buildIngredientsTab(theme,dish),
            buildDirectionTab(theme,dish),
          ],
        ),
      );
  }

  FadeInRightBig _tabBar() {
    return FadeInRightBig(
        child: TabBar(
          controller: _tabController,
          labelColor: theme.primaryColor,
          unselectedLabelColor: Colors.grey,
          indicatorColor: theme.primaryColor,
          tabs: const [
            Tab(text: "Summary"),
            Tab(text: "Ingredients"),
            Tab(text: "Direction"),
          ],
        ),
      );
  }
}
