import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  final Locale locale;
  AppLocalization(this.locale);
  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }


  static const LocalizationsDelegate<AppLocalization> delegate=_AppLocalizationsDelegate();

  Map<String, String> _localizedString;

  Future<bool> load() async {
    String jsonString =
        await rootBundle.loadString("/assets/json/${locale.languageCode}.json");
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedString = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  String translate(String key) {
    return _localizedString[key];
  }
}


class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalization>{


  const _AppLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) {
     return ["en","hi"].contains(locale.languageCode);
      throw UnimplementedError();
    }
  
    @override
    Future<AppLocalization> load(Locale locale) async {
AppLocalization localization=new AppLocalization(locale);
await localization.load();
return localization; 
      throw UnimplementedError();
    }
  
    @override
    bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old)=>false;
  }
