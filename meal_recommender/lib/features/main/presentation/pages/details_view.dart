import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommender/core/constants/icon_paths.dart';
import 'package:meal_recommender/core/dl/Dependency_Injection.dart';
import 'package:meal_recommender/core/services/snackbar_service.dart';

import 'package:meal_recommender/features/main/domain/entities/dish_entity.dart';

import '../ai/manager/dish_bloc.dart';
import '../ai/manager/dish_event.dart';
import '../ai/manager/dish_state.dart';
import '../widgets/details_body.dart';

class DetailsView extends StatefulWidget {
  late Dish dish;
  DetailsView({
    super.key,
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
    widget.dish = ModalRoute.of(context)!.settings.arguments as Dish;
    return BlocProvider(
      create: (context) => sl<DishBloc>(),
      child: Scaffold(
        appBar: _appBar(context, theme),
        body: FadeInDown(
          child: DetailsBody(
            theme: theme,
            tabController: _tabController,
            dish: widget.dish,
          ),
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
                  SnackBarService.showSuccessMessage("Added to Favorites! ❤");
                }
              },
            );
          },
        ),
      ],
    );
  }
}
