import 'package:flutter/material.dart';

import '../../domain/entities/dish_entity.dart';




Widget buildIngredientsTab(ThemeData theme, Dish dish) {
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
                  leading: const Icon(Icons.fastfood, color: Colors.grey),
                  title: Text(ingredient.name!),
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
