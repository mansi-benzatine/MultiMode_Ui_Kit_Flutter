import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  const LocalStorageService(SharedPreferences sharedPreferences) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  // Preference key
  static const String isFirstTime = "IS_FIRST_TIME";
  static const String isWelcomeDone = "IS_WELCOME_DONE";
  static const String isLightTheme = "IS_LIGHT_THEME";

  String getString(String key, {String optionalValue = ''}) => _sharedPreferences.getString(key) ?? optionalValue;

  Future<void> setString(String key, String value) => _sharedPreferences.setString(key, value);

  int getInt(String key, {int optionalValue = 0}) => _sharedPreferences.getInt(key) ?? optionalValue;

  Future<void> setInt(String key, int value) => _sharedPreferences.setInt(key, value);

  bool getBool(String key, {bool optionalValue = false}) => _sharedPreferences.getBool(key) ?? optionalValue;

  Future<void> setBool(String key, bool value) => _sharedPreferences.setBool(key, value);

  double getDouble(String key, {double optionalValue = 0.0}) => _sharedPreferences.getDouble(key) ?? optionalValue;

  Future<void> setDouble(String key, double value) => _sharedPreferences.setDouble(key, value);

  List<String> getStringList(String key, {List<String> optionalValue = const []}) => _sharedPreferences.getStringList(key) ?? optionalValue;

  Future<void> setStringList(String key, List<String> value) => _sharedPreferences.setStringList(key, value);

  Future<bool?> remove(key, [multi = false]) async {
    if (multi) {
      key.forEach((f) async {
        return await _sharedPreferences.remove(f);
      });
    } else {
      return await _sharedPreferences.remove(key);
    }

    return Future.value(true);
  }
}
