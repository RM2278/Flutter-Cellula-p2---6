// import 'package:flutter/material.dart';
// import 'package:meal_recommender/core/themes/color_palette.dart';
// import 'package:meal_recommender/features/main/presentation/widgets/home_view_body.dart';

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       backgroundColor: BaseColorPalette.white,
//       body: SafeArea(
//         child: HomePageBody(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommender/core/themes/color_palette.dart';
import 'package:meal_recommender/features/main/data/repositories/meals_repository_impl.dart';
import 'package:meal_recommender/features/main/domain/usecases/get_meals.dart';
import 'package:meal_recommender/features/main/domain/repositories/meals_repository.dart';
import 'package:meal_recommender/features/main/presentation/manager/bloc/meals_bloc.dart';
import 'package:meal_recommender/features/main/presentation/manager/bloc/meals_event.dart';
import 'package:meal_recommender/features/main/presentation/widgets/home_view_body.dart';

import '../../../../core/dl/Dependency_Injection.dart';
import '../../../../core/services/firebase_service.dart';
import '../manager/bloc/favorite_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MealsBloc(
            repository: context.read<MealsRepositoryImpl>(),
            getMeals: GetMeals(context.read<MealsRepositoryImpl>()),
          )..add(LoadMeals()),
        ),
       BlocProvider(
          create: (context) => sl<FavoritesBloc>(),
        ),
      ],
      child: Scaffold(
        backgroundColor: BaseColorPalette.white,
        body: SafeArea(
          child: BlocProvider.value(
            value: context.read<MealsBloc>(), // ✅ توفير الـ Bloc لكامل الصفحة
            child: HomePageBody(),
          ),
        ),
      ),
    );
  }
}
