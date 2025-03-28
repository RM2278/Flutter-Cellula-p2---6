import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_recommender/features/auth/data/repositories/login_repo_impl.dart';
import '../../../../core/dl/Dependency_Injection.dart';
import '../../../../core/themes/color_palette.dart';
import '../../domain/repositories/favorite_repository.dart';
import '../manager/bloc/favorite_bloc.dart';
import '../manager/bloc/favorite_event.dart';
import '../widgets/favorite_view_body.dart';

import '../../domain/repositories/meals_repository.dart'; // ✅ استيراد MealsRepository

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<FavoritesBloc>()..add(LoadFavorites()),
      child: Scaffold(
        backgroundColor: BaseColorPalette.white,
        body: SafeArea(
          child: FavoriteViewBody(),
        ),

      ),
    );
  }
}

