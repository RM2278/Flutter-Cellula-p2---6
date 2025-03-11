import 'package:meal_recommender/core/errors/failure.dart';

class FirebaseAuthFailure extends Failure {
  FirebaseAuthFailure(String message,
      {required super.statusCode, required super.errMessage});
}
