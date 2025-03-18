import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommender/core/constants/constants.dart';
import 'package:meal_recommender/features/profile/presentation/cubit/profile_state.dart';

import '../../../../core/services/firebase_service.dart';
import '../../../../core/services/shared_preferences_service.dart';
import '../../data/models/profile_model.dart';
import '../../domain/entities/profile_entity.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final FirebaseService firebaseService;
  final SharedPreferencesService sharedPreferencesService;

  ProfileCubit(this.firebaseService, this.sharedPreferencesService) : super(ProfileInitial());

  Future<void> fetchProfile() async {
    try {
      emit(ProfileLoading());

      final localProfileData = await sharedPreferencesService.getUser();
      if (localProfileData[Constants.name] != null) {
        final localProfile = ProfileModel(
          name: localProfileData[Constants.name]!,
          email: localProfileData[Constants.email]!,
          password: localProfileData[Constants.password] ?? '',
          phone: localProfileData[Constants.phone]!,
          profileImageUrl: localProfileData[Constants.profileImageUrl]!,
        );
        emit(ProfileLoaded(localProfile));
        return;
      }

      final profile = await firebaseService.getProfile();

      if (profile != null) {
        emit(ProfileLoaded(profile));

        await sharedPreferencesService.saveUser(
            profile.name,
            profile.email,
            profile.profileImageUrl,
            profile.password,
          profile.phone
        );
      } else {
        emit(ProfileError(Constants.profileNotFound));
      }
    } catch (e) {
      print("${Constants.errorFetchProfile} $e");
      emit(ProfileError('${Constants.errorFetchProfile}  $e'));
    }
  }

  Future<void> updateProfile(ProfileEntity updatedProfile) async {
    try {
      emit(ProfileLoading());

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
        profileModel.phone
      );

      emit(ProfileUpdated());
      emit(ProfileLoaded(profileModel));
    } catch (e) {
      print("${Constants.errorUpdateProfile} $e");
      emit(ProfileError('${Constants.errorUpdateProfile} $e'));
    }
  }

  void updateProfileImage(String imageUrl) async {
    try {
      emit(ProfileLoading());
      final currentState = state;
      if (currentState is ProfileLoaded) {
        final updatedProfile = currentState.profile.copyWith(
          profileImageUrl: imageUrl,
        );

        await firebaseService.updateUserProfile(updatedProfile);
        await sharedPreferencesService.saveUser(
            updatedProfile.name,
            updatedProfile.email,
            updatedProfile.profileImageUrl,
            updatedProfile.password,
          updatedProfile.phone
        );

        emit(ProfileLoaded(updatedProfile));
      }
    } catch (e) {
      emit(ProfileError('${Constants.errorUpdateProfileImage} $e'));
    }
  }
}
