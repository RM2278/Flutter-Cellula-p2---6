import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




import '../../../../../core/constants/icon_paths.dart';
import '../../../../../core/routes/page_route_name.dart';
import '../../../../../core/services/snackbar_service.dart';
import '../../../../../core/themes/color_palette.dart';
import '../../../../../core/widgets/custom_text_form_filed.dart';
import '../../../domain/entities/dish_entity.dart';
import '../manager/dish_bloc.dart';
import '../manager/dish_event.dart';
import '../manager/dish_state.dart';
import 'ai_list_view_item.dart';

class AiBody extends StatefulWidget {
  AiBody({super.key});

  @override
  State<AiBody> createState() => _AiBodyState();
}

class _AiBodyState extends State<AiBody> {
  TextEditingController controller = TextEditingController();
 bool _isFavorite=false;
  List<Dish> allDishes = [];
  Set<String> favoriteDishes = {};
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocListener<DishBloc, DishState>(
          listener: (context, state) {
            if (state is DishLoaded){
              final newDishes = state.dishes.where((newDish) =>
              !allDishes.any((oldDish) => oldDish.name == newDish.name)).toList();

              setState(() {
                allDishes.addAll(newDishes); // Append new results
              });
            }},
            child:  Expanded(
                child: ListView.builder(
              itemCount: allDishes.length,
              itemBuilder: (context, index) {
                final isFavorite = favoriteDishes.contains(allDishes[index].id);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(
                        context,
                        PageRouteName.detailsView,
                        arguments: allDishes[index],
                      );
                    },
                    child: AiItemBuilder(
                        MediaQuery.of(context).size.width,
                        allDishes[index].imageUrl,
                        allDishes[index].name,
                        "${allDishes[index].ingredients.length.toString()} ingredients",
                        "${allDishes[index].time.toString()} min",
                          () {
                        setState(() {
                          if (isFavorite) {
                            favoriteDishes.remove(allDishes[index].id);
                            BlocProvider.of<DishBloc>(context).add(RemoveFavoriteDishEvent(allDishes[index].id));
                            SnackBarService.showErrorMessage("Removed from Favorites! 💔");
                          } else {
                            favoriteDishes.add(allDishes[index].id!);
                            BlocProvider.of<DishBloc>(context).add(AddFavoriteDishEvent(allDishes[index]));
                            SnackBarService.showSuccessMessage("Added to Favorites! ❤️");
                          }
                        });
                      },
                      Image.asset(
                        isFavorite ? IconPaths.heart2 : IconPaths.heart1,
                      ),
                        ),
                  ),
                );
              },
            ))
          ,
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: CustomTextFormFiled(
            color: BaseColorPalette.mainColor,
            hintText: "Enter your ingredients and your goal",
            controller: controller,
            validator: (_) {},
            suffixIcon: IconButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                BlocProvider.of<DishBloc>(context).add(GetDishByNameEvent(controller.text));              },
              icon: Image.asset(IconPaths.send),
            ),
          ),
        )
      ],
    );
  }
}
