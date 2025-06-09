import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/app/my_app.dart';

const String prefSelectedLanguageCode = "SelectedLanguageCode";

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(prefSelectedLanguageCode, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String languageCode = prefs.getString(prefSelectedLanguageCode) ?? "en";
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  return languageCode.isNotEmpty ? Locale(languageCode, '') : const Locale('en', '');
}

void changeLanguage(BuildContext context, String selectedLanguageCode) {
  setLocale(selectedLanguageCode).then((locale) {
    if (context.mounted) {
      MyApp.setLocale(context, locale);
    }
  });
}
