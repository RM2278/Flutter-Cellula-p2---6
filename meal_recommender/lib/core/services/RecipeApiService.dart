import 'dart:convert';

import 'package:pexels_client/pexels_client.dart';
import 'package:http/http.dart' as http;

class RecipeApiService {
  final PexelsClient _pexelsClient;

  RecipeApiService({required String apiKey}) : _pexelsClient = PexelsClient(apiKey: apiKey);

  Future<String?> fetchRecipeImage(String dishName) async {
    try {
      final photos = await _pexelsClient.searchPhotos(query: dishName, perPage: 1);
      if (photos!.photos!.isNotEmpty ) {

        return photos.photos!.first.src!.original ?? photos.photos!.first.src!.large;
      }
    } catch (e) {
      print('Error fetching ingredient image: $e');
    }
    return null;
  }

  Future<String?> fetchIngredientImage(String ingredientName) async {
    try {
      final photos = await _pexelsClient.searchPhotos(query: ingredientName, perPage: 1);
      if (photos!.photos!.isNotEmpty ) {

        return photos.photos!.first.src!.original ?? photos.photos!.first.src!.large;
      }
    } catch (e) {
      print('Error fetching ingredient image: $e');
    }
    return null;
  }
}