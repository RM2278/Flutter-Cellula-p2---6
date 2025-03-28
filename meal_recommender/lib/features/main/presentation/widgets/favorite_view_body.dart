import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routes/page_route_name.dart';
import '../../domain/entities/meals.dart';
import '../../domain/repositories/meals_repository.dart';
import '../manager/bloc/favorite_bloc.dart';
import '../manager/bloc/favorite_event.dart';
import '../manager/bloc/favorite_state.dart';
import 'recpie_card.dart';
import 'app_bar.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: screenHeight * 0.02,
      ),
      child: Column(
        children: [
          AppBarHome(screenWidth: screenWidth),
          SizedBox(height: screenHeight * 0.02),
          Expanded(
            child: BlocBuilder<FavoritesBloc, FavoritesState>(
              builder: (context, state) {
                if (state is FavoritesLoading) {
                  // ✅ استخدام حالة التحميل الصحيحة
                  return const Center(child: CircularProgressIndicator());
                } else if (state is FavoritesLoaded) {
                  if (state.favorites.isEmpty) {
                    return const Center(child: Text("No favorites yet!"));
                  }



                  return ListView.builder(
                    itemCount: state.favorites.length,
                    itemBuilder: (context, index) {
                      final meal = state.favorites[index];
                          return InkWell(
                            onTap: (){
                              //Move to details

                              /*Navigator.pushNamed(
                                context,
                                PageRouteName.detailsView,
                                arguments: meal,
                              );*/
                            },
                            child: MealCard(
                              meal: meal,
                              onLike: () {

                              },
                              onRate: (rating) {},
                            ),
                          );
                        },
                      );

                } else {
                  return const Center(child: Text("Something went wrong!"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
