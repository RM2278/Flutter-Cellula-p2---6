import 'package:meal_recommender/core/constants/constants.dart';
import '../../domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  ProfileModel({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String profileImageUrl,
  }) : super(
    name: name,
    email: email,
    password: password,
    phone: phone,
    profileImageUrl: profileImageUrl,
  );

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json[Constants.name],
      email: json[Constants.email],
      phone: json[Constants.phone],
      password: json[Constants.password],
      profileImageUrl: json[Constants.profileImageUrl],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Constants.name : name,
      Constants.phone :phone,
      Constants.email : email,
      Constants.password : password,
      Constants.profileImageUrl : profileImageUrl,
    };
  }

  ProfileModel copyWith({
    String? name,
    String? email,
    String? password,
    String?phone,
    String? profileImageUrl,
  }) {
    return ProfileModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone?? this.phone,
      password: password ?? this.password,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }
}