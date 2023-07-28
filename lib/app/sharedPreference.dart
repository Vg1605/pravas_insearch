import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static Future<String?> getString({required String key}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }

  static Future<bool> setString(
      {required String key, required String value}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(key, value);
  }

  static Future<bool> clear() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.clear();
  }
}
