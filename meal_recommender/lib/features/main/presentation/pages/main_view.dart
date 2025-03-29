import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meal_recommender/core/services/Gemini_service.dart';
import 'package:meal_recommender/features/main/domain/repositories/dish_repository.dart';
import '../../../../core/dl/Dependency_Injection.dart';
import '../../../../core/services/firebase_service.dart';

import '../../data/repositories/dish_repository_impl.dart';
import '../../domain/usecases/Recommend_meals.dart';
import '../manager/bloc/favorite_bloc.dart';
import '../manager/bloc/meals_bloc.dart';
import '../manager/bloc/meals_event.dart';
import 'favorite_view.dart';
import '../pages/home.dart';
import '../widgets/custom_nav_bar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Home(),
    const FavoriteView(),
    const Scaffold(body: Center(child: Text("Profile Page (Coming Soon)"))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<FirebaseService>(
          create: (context) => sl<FirebaseService>(),
        ),
        RepositoryProvider<DishRepository>(
          create: (context) => sl(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<MealsBloc>(
            create: (context) => sl<MealsBloc>(
            )..add(LoadMeals()),
          ),
          BlocProvider<FavoritesBloc>(
            create: (context) => sl<FavoritesBloc>(),
          ),
        ],
        child: Scaffold(
          body: _pages[_currentIndex],
          bottomNavigationBar: CustomBottomNavBar(
            currentIndex: _currentIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
