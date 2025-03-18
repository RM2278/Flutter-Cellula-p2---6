import '../../domain/repositories/profile_repository.dart';
import '../datasource/profile_local_data_source.dart';
import '../datasource/profile_remote_data_source.dart';
import '../models/profile_model.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;
  final ProfileLocalDataSource localDataSource;

  ProfileRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<ProfileModel> getProfile(String userId) async {
    try {
      final profile = await remoteDataSource.getProfile(userId);
      await localDataSource.saveProfile(profile);
      return profile;
    } catch (e) {
      final localProfile = await localDataSource.getProfile();
      if (localProfile != null) {
        return localProfile;
      }
      rethrow;
    }
  }

  @override
  Future<void> updateProfile(String userId, ProfileModel profile) async {
    await remoteDataSource.updateProfile(userId, profile);
    await localDataSource.saveProfile(profile);
  }
}
