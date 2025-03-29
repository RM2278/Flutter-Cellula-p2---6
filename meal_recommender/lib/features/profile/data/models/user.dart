import 'package:meal_recommender/core/constants/constants.dart';

class AppUser {
  String? id;
  String? name;
  String? email;
  String? password;
  String? profileImageUrl;
  String? phone;

  AppUser({
    this.id,
    this.name,
    this.email,

    this.phone,
    this.password,
    this.profileImageUrl,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json[Constants.id],
      name: json[Constants.name],
      email: json[Constants.email],
      phone: json[Constants.phone],
      password: json[Constants.password],
      profileImageUrl: json[Constants.profileImageUrl],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Constants.id : id,
      Constants.name : name,
      Constants.email : email,
      Constants.phone :phone,
      Constants.password : password,
      Constants.profileImageUrl : profileImageUrl,
    };
  }
}