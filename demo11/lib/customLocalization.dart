import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomLocalizations {
  final Locale locale;

  CustomLocalizations(this.locale);

  Map<String, String>? localizedValues;

  Future<bool> loadJSON() async {
    String jsonString =
        await rootBundle.loadString('language/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    localizedValues = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  String? t(String key) {
    //return _localizedValues[locale.languageCode]![key];
    return localizedValues![key];
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
  Future<CustomLocalizations> load(Locale locale) async {
    // return SynchronousFuture(CustomLocalizations(locale));
    CustomLocalizations localizations = CustomLocalizations(locale);
    await localizations.loadJSON();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<CustomLocalizations> old) {
    return false;
  }
}
