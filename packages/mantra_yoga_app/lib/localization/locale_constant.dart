import 'package:flutter/material.dart';

import '../ui/app/my_app.dart';
import '../utils/constant.dart';
import '../utils/preference.dart';
import '../utils/service_locator.dart';

final List<LanguageModel> languages = [
  LanguageModel("🇺🇸", "English", 'en', 'US'),
  /*LanguageModel("🇮🇳", "हिंदी", 'hi', 'IN'),
  LanguageModel("🇳🇵", "नेपाली", 'ne', 'NP'),
  LanguageModel("🇪🇸", "Española", 'es', 'ES'),
  LanguageModel("🇷🇺", "Русский", 'ru', 'RU'),
  LanguageModel("🇸🇦", "عربي", 'ar', 'SA'),
  LanguageModel("🇨🇳", "Chinese", 'zh', 'CN'),
  LanguageModel("🇸🇦", "Arabic", 'ar', 'SA'),
  LanguageModel("🇫🇷", "French", 'fr', 'FR'),
  LanguageModel("🇩🇪", "Dutch", 'de', 'DE'),
  LanguageModel("🇮🇳", "Hindi", 'hi', 'IN'),
  LanguageModel("🇵🇹", "Portuguese", 'pt', 'PT'),
  LanguageModel("🇷🇺", "Russian", 'ru', 'RU'),
  LanguageModel("🇪🇸", "Spanish", 'es', 'ES'),
  LanguageModel("🇵🇰", "Urdu", 'ur', 'PK'),
  LanguageModel("🇮🇩", "Indonesian", 'id', 'ID'),
  LanguageModel("🇮🇳", "Bangla", 'bn', 'IN'),
  LanguageModel("🇮🇳", "Tamil", 'ta', 'IN'),
  LanguageModel("🇮🇳", "Telugu", 'te', 'IN'),
  LanguageModel("🇹🇷", "Turkish", 'tr', 'TR'),
  LanguageModel("🇮🇳", "Punjabi", 'pa', 'IN'),
  LanguageModel("🇮🇹", "Italian", 'it', 'IT'),
  LanguageModel("🇰🇷", "Korean", 'ko', 'KR'),
  LanguageModel("🇯🇵", "Japanese", 'ja', 'JP'),
  LanguageModel("🇻🇳", "Vietnamese", 'vi', 'VN'),
  */
];

class LanguageModel {
  LanguageModel(
    this.symbol,
    this.language,
    this.languageCode,
    this.countryCode,
  );

  String language;
  String symbol;
  String countryCode;
  String languageCode;
}

Future<Locale> setLocale(String languageCode) async {
  getIt.get<LocalStorageService>().setString(LocalStorageService.selectedLanguage, languageCode);
  return _locale(languageCode);
}

Locale getLocale() {
  String languageCode = getIt.get<LocalStorageService>().getString(LocalStorageService.selectedLanguage, optionalValue: Constant.languageEn);
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  return languageCode.isNotEmpty ? Locale(languageCode, '') : const Locale(Constant.languageEn, '');
}

void changeLanguage(BuildContext context, String selectedLanguageCode) async {
  var locale = await setLocale(selectedLanguageCode);
  if (context.mounted) {
    MantraYogaApp.setLocale(context, locale);
  }
}
