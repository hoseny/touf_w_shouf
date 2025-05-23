import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  // private constructor
  SharedPref._();

  static late SharedPreferences sharedPreferences;

  // Initialize the SharedPreferences instance once
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  /// Removes a value from SharedPreferences with given [key].
  static Future<void> removeData({required String key}) async {
    log('SharedPrefHelper : data with key : $key has been removed');
    await sharedPreferences.remove(key);
  }

  /// Removes all keys and values in the SharedPreferences
  static Future<void> clearAllData() async {
    log('SharedPrefHelper : all data has been cleared');
    await sharedPreferences.clear();
  }

  /// Saves a [value] with a [key] in the SharedPreferences.
  static Future<void> setData(
      {required String key, required dynamic value}) async {
    log("SharedPrefHelper : setData with key : $key and value : $value");
    if (value is String) {
      await sharedPreferences.setString(key, value);
    } else if (value is int) {
      await sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      await sharedPreferences.setBool(key, value);
    } else if (value is double) {
      await sharedPreferences.setDouble(key, value);
    }
  }

  /// Gets a bool value from SharedPreferences with given [key].
  static bool? getBool({required String key}) {
    log('SharedPrefHelper : getBool with key : $key');
    return sharedPreferences.getBool(key);
  }

  /// Gets a double value from SharedPreferences with given [key].
  static double getDouble({required String key}) {
    log('SharedPrefHelper : getDouble with key : $key');
    return sharedPreferences.getDouble(key) ?? 0.0;
  }

  /// Gets an int value from SharedPreferences with given [key].
  static int? getInt({required String key}) {
    log('SharedPrefHelper : getInt with key : $key');
    return sharedPreferences.getInt(key);
  }

  /// Gets a String value from SharedPreferences with given [key].
  static String getString({required String key}) {
    log('SharedPrefHelper : getString with key : $key');
    return sharedPreferences.getString(key) ?? '';
  }
}
