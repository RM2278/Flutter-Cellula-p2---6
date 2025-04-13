// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meal_recommender/features/main/presentation/manager/bloc/meals_bloc.dart';
// import 'package:meal_recommender/features/main/presentation/manager/bloc/meals_event.dart';
// import 'package:meal_recommender/features/main/presentation/manager/bloc/meals_state.dart';
// import 'app_bar.dart';
// import 'button_add.dart';
// import 'recipes_header.dart';
// import 'recpie_card.dart';
// import 'search_bar.dart';

// class HomePageBody extends StatelessWidget {
//   const HomePageBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: screenWidth * 0.05,
//             vertical: screenHeight * 0.02,
//           ),
//           child: Column(
//             children: [
//               //appbar

//               AppBarHome(screenWidth: screenWidth),
//               SizedBox(height: screenHeight * 0.02),
//               // Search Bar
//               Search_Bar(screenHeight: screenHeight, screenWidth: screenWidth),

//               SizedBox(height: screenHeight * 0.02),
//               // Add Ingredients Button
//               Button_Add(screenWidth: screenWidth, screenHeight: screenHeight),
//               SizedBox(height: screenHeight * 0.02),

//               // Top Recipes Header
//               Recipes_Header(screenWidth: screenWidth),
//               SizedBox(height: screenHeight * 0.02),

//               Expanded(
//                 child: ListView.builder(
//                   itemCount: 10,
//                   itemBuilder: (context, index) {
//                     return RecipeCard();
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// class MealsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MealsBloc, MealsState>(
//       builder: (context, state) {
//         if (state is MealsLoading) {
//           return Center(child: CircularProgressIndicator());
//         } else if (state is MealsLoaded) {
//           return ListView.builder(
//             itemCount: state.meals.length,
//             itemBuilder: (context, index) {
//               final meal = state.meals[index];
//               return MealCard(
//                 meal: meal,
//                 onLike: () => context.read<MealsBloc>().add(LikeMeal(meal.id)),
//                 onRate: (rating) =>
//                     context.read<MealsBloc>().add(RateMeal(meal.id, rating)),
//               );
//             },
//           );
//         } else {
//           return Center(child: Text("Error loading meals"));
//         }
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'package:meal_recommender/features/main/presentation/widgets/meals_page.dart';


import 'app_bar.dart';
import 'button_add.dart';
import 'recipes_header.dart';

import 'search_bar.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),
          child: Column(
            children: [
              AppBarHome(screenWidth: screenWidth),
              SizedBox(height: screenHeight * 0.02),
              Search_Bar(screenHeight: screenHeight, screenWidth: screenWidth),
              SizedBox(height: screenHeight * 0.02),
              Button_Add(screenWidth: screenWidth, screenHeight: screenHeight),
              SizedBox(height: screenHeight * 0.02),
              Recipes_Header(screenWidth: screenWidth),
              SizedBox(height: screenHeight * 0.02),
              Expanded(
                child: MealsPage(),
              ),
            ],
          ),
        );
      },
    );
  }
}
