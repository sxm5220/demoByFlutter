import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomLocalizations {
  final Locale locale;

  CustomLocalizations(this.locale);

  static Map<String, Map<String, String>> _localizedValues = {
    "en": {
      "Home": "Home",
      "Hello": "Hello",
    },
    "zh": {
      "Home": "首页",
      "Hello": "你好",
    }
  };

  String? translate(String key) {
    return _localizedValues[locale.languageCode]![key];
  }

  static CustomLocalizations of(BuildContext context) {
    return Localizations.of(context, CustomLocalizations);
  }

  static CustomLocalizationsDelegate delegate = CustomLocalizationsDelegate();
}

class CustomLocalizationsDelegate
    extends LocalizationsDelegate<CustomLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<CustomLocalizations> load(Locale locale) {
    return SynchronousFuture(CustomLocalizations(locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<CustomLocalizations> old) {
    return false;
  }
}
