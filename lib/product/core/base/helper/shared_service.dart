import 'package:salonmate/product/core/base/helper/shared_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  final prefs = SharedPreferences.getInstance();
  Future<void> saveString(SharedKeys key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key.name, value);
  }

  Future<String?> getString(SharedKeys key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key.name);
  }

  Future<void> remove(SharedKeys key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key.name);
  }

  Future<bool?> getBool(SharedKeys key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key.name);
  }

  Future<void> setBool(SharedKeys key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key.name, value);
  }

  Future<int?> getInt(SharedKeys key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key.name);
  }

  Future<void> setInt(SharedKeys key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key.name, value);
  }

  Future<void> saveNormalString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String?> getNormalString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
