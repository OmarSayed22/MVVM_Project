import '../../application/constants.dart';

enum LanguageTypes { english, arabic }

extension LanguageTypesExtension on LanguageTypes {
  getValue() {
    switch (this) {
      case LanguageTypes.english:
        return Constants.english;
      case LanguageTypes.arabic:
        return Constants.arabic;
    }
  }
}

class LanguageManager {}
