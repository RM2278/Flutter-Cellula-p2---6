import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meal_recommender/core/constants/icon_paths.dart';
import '../widgets/build_direction_tab.dart';
import '../widgets/build_ingredients_tab.dart';
import '../widgets/build_summary_tab.dart';
import '../widgets/details_body.dart';

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
      body: DetailsBody(theme: theme, tabController: _tabController),
    );
  }
}
