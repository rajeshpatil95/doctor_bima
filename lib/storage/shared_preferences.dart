import 'dart:convert';
import 'package:doctor_bima/utils/string_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Key-Value storage that wraps SharedPreferences and NSUserDefaults
abstract class Preferences {
  static const String customerData = 'customerData';
  SharedPreferences sharedPreferences;
  Future getInstance() async {
    sharedPreferences = await _getPreferences();
  }

  getObjectPreference(String key) async {
    final preferences = await _getPreferences();
    final jsonString = preferences.getString(key);
    if (isNullOrEmpty(jsonString)) {
      return null;
    }
    return jsonDecode(jsonString);
  }

  setObjectPreference(String key, var object) async {
    final preferences = await _getPreferences();
    preferences.setString(key, jsonEncode(object.toJson()));
  }

  Future<SharedPreferences> _getPreferences() async {
    return await SharedPreferences.getInstance();
  }

  clear() async {
    return await SharedPreferences.getInstance();
  }
}

class PreferencesImpl extends Preferences {
  @override
  Future getInstance() async {
    getInstance();
  }
}
