import 'package:flutter/material.dart';

import '../../../ai/data/models/dish_model.dart';
import '../../../ai/domain/entities/dish_entity.dart';

Widget buildDirectionTab(ThemeData theme, Dish dish) {
  final List<String> steps = [
    dish.directions.firstStep,
    dish.directions.secondStep,
    ...dish.directions.additionalSteps,
  ];

  return Padding(
    padding: const EdgeInsets.all(16),
    child: ListView.builder(
      itemCount: steps.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Step ${index + 1}",
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 5),
            Text(
              steps[index],
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 15),
          ],
        );
      },
    ),
  );
}
