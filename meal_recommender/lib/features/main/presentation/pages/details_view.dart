import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meal_recommender/core/constants/icon_paths.dart';
import '../widgets/build_direction_tab.dart';
import '../widgets/build_ingredients_tab.dart';
import '../widgets/build_summary_tab.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Shawerma',
          style: theme.textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            icon: Image.asset(IconPaths.heart1),
            onPressed: () {},
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
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
      ),
    );
  }
}
