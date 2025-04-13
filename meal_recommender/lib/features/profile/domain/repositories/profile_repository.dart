import '../../data/models/profile_model.dart';
import '../entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<ProfileModel?> getProfile();
  Future<void> updateProfile(ProfileEntity profile);

}