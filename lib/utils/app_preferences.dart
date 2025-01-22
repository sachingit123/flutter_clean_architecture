import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  static const String _token = 'apiToken';
  final SharedPreferences _preferences;

  PreferenceService(this._preferences);

  // Save the language code
  Future<bool> setToken(String token) async {
    return await _preferences.setString(_token, token);
  }

  // Retrieve the language code
  String? getToken() {
    return _preferences.getString(_token);
  }

  // Retrieve the language code
  Future<bool> clearToken() async {
    return await _preferences.clear();
  }
}
