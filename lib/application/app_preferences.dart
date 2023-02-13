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

  Future<bool> isLoggedIn() async {
    return _sharedPreference.getBool(Constants.kPrefkeyLoggedIn) ?? false;
  }
}
