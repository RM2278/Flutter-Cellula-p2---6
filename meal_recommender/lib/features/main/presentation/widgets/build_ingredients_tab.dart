import 'package:flutter/material.dart';

import '../../../ai/data/models/dish_model.dart';

Widget buildIngredientsTab(ThemeData theme, DishModel dish) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Total Ingredients: ${dish.ingredients.length}",
          style: theme.textTheme.titleMedium,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: dish.ingredients.length,
            itemBuilder: (context, index) {
              final ingredient = dish.ingredients[index];
              return Card(
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: ingredient.imageUrl.isNotEmpty
                      ? Image.network(
                          ingredient.imageUrl,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.broken_image),
                        )
                      : const Icon(Icons.fastfood, color: Colors.grey),
                  title: Text(ingredient.name),
                  subtitle: Text("${ingredient.quantity} ${ingredient.unit}"),
                  trailing: const Icon(Icons.check_circle_outline,
                      color: Colors.blue),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
