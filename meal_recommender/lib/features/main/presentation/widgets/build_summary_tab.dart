import 'package:flutter/material.dart';

import 'build_nutrition_item.dart';

Widget buildSummaryTab(ThemeData theme) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis euismod, tempor incididunt ut labore et dolore magna aliqua.",
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 20),
        Text("Nutritions", style: theme.textTheme.titleMedium),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNutritionItem("40g", "protein"),
            buildNutritionItem("40g", "carb"),
            buildNutritionItem("40g", "fat"),
            buildNutritionItem("400", "kcal"),
            buildNutritionItem("20mg", "vitamines"),
          ],
        ),
      ],
    ),
  );
}
