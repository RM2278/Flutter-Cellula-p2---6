import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommender/core/constants/icon_paths.dart';
import 'package:meal_recommender/core/services/snackbar_service.dart';
import 'package:meal_recommender/features/ai/domain/entities/dish_entity.dart';
import 'package:meal_recommender/features/ai/presentation/manager/dish_state.dart';

import '../../../../core/dl/Dependency_Injection.dart';
import '../../../ai/data/models/dish_model.dart';
import '../../../ai/presentation/manager/dish_bloc.dart';
import '../../../ai/presentation/manager/dish_event.dart';
import '../widgets/details_body.dart';

class DetailsView extends StatefulWidget {
  final DishModel dish = DishModel(
    name: "Shawerma",
    summary: "A delicious meat-based dish wrapped in soft bread.",
    diffeculty: "Easy",
    typeOfMeal: "Dinner",
    time: 14,
    imageUrl:
        "https://playswellwithbutter.com/wp-content/uploads/2021/03/Shawarma-Marinade-12.jpg",
    ingredients: [
      IngredientModel(name: "Bread", quantity: "2", unit: "pcs", imageUrl: ""),
      IngredientModel(name: "Tomato", quantity: "2", unit: "pcs", imageUrl: ""),
      IngredientModel(name: "Carrot", quantity: "2", unit: "pcs", imageUrl: ""),
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
    id: '5454657658768',
  );

  DetailsView({
    super.key,
    //  required this.dish,
    //  required this.userId,
    // required Dish data,
  });

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Set<String> favoriteDishes = {};
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
      appBar: _appBar(context, theme),
      body: FadeInDown(
        child: DetailsBody(
          theme: theme,
          tabController: _tabController,
          dish: widget.dish,
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context, ThemeData theme) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      centerTitle: true,
      title: Text(widget.dish.name, style: theme.textTheme.titleLarge),
      actions: [
        BlocBuilder<DishBloc, DishState>(
          builder: (context, state) {
            bool isFavorite = false;

            if (state is DishLoaded) {
              isFavorite = favoriteDishes.contains(widget.dish.id);
            }

            return IconButton(
              icon:
                  Image.asset(isFavorite ? IconPaths.heart2 : IconPaths.heart1),
              onPressed: () {
                final user = FirebaseAuth.instance.currentUser;
                if (user == null) return;

                if (isFavorite) {
                  favoriteDishes.remove(widget.dish.id);
                  BlocProvider.of<DishBloc>(context)
                      .add(RemoveFavoriteDishEvent(widget.dish.id!));
                  SnackBarService.showErrorMessage(
                      "Removed from Favorites! 💔");
                } else {
                  favoriteDishes.add(widget.dish.id!);
                  BlocProvider.of<DishBloc>(context)
                      .add(AddFavoriteDishEvent(widget.dish));
                  SnackBarService.showSuccessMessage("Added to Favorites! ❤️");
                }
              },
            );
          },
        ),
      ],
    );
  }
}
