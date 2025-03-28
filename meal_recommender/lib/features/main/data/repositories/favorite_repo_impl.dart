import 'dart:math';


import 'package:dartz/dartz.dart';
import 'package:meal_recommender/core/errors/failure.dart';
import 'package:meal_recommender/features/ai/data/models/dish_model.dart';
import 'package:meal_recommender/features/main/data/datasources/FavoriteDataRemote.dart';
import 'package:meal_recommender/features/main/domain/repositories/favorite_repository.dart';

import '../../../../core/errors/server_failure.dart';
import '../../../ai/domain/entities/dish_entity.dart';
import '../../domain/entities/meals.dart';


class FavoritesRepositoryImpl implements FavoritesRepository {
  BaseFavoriteDataRemote favoriteDataRemote;
  FavoritesRepositoryImpl(this.favoriteDataRemote);
  
  
  @override
  Future<Either<Failure, List<Meal>>> getFavorites() async {
    try {
      final dishes = await favoriteDataRemote.get();
      return Right(dishes);
    } catch (e) {
      return Left(ServerFailure(statusCode: "500", errMessage: e.toString()));
    }
  }

 @override
  Future<void> addFavorite(Dish dish) async {
    try {
      DishModel dishModel=DishModel.fromEntity(dish);
      await favoriteDataRemote.add(dishModel);

    } catch (e) {
      Left(ServerFailure(statusCode: "500", errMessage: e.toString()));
    }
  }


  @override
  Future<void> removeFavorite(String mealId) async {
    try {
      await favoriteDataRemote.remove(mealId);
    } catch (e) {
      Left(ServerFailure(statusCode: "500", errMessage: e.toString()));
    }
  }
  
  /*final FirebaseFirestore firestore;

  FavoritesRepositoryImpl(this.firestore);

  @override
  Future<void> addFavorite(String userId, String mealId) async {
    await firestore
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .doc(mealId)
        .set({'exists': true});
  }

  @override
  Future<void> removeFavorite(String userId, String mealId) async {
    await firestore
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .doc(mealId)
        .delete();
  }

  @override
  Future<List<String>> getFavorites(String userId) async {
    final snapshot = await firestore
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .get();
    return snapshot.docs.map((doc) => doc.id).toList();
  }*/
  
  
  
  
}

