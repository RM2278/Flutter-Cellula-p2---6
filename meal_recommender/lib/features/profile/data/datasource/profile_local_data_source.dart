
import '../../../../core/constants/constants.dart';
import '../../../../core/services/shared_preferences_service.dart';
import '../models/profile_model.dart';

abstract class ProfileLocalDataSource {
  Future<ProfileModel?> getProfile();
  Future<void> saveProfile(ProfileModel profile);
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;

  ProfileLocalDataSourceImpl(this.sharedPreferencesService);

  @override
  Future<ProfileModel?> getProfile() async {
    final userData = await sharedPreferencesService.getUser();
    if (userData[Constants.user] != null) {
      return ProfileModel(
        name: userData[Constants.name]!,
        email: userData[Constants.email]!,
        phone: userData[Constants.phone]!,
        password: userData.containsKey(Constants.password) ? userData[Constants.password]! : "",
        profileImageUrl: userData[Constants.profileImageUrl]!,
      );
    }
    return null;
  }

  @override
  Future<void> saveProfile(ProfileModel profile) async {
    await sharedPreferencesService.saveUser(
        profile.name,
        profile.email,
        profile.phone,
        profile.profileImageUrl,
        profile.phone
    );
  }
}
