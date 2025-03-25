import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:meal_recommender/core/constants/icon_paths.dart';
import 'package:meal_recommender/core/services/snackbar_service.dart';
import '../../../ai/data/models/dish_model.dart';
import '../widgets/details_body.dart';

class DetailsView extends StatefulWidget {
  // final DishModel dish;
  const DetailsView({
    super.key,
  });

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
    DishModel testDish = DishModel(
      name: "Shawerma",
      summary: "A delicious meat-based dish wrapped in soft bread.",
      diffeculty: "Easy",
      typeOfMeal: "Dinner",
      time: 14,
      imageUrl:
          "https://playswellwithbutter.com/wp-content/uploads/2021/03/Shawarma-Marinade-12.jpg",
      ingredients: [
        IngredientModel(
            name: "Bread", quantity: "2", unit: "pcs", imageUrl: ""),
        IngredientModel(
            name: "Tomato", quantity: "2", unit: "pcs", imageUrl: ""),
        IngredientModel(
            name: "Carrot", quantity: "2", unit: "pcs", imageUrl: ""),
        IngredientModel(name: "Meat", quantity: "200", unit: "g", imageUrl: ""),
        IngredientModel(name: "Meat", quantity: "200", unit: "g", imageUrl: ""),
      ],
      nutrition: NutritionModel(
        calories: "400 kcal",
        protein: "40g",
        carbs: "40g",
        fat: "40g",
        vitamins: ["Vitamin A", "Vitamin C", "Vitamin D"],
      ),
      directions: DirectionsModel(
        firstStep: "Marinate the meat for at least 2 hours.",
        secondStep: "Grill the meat until fully cooked.",
        additionalSteps: [
          "Slice the meat into thin strips.",
          "Toast the bread slightly.",
          "Add vegetables and sauce to the wrap.",
          "Roll and serve hot."
        ],
      ),
    );
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: FadeInDown(
          child: DetailsBody(
        theme: theme,
        tabController: _tabController,
        dish: testDish,
      )),
    );
  }
}
