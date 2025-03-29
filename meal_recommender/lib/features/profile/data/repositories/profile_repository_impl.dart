import '../../../../core/constants/constants.dart';
import '../../../../core/services/firebase_service.dart';
import '../../../../core/services/shared_preferences_service.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../models/profile_model.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final FirebaseService firebaseService;
  final SharedPreferencesService sharedPreferencesService;

  ProfileRepositoryImpl(this.firebaseService, this.sharedPreferencesService);

  @override
  Future<ProfileModel?> getProfile() async {
    try {

      final localProfileData = await sharedPreferencesService.getUser();
      if (localProfileData[Constants.name] != null) {
        return ProfileModel(
          name: localProfileData[Constants.name]!,
          email: localProfileData[Constants.email]!,
          password: localProfileData[Constants.password] ?? '',
          phone: localProfileData[Constants.phone]!,
          profileImageUrl: localProfileData[Constants.profileImageUrl]!,
        );
      }

      final profile = await firebaseService.getProfile();

      if (profile != null) {
        await sharedPreferencesService.saveUser(
          profile.name,
          profile.email,
          profile.profileImageUrl,
          profile.password,
          profile.phone,
        );
        return profile;
      }
    } catch (e) {
      print("${Constants.errorFetchProfile} $e");
      rethrow;
    }
    return null;
  }

  @override
  Future<void> updateProfile(ProfileEntity updatedProfile) async {
    try {
      final profileModel = ProfileModel(
        name: updatedProfile.name,
        email: updatedProfile.email,
        phone: updatedProfile.phone,
        password: updatedProfile.password,
        profileImageUrl: updatedProfile.profileImageUrl,
      );


      await firebaseService.updateUserProfile(profileModel);

      await sharedPreferencesService.saveUser(
        profileModel.name,
        profileModel.email,
        profileModel.profileImageUrl,
        profileModel.password,
        profileModel.phone,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateProfileImage(String imageUrl) async {
    try {
      final profile = await firebaseService.getProfile();
      if (profile != null) {
        final updatedProfile = profile.copyWith(profileImageUrl: imageUrl);
        await firebaseService.updateUserProfile(updatedProfile);
        await sharedPreferencesService.saveUser(
          updatedProfile.name,
          updatedProfile.email,
          updatedProfile.profileImageUrl,
          updatedProfile.password,
          updatedProfile.phone,
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}