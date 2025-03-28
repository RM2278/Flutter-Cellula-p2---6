import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:meal_recommender/core/constants/icon_paths.dart';
import 'package:meal_recommender/core/services/snackbar_service.dart';
import '../../../ai/data/models/dish_model.dart';
import '../../../ai/domain/entities/dish_entity.dart';
import '../widgets/details_body.dart';

class DetailsView extends StatefulWidget {
  // final DishModel dish;
   DetailsView({
    super.key,
    required this.data
  });
Dish data;
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
    Dish testDish = widget.data;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: _appBar(context, testDish, theme),
      body: _mealDetailsBody(theme, testDish),
    );
  }

  FadeInDown _mealDetailsBody(ThemeData theme, Dish testDish) {
    return FadeInDown(
        child: DetailsBody(
      theme: theme,
      tabController: _tabController,
      dish: testDish,
    ));
  }

  AppBar _appBar(BuildContext context, Dish testDish, ThemeData theme) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      centerTitle: true,
      title: Text(
        testDish.name,
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
    );
  }
}
