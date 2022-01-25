import 'package:shared_preferences/shared_preferences.dart';

class PrefManager {
  static const String tokenKey = 'token';

  Future<void> clearAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await prefs.reload();
  }

  Future<bool> setToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(tokenKey, token);
  }

  Future<String?> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(tokenKey);
  }

   Future<bool> a(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(tokenKey, token);
  }
}
