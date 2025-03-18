import '../../../../core/constants/constants.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../data/models/profile_model.dart';

class UpdateProfile {
  final ProfileRepository repository;

  UpdateProfile(this.repository);

  Future<void> call(ProfileModel updatedProfile) async {
    try {
      await repository.updateProfile(updatedProfile.name, updatedProfile);
    } catch (e) {
      throw Exception('${Constants.failedUpdate} $e');
    }
  }
}
