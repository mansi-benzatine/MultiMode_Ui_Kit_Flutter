import 'package:flutter/material.dart';

import '../../../../../../../localization/language/languages.dart';

class LanguageData {
  final String language;
  final bool isSuggested;

  LanguageData({required this.language, this.isSuggested = false});
}

List<LanguageData> languageList(BuildContext context) {
  return [
    LanguageData(language: Languages.of(context).englishUs, isSuggested: true),
    LanguageData(language: Languages.of(context).englishUk, isSuggested: true),
    LanguageData(language: Languages.of(context).mandarin),
    LanguageData(language: Languages.of(context).hindi),
    LanguageData(language: Languages.of(context).spanish),
    LanguageData(language: Languages.of(context).french),
    LanguageData(language: Languages.of(context).arabic),
    LanguageData(language: Languages.of(context).bengali),
    LanguageData(language: Languages.of(context).russian),
    LanguageData(language: Languages.of(context).indonesian),
  ];
}
