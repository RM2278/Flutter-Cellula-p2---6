import 'package:meal_recommender/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  Future<void> saveUser(String name, String email, String profileImageUrl, String password,String phone) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(Constants.name, name);
    await prefs.setString(Constants.email, email);
    await prefs.setString(Constants.password, password);
    await prefs.setString(Constants.phone, phone);
    await prefs.setString(Constants.profileImageUrl, profileImageUrl);
  }

  Future<Map<String, String?>> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString(Constants.name);
    String? email = prefs.getString(Constants.email);
    String? password = prefs.getString(Constants.password);
    String? phone = prefs.getString(Constants.phone);
    String? profileImageUrl = prefs.getString(Constants.profileImageUrl);

    return {
      Constants.name: name,
      Constants.email: email,
      Constants.password: password,
      Constants.phone:phone,
      Constants.profileImageUrl: profileImageUrl,
    };
  }
}