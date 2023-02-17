import 'package:flutter/material.dart';

enum LanguageTypes { english, arabic }

const String english = "en";
const String arabic = "ar";
const Locale englishLocal = Locale("en", "US");
const Locale arabicLocal = Locale("ar", "SA");
const String assetsPathLocalization = "assets/translations";

extension LanguageTypesExtension on LanguageTypes {
  getValue() {
    switch (this) {
      case LanguageTypes.english:
        return english;
      case LanguageTypes.arabic:
        return arabic;
    }
  }
}
