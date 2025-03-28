/*import 'package:meal_recommender/features/main/domain/entities/meals.dart';

class MealModel extends Meal {
  MealModel({
    required super.id,
    required super.name,
    required super.ingredientsCount,
    required super.preparationTime,
    required super.imageUrl,
    required super.likes,
    required super.rating,
  });

  factory MealModel.fromMap(Map<String, dynamic> map) {
    print("🔍 Mapping Meal Data: $map");
    return MealModel(
      id: map['id'] ?? '',
      name: map['name'] ?? 'Unknown Meal',
      ingredientsCount: (map['ingredientsCount'] as num?)?.toInt() ?? 0,
      preparationTime: (map['preparationTime'] as num?)?.toString() ?? '0',
      imageUrl: map['imageUrl'] ?? '',
      likes: (map['likes'] as num?)?.toInt() ?? 0,
      rating: (map['rating'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'ingredients_count': ingredientsCount,
      'preparation_time': preparationTime,
      'imageUrl': imageUrl,
      'likes': likes,
      'rating': rating,
    };
  }
}*/
import 'dart:convert';
import '../../domain/entities/meals.dart';

class MealDishModel extends Meal {
  MealDishModel({
    required super.id,
    required super.name,
    required super.summary,
    required super.typeOfMeal,
    required super.difficulty,
    required super.time,
    required super.imageUrl,
    required super.ingredients,
    required super.nutrition,
    required super.directions,
    required super.ingredientsCount,
    required super.preparationTime,
    required super.likes,
    required super.rating,
  });

  factory MealDishModel.fromJson(Map<String, dynamic> json) {
    try {
      print("📌 Received JSON: $json");
     json.forEach((key, value) {
    print("🔍 Key: $key, Type: ${value.runtimeType}, Value: $value");
  });

   
    return MealDishModel(
        id: json['id']?.toString() ?? '', // ✅ تحويل `id` إلى `String`
      name: json['name'] ?? 'Unknown Meal',
      summary: json['summary'] ?? '',
      typeOfMeal: json['typeOfMeal'] ?? '',
      difficulty: json['difficulty'] ?? '',
      time: _safeInt(json['time']),
      imageUrl: json['imageUrl'] ?? '',
      ingredientsCount: _safeInt(json['ingredientsCount']),
      preparationTime:_safeInt(json['preparationTime']),
      likes: _safeInt(json['likes']),
      rating: _safeDouble(json['rating']),
      ingredients: (json['ingredients'] as List?)
              ?.map((i) => IngredientModel.fromJson(i))
              .toList() ??
          [],
      nutrition: NutritionModel.fromJson(json['nutrition'] ?? {}),
      directions: DirectionsModel.fromJson(json['directions'] ?? {}),
    );
  } catch (e, stacktrace) {
    print("❌ Exception: $e");
    print("📍 Stacktrace: $stacktrace");
    throw Exception("Error parsing MealDishModel: $e");
  }
}



  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'summary': summary,
      'typeOfMeal': typeOfMeal,
      'difficulty': difficulty,
      'time': time,
      'imageUrl': imageUrl,
      'ingredientsCount': ingredientsCount,
      'preparationTime': preparationTime,
      'likes': likes,
      'rating': rating,
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
      name: json['name'] ?? '',
      quantity: json['quantity'] ?? '',
      unit: json['unit'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
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
      calories: json['calories'] ?? '' ,
      protein: json['protein'] ?? '',
      carbs: json['carbs'] ?? '',
      fat: json['fat'] ?? '',
      vitamins: List<String>.from(json['vitamins'] ?? []),
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
      firstStep: json['firstStep'] ?? '',
      secondStep: json['secondStep'] ?? '',
      additionalSteps: List<String>.from(json['additionalSteps'] ?? []),
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


int _safeInt(dynamic value) {
  if (value == null) return 0;
  if (value is int) return value;
  return int.tryParse(value.toString()) ?? 0;
}

double _safeDouble(dynamic value) {
  if (value == null) return 0.0;
  if (value is double) return value;
  return double.tryParse(value.toString()) ?? 0.0;
}

