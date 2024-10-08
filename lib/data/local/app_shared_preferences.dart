import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static const String isLightMode = "IS_LIGHT_MODE";

  final pref = SharedPreferencesAsync();

  void setBoolean(String key, bool value) async => await pref.setBool(key, value);
  Future<bool?> getBoolean(String key) async => await pref.getBool(key);
}
