import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const String langCode = 'languageCode';

//languages code
const String english = 'en';
const String farsi = 'fa';
const String arabic = 'ar';
const String hindi = 'hi';
const String indonesia = 'id';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(langCode, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String languageCode = prefs.getString(langCode) ?? english;
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case english:
      return const Locale(english, '');
    case farsi:
      return const Locale(farsi, "");
    case arabic:
      return const Locale(arabic, "");
    case hindi:
      return const Locale(hindi, "");
    case indonesia:
      return const Locale(indonesia, "");
    default:
      return const Locale(english, '');
  }
}

AppLocalizations translation(BuildContext context) {
  return AppLocalizations.of(context)!;
}
