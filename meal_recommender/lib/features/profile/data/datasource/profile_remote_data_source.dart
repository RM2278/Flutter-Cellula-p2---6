import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meal_recommender/core/constants/constants.dart';
import '../models/profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfile(String userId);
  Future<void> updateProfile(String userId, ProfileModel profile);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final FirebaseFirestore firestore;

  ProfileRemoteDataSourceImpl(this.firestore);

  @override
  Future<ProfileModel> getProfile(String userId) async {
    final doc = await firestore.collection(Constants.user).doc(userId).get();
    if (doc.exists) {
      return ProfileModel.fromJson(doc.data() as Map<String, dynamic>);
    } else {
      throw Exception(Constants.profileNotFound);
    }
  }

  @override
  Future<void> updateProfile(String userId, ProfileModel profile) async {
    await firestore.collection(Constants.user).doc(userId).set(profile.toJson());
  }
}
