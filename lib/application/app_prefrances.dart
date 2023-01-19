import 'package:flutter_advanced/presentation/resources/languge_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String kPrefskeyLang = 'Pref_key_Lang';

class AppPreferences {
  SharedPreferences _sharedpreference;

  AppPreferences(this._sharedpreference);

  Future<String> getAppLanguage() async {
    String? lang = _sharedpreference.getString(kPrefskeyLang);
    if (lang != null && lang.isNotEmpty) {
      return lang;
    } else {
      return LanguageTypes.english.getValue();
    }
  }
}
