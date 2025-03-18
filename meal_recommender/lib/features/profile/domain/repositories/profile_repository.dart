import '../../data/models/profile_model.dart';

abstract class ProfileRepository {
  Future<ProfileModel> getProfile(String userId);
  Future<void> updateProfile(String userId, ProfileModel profile);
}