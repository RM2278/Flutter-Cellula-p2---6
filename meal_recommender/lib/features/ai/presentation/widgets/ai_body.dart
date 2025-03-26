import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommender/features/ai/domain/entities/dish_entity.dart';
import 'package:meal_recommender/features/ai/presentation/manager/dish_bloc.dart';
import 'package:meal_recommender/features/ai/presentation/manager/dish_state.dart';
import 'package:meal_recommender/features/ai/presentation/widgets/ai_list_view_item.dart';
import '../../../../core/constants/icon_paths.dart';
import '../../../../core/themes/color_palette.dart';
import '../../../../core/widgets/custom_text_form_filed.dart';
import '../manager/dish_event.dart';

class AiBody extends StatefulWidget {
  AiBody({super.key});

  @override
  State<AiBody> createState() => _AiBodyState();
}

class _AiBodyState extends State<AiBody> {
  TextEditingController controller = TextEditingController();

  List<Dish> allDishes = [];

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
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AiItemBuilder(
                      MediaQuery.of(context).size.width,
                      allDishes[index].imageUrl,
                      allDishes[index].name,
                      "${allDishes[index].ingredients.length.toString()} ingredients",
                      "${allDishes[index].time.toString()} min",
                      () {} // add to fav,
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
