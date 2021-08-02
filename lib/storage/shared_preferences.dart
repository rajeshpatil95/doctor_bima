import 'package:shared_preferences/shared_preferences.dart';

enum preferencesKeys { 
  kUserAuthToken,
  kDoctorsListData, 
  kIsDoctorListFetched 
  }

/// Key-Value storage that wraps SharedPreferences
abstract class Preferences {
  Future<SharedPreferences> _getPreferences() async {
    var preferences = await SharedPreferences.getInstance();
    return preferences;
  }

  Future<bool> setStringForKey(preferencesKeys key, String value) async {
    SharedPreferences preferences = await _getPreferences();
    return await preferences.setString(key.toString(), value);
  }

  Future<String> getStringForKey(preferencesKeys key) async {
    SharedPreferences preferences = await _getPreferences();
    return preferences.getString(key.toString());
  }

  Future<bool> setBoolForKey(preferencesKeys key, bool value) async {
    SharedPreferences preferences = await _getPreferences();
    return await preferences.setBool(key.toString(), value);
  }

  Future<bool> getBoolForKey(preferencesKeys key) async {
    SharedPreferences preferences = await _getPreferences();
    return preferences.getBool(key.toString());
  }

  Future<bool> setIntForKey(preferencesKeys key, int value) async {
    SharedPreferences preferences = await _getPreferences();
    return await preferences.setInt(key.toString(), value);
  }

  Future<int> getIntForKey(preferencesKeys key) async {
    SharedPreferences preferences = await _getPreferences();
    return preferences.getInt(key.toString());
  }

  Future<bool> setDoubleForKey(preferencesKeys key, double value) async {
    SharedPreferences preferences = await _getPreferences();
    return await preferences.setDouble(key.toString(), value);
  }

  Future<double> getDoubleForKey(preferencesKeys key) async {
    SharedPreferences preferences = await _getPreferences();
    return preferences.getDouble(key.toString());
  }

  clearPreference() async {
    var preferences = await _getPreferences();
    preferences.clear();
  }
}

class PreferencesImpl extends Preferences {
  @override
  Future getInstance() async {
    getInstance();
  }
}
