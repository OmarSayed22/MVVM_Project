import 'package:flutter/material.dart';
import 'package:flutter_advanced/application/constants.dart';
import 'package:flutter_advanced/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  final SharedPreferences _sharedPreference;

  AppPreferences(this._sharedPreference);

  Future<String> getAppLanguage() async {
    String? lang = _sharedPreference.getString(Constants.kPrefkeyLang);
    if (lang != null && lang.isNotEmpty) {
      return lang;
    } else {
      return LanguageTypes.english.getValue();
    }
  }

  Future<void> changeLanguage() async {
    String currentLanguage = await getAppLanguage();
    currentLanguage == LanguageTypes.arabic.getValue()
        ? _sharedPreference.setString(
            Constants.kPrefkeyLang, LanguageTypes.english.getValue())
        : _sharedPreference.setString(
            Constants.kPrefkeyLang, LanguageTypes.arabic.getValue());
  }

  Future<Locale> getLanguageLocal() async {
    String currentLanguage = await getAppLanguage();
    if (currentLanguage == LanguageTypes.arabic.getValue()) {
      return arabicLocal;
    } else {
      return englishLocal;
    }
  }

  //OnBoardingComplete
  Future<void> setOnBoardingComplete() async {
    await _sharedPreference.setBool(Constants.kPrefkeyOnboardingComplete, true);
  }

  Future<bool> isOnBoardingComplete() async {
    return _sharedPreference.getBool(Constants.kPrefkeyOnboardingComplete) ??
        false;
  }

  //LoggedIn
  Future<void> setLoggedIn() async {
    await _sharedPreference.setBool(Constants.kPrefkeyLoggedIn, true);
  }

  Future<void> logout() async {
    await _sharedPreference.remove(Constants.kPrefkeyLoggedIn);
  }

  Future<bool> isLoggedIn() async {
    return _sharedPreference.getBool(Constants.kPrefkeyLoggedIn) ?? false;
  }
}
