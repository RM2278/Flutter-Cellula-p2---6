import 'package:meal_recommender/core/constants/constants.dart';

import '../../data/models/profile_model.dart';
import '../repositories/profile_repository.dart';

class GetProfileUseCase {
  final ProfileRepository repository;

  GetProfileUseCase(this.repository);


    Future<void> call(String userId, ProfileModel updatedProfile) async {
      try {
        await repository.updateProfile(userId, updatedProfile);
      } catch (e) {
        throw Exception('${Constants.failedUpdate} $e');
      }
    }


}
