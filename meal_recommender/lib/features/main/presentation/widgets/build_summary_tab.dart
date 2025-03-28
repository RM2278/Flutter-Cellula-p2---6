import 'package:flutter/material.dart';
import '../../../ai/data/models/dish_model.dart';
import '../../../ai/domain/entities/dish_entity.dart';
import 'build_nutrition_item.dart';

Widget buildSummaryTab(ThemeData theme, Dish dish) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: ListView(

      children: [
        Text(
          dish.summary,
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 20),

        
        Text("Nutritions", style: theme.textTheme.titleMedium),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNutritionItem(dish.nutrition.protein, "Protein"),
            buildNutritionItem(dish.nutrition.carbs, "Carbs"),
            buildNutritionItem(dish.nutrition.fat, "Fat"),
            buildNutritionItem(dish.nutrition.calories, "Kcal"),
          ],
        ),
        const SizedBox(height: 20),

        Text("Vitamins", style: theme.textTheme.titleMedium),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: dish.nutrition.vitamins.isNotEmpty
              ? dish.nutrition.vitamins
                  .map((vitamin) => buildNutritionItem(vitamin, ""))
                  .toList()
              : [buildNutritionItem("N/A", "Vitamins")],
        ),
      ],
    ),
  );
}
