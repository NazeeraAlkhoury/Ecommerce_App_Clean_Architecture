// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_ONBOARDING_SCREEN_VIEWED =
    "PREFS_KEY_ONBOARDING_SCREEN_VIEWED";

const String PREFS_KEY_TOKEN = "TOKEN";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

// onBoarding

  Future<bool> setOnBoardingScreen() async {
    return await _sharedPreferences.setBool(
        PREFS_KEY_ONBOARDING_SCREEN_VIEWED, true);
  }

  bool? isOnBoardingScreen() {
    return _sharedPreferences.getBool(PREFS_KEY_ONBOARDING_SCREEN_VIEWED);
  }

// token
  Future<bool> setToken({required String token}) async {
    return await _sharedPreferences.setString(PREFS_KEY_TOKEN, token);
  }

  String? getToken() {
    return _sharedPreferences.getString(PREFS_KEY_TOKEN);
  }
}
