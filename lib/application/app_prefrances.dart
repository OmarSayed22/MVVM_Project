import 'package:flutter_advanced/application/constants.dart';
import 'package:flutter_advanced/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  final SharedPreferences _sharedpreference;

  AppPreferences(this._sharedpreference);

  Future<String> getAppLanguage() async {
    String? lang = _sharedpreference.getString(Constants.kPrefkeyLang);
    if (lang != null && lang.isNotEmpty) {
      return lang;
    } else {
      return LanguageTypes.english.getValue();
    }
  }
}
