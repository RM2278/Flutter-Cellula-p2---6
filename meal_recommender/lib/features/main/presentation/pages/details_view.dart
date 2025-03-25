import 'package:flutter/material.dart';
import 'package:meal_recommender/core/constants/icon_paths.dart';
import 'package:meal_recommender/core/services/snackbar_service.dart';
import '../widgets/details_body.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isFavorite = false;

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

  void _toggleFavorite(BuildContext context) {
    setState(() {
      _isFavorite = !_isFavorite;
    });

    _isFavorite
        ? SnackBarService.showSuccessMessage("Added to Favorites! ❤️")
        : SnackBarService.showErrorMessage("remove from Favorites! 💔");
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
            icon: Image.asset(
              _isFavorite ? IconPaths.heart2 : IconPaths.heart1,
            ),
            onPressed: () => _toggleFavorite(context),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: DetailsBody(theme: theme, tabController: _tabController),
    );
  }
}
