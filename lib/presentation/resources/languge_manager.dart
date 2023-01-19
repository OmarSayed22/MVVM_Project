enum LanguageTypes { english, arabic }

const String english = "en";
const String arabic = "ar";

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

class LanguageManager {}
