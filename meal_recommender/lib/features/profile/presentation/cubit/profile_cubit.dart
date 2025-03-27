import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommender/core/constants/constants.dart';
import 'package:meal_recommender/features/profile/presentation/cubit/profile_state.dart';

import '../../domain/entities/profile_entity.dart';
import '../../domain/usecase/get_profile_usecase.dart';
import '../../domain/usecase/update_profile_usecase.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase fetchProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;

  ProfileCubit(this.fetchProfileUseCase, this.updateProfileUseCase) : super(ProfileInitial());

  Future<void> fetchProfile() async {
    try {
      emit(ProfileLoading());

      final profile = await fetchProfileUseCase.call();

      if (profile != null) {
        emit(ProfileLoaded(profile));
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

      await updateProfileUseCase.call(updatedProfile);

      emit(ProfileUpdated());
      await fetchProfile();
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
        final updatedProfile = ProfileEntity(
          name: currentState.profile.name,
          email: currentState.profile.email,
          phone: currentState.profile.phone,
          password: currentState.profile.password,
          profileImageUrl: imageUrl,
        );

        await updateProfileUseCase.call(updatedProfile);
        emit(ProfileUpdated());
        await fetchProfile();
      }
    } catch (e) {
      emit(ProfileError('${Constants.errorUpdateProfileImage} $e'));
    }
  }
}