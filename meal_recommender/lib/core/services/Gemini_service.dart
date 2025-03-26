import 'dart:convert';

import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiApiService {
  final String apiKey;

  GeminiApiService({required this.apiKey});
  Future<List<Map<String, dynamic>>> recommendedFromGemini(int number) async {
    final model = GenerativeModel(
      model: 'gemini-2.0-flash',
      apiKey: apiKey,
    );

    final prompt = '''
Provide ${number} different recipes for meals in JSON format with this structure:
[
  {
    "name": "Dish name",
    "summary": "A summary of the dish",
    "typeOfMeal": "Meal type (e.g., Breakfast, Lunch, Dinner, Snack)",
    "Diffeculty": "Diffeculty type (e.g. , biggener, medium , cheff)",
    "time": "Preparation time in minutes",
    "imageUrl": "",
    "ingredients": [
      {
        "name": "Ingredient name",
        "quantity": "Quantity",
        "unit": "Unit",
        "imageUrl": ""
      }
    ],
    "nutrition": {
      "calories": "Calories per serving",
      "protein": "Protein in grams",
      "carbs": "Carbs in grams",
      "fat": "Fat in grams",
      "vitamins": ["List of vitamins"]
    },
    "directions": {
      "firstStep": "First step to make it description",
      "secondStep": "Second step description",
      "additionalSteps": ["Additional steps"]
    }
  }
]

Return the response as JSON.
''';

    final response = await model.generateContent([Content.text(prompt)]);
    final cleanedResponse = response.text?.trim().replaceAll('```json', '').replaceAll('```', '').trim();

    if (cleanedResponse == null || cleanedResponse.isEmpty) {
      throw Exception("Invalid response from Gemini AI");
    }

    final List<dynamic> decodedList = json.decode(cleanedResponse);

    // Ensure proper casting to List<Map<String, dynamic>>
    return decodedList.map((e) => e as Map<String, dynamic>).toList();
  }
  Future<Map<String, dynamic>> fetchRecipeFromGemini(String dishName) async {
    final model = GenerativeModel(
      model: 'gemini-2.0-flash',
      apiKey: apiKey,
    );

    final prompt = '''
Provide a recipe for "$dishName" in JSON format with this structure:
{
  "name": "Dish name",
  "summary": "A summary of the dish",
  "typeOfMeal": "Meal type (e.g., Breakfast, Lunch)",
  "Diffeculty": "Diffeculty type (e.g. , biggener, medium , cheff)",
  "time": "Preparation time in minutes",
  "imageUrl": "",
  "ingredients": [
    {
      "name": "Ingredient name",
      "quantity": "Quantity",
      "unit": "Unit",
      "imageUrl": ""
    }
  ],
  "nutrition": {
    "calories": "Calories per serving",
    "protein": "Protein in grams",
    "carbs": "Carbs in grams",
    "fat": "Fat in grams",
    "vitamins": ["List of vitamins"]
  },
  "directions": {
    "firstStep": "First step To make it description",
    "secondStep": "Second step description",
    "additionalSteps": ["Additional steps"]
  }
}
Return the response as JSON.
''';

    final response = await model.generateContent([Content.text(prompt)]);
    final cleanedResponse = response.text?.trim().replaceAll('```json', '').replaceAll('```', '').trim();

    return json.decode(cleanedResponse ?? "");
  }
}