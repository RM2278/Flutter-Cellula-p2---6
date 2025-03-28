import 'dart:convert';

import '../../domain/entities/dish_entity.dart';

class DishModel extends Dish {
  DishModel({
    required super.id,
    required super.name,
    required super.summary,
    required super.typeOfMeal,
    required super.time,
    required super.imageUrl,
    required super.diffeculty,
    required List<IngredientModel> super.ingredients,
    required NutritionModel super.nutrition,
    required DirectionsModel super.directions,
  });
  factory DishModel.fromEntity(Dish dish) {
    return DishModel(
      id: dish.id,
      name: dish.name,
      summary: dish.summary,
      typeOfMeal: dish.typeOfMeal,
      time: dish.time,
      imageUrl: dish.imageUrl,
      diffeculty: dish.diffeculty,
      ingredients: dish.ingredients.map((i) => IngredientModel(
        name: i.name,
        quantity: i.quantity,
        unit: i.unit,
        imageUrl: i.imageUrl,
      )).toList(),
      nutrition: NutritionModel(
        calories: dish.nutrition.calories,
        protein: dish.nutrition.protein,
        carbs: dish.nutrition.carbs,
        fat: dish.nutrition.fat,
        vitamins: dish.nutrition.vitamins,
      ),
      directions: DirectionsModel(
        firstStep: dish.directions.firstStep,
        secondStep: dish.directions.secondStep,
        additionalSteps: dish.directions.additionalSteps,
      ),
    );
  }


  factory DishModel.fromJson(Map<String, dynamic> json) {
    return DishModel(
      id: json['id'],
      name: json['name'],
      summary: json['summary'],
      diffeculty: json['Diffeculty'],
      typeOfMeal: json['typeOfMeal'],
      time: int.parse(json['time'].toString()),
      imageUrl: json['imageUrl'],
      ingredients: (json['ingredients'] as List)
          .map((i) => IngredientModel.fromJson(i))
          .toList(),
      nutrition: NutritionModel.fromJson(json['nutrition']),
      directions: DirectionsModel.fromJson(json['directions']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'name': name,
      'summary': summary,
      "Diffeculty": diffeculty,
      'typeOfMeal': typeOfMeal,
      'time': time,
      'imageUrl': imageUrl,
      'ingredients': ingredients.map((i) => (i as IngredientModel).toJson()).toList(),
      'nutrition': (nutrition as NutritionModel).toJson(),
      'directions': (directions as DirectionsModel).toJson(),
    };
  }
}

class IngredientModel extends Ingredient {
  IngredientModel({
    required super.name,
    required super.quantity,
    required super.unit,
    required super.imageUrl,
  });

  factory IngredientModel.fromJson(Map<String, dynamic> json) {
    return IngredientModel(
      name: json['name'],
      quantity: json['quantity'],
      unit: json['unit'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'unit': unit,
      'imageUrl': imageUrl,
    };
  }
}

class NutritionModel extends Nutrition {
  NutritionModel({
    required super.calories,
    required super.protein,
    required super.carbs,
    required super.fat,
    required super.vitamins,
  });

  factory NutritionModel.fromJson(Map<String, dynamic> json) {
    return NutritionModel(
      calories: json['calories'],
      protein: json['protein'],
      carbs: json['carbs'],
      fat: json['fat'],
      vitamins: List<String>.from(json['vitamins']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'calories': calories,
      'protein': protein,
      'carbs': carbs,
      'fat': fat,
      'vitamins': vitamins,
    };
  }
}

class DirectionsModel extends Directions {
  DirectionsModel({
    required super.firstStep,
    required super.secondStep,
    required super.additionalSteps,
  });

  factory DirectionsModel.fromJson(Map<String, dynamic> json) {
    return DirectionsModel(
      firstStep: json['firstStep'],
      secondStep: json['secondStep'],
      additionalSteps: List<String>.from(json['additionalSteps']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstStep': firstStep,
      'secondStep': secondStep,
      'additionalSteps': additionalSteps,
    };
  }
}
