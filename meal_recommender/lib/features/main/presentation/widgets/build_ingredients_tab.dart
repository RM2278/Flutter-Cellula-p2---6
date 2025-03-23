 import 'package:flutter/material.dart';

Widget buildIngredientsTab(ThemeData theme) {
    final ingredients = [
      {"name": "Bread", "amount": "2 pcs"},
      {"name": "Tomato", "amount": "2 pcs"},
      {"name": "Carrot", "amount": "2 pcs"},
      {"name": "Bread", "amount": "2 pcs"},
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Total Ingredients: 15", style: theme.textTheme.titleMedium),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: ingredients.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 0.5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    title: Text(ingredients[index]["name"]!),
                    subtitle: Text(ingredients[index]["amount"]!),
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