import 'package:flutter/material.dart';
import 'package:meal_recommender/features/main/presentation/widgets/build_direction_tab.dart';

import 'build_ingredients_tab.dart';
import 'build_summary_tab.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({
    super.key,
    required this.theme,
    required TabController tabController,
  }) : _tabController = tabController;

  final ThemeData theme;
  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // CachedNetworkImage(
        //   imageUrl:
        //       'https://playswellwithbutter.com/wp-content/uploads/2021/03/Shawarma-Marinade-12.jpg',
        //   width: double.infinity,
        //   height: 200,
        //   fit: BoxFit.cover,
        //   placeholder: (context, url) =>
        //       const Center(child: CircularProgressIndicator()),
        //   errorWidget: (context, url, error) => const Icon(Icons.error),
        // ),
        Image.network(
            "https://playswellwithbutter.com/wp-content/uploads/2021/03/Shawarma-Marinade-12.jpg"),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Shawerma",
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 5),
              Text(
                "meat • 14 min • 1 serving",
                style:
                    theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        TabBar(
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
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              buildSummaryTab(theme),
              buildIngredientsTab(theme),
              buildDirectionTab(theme),
            ],
          ),
        ),
      ],
    );
  }
}
