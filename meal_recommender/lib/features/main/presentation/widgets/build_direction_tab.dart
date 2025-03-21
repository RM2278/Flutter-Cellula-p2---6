import 'package:flutter/material.dart';

Widget buildDirectionTab(ThemeData theme) {
    final steps = [
      "Lorem ipsum dolor sit amet, sed do eiusmod tempor incididunt ut labore.",
      "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.",
      "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore.",
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: steps.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Step ${index + 1}", style: theme.textTheme.titleMedium),
              const SizedBox(height: 5),
              Text(steps[index], style: theme.textTheme.bodyMedium),
              const SizedBox(height: 15),
            ],
          );
        },
      ),
    );
  }