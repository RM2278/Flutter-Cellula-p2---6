import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommender/core/themes/color_palette.dart';
import 'package:meal_recommender/core/widgets/custom_text_form_filed.dart';
import 'package:meal_recommender/core/widgets/text_widget.dart';

import 'package:meal_recommender/features/main/presentation/widgets/CustomIngrediantes.dart';
import 'package:meal_recommender/features/main/presentation/widgets/header.dart';

import '../../../../core/widgets/custom_elevated_button.dart';

import 'custom_button.dart';
import 'custom_text_form_filed.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {

  String? mealType, difficulty, time;
  TextEditingController ingredientsCount = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 700 / 776,
      padding: const EdgeInsets.all(17),
      //margin: EdgeInsets.all(12),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 10 / 776,
            ),
            Header(
              ontap: () {
                setState(() {
                  mealType = '';
                  difficulty = '';
                  time = '';
                  ingredientsCount.text = '';
                });
              },
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 20 / 776,
            ),
            const TextWidget(
              text: "Meal",
              size: 20,
              color: BaseColorPalette.mainColor,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 20 / 776,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  text: "Breakfast",
                  type: mealType,
                  ontap: () {
                    setState(() {
                      mealType = "Breakfast";
                    });
                  },
                ),
                CustomButton(
                  text: "Lunch",
                  type: mealType,
                  ontap: () {
                    setState(() {
                      mealType = "Lunch";
                    });
                  },
                ),
                CustomButton(
                  text: "Dinner",
                  type: mealType,
                  ontap: () {
                    setState(() {
                      mealType = "Dinner";
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 20 / 776,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  text: "Drink",
                  type: mealType,
                  ontap: () {
                    setState(() {
                      mealType = "Drink";
                    });
                  },
                ),
                CustomButton(
                  text: "Dessert",
                  type: mealType,
                  ontap: () {
                    setState(() {
                      mealType = "Dessert";
                    });
                  },
                ),
                CustomButton(
                  text: "Snacks",
                  type: mealType,
                  ontap: () {
                    setState(() {
                      mealType = "Snacks";
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 20 / 776,
            ),
            const TextWidget(
              text: "Time",
              size: 20,
              color: BaseColorPalette.mainColor,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 20 / 776,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  text: "5min",
                  type: time,
                  ontap: () {
                    setState(() {
                      time = "5min";
                    });
                  },
                ),
                CustomButton(
                  text: "10min",
                  type: time,
                  ontap: () {
                    setState(() {
                      time = "10min";
                    });
                  },
                ),
                CustomButton(
                  text: "15min",
                  type: time,
                  ontap: () {
                    setState(() {
                      time = "15min";
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 20 / 776,
            ),
            const TextWidget(
              text: "Diffeculty",
              size: 20,
              color: BaseColorPalette.mainColor,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 20 / 776,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  text: "Beginner",
                  type: difficulty,
                  ontap: () {
                    setState(() {
                      difficulty = "Beginner";
                    });
                  },
                ),
                CustomButton(
                  text: "medium",
                  type: difficulty,
                  ontap: () {
                    setState(() {
                      difficulty = "medium";
                    });
                  },
                ),
                CustomButton(
                  text: "cheff",
                  type: difficulty,
                  ontap: () {
                    setState(() {
                      difficulty = "cheff";
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 20 / 776,
            ),
            CustomIngrediantes(ingredientsCount: ingredientsCount),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: CustomElevatedButton(
                buttonColor: BaseColorPalette.mainColor,
                textColor: BaseColorPalette.white,
                onPressed: () {
                  if (mealType != '' &&
                      time != '' &&
                      difficulty != '' &&
                      ingredientsCount.text != '') {
                   /* String value = time!.replaceAll("min", "");
                    FilterEntity filter = FilterEntity(
                        name: "",
                        mealType: mealType,
                        time: int.parse(value),
                        difficulty: difficulty,
                        ingredientsCount: int.parse(ingredientsCount.text));
                    filterBloc.add(
                        GetFilterResultEvent(filterEntity: filter));*/
                  }
                },
                text: "Apply",
              ),
            )
          ],
        ),
      ),
    );
  }
}
