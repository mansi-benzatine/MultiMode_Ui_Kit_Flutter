import 'package:flutter/material.dart';
import 'package:qr_scanner_app_package/utils/sizer_utils.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class LanguageItemModel {
  final String languageName;
  final String languageCode;
  final String countryCode;
  final String flagEmoji;

  LanguageItemModel({
    required this.languageName,
    required this.languageCode,
    required this.countryCode,
    required this.flagEmoji,
  });
}

class LanguagesOptionsScreen extends StatefulWidget {
  const LanguagesOptionsScreen({super.key});

  @override
  State<LanguagesOptionsScreen> createState() => _LanguagesOptionsScreenState();
}

class _LanguagesOptionsScreenState extends State<LanguagesOptionsScreen> implements TopBarClickListener {
  String selectedLanguageCode = Constant.languageEn;

  final List<LanguageItemModel> languagesList = [
    LanguageItemModel(languageName: "Albanian", languageCode: "sq", countryCode: "AL", flagEmoji: "🇦🇱"),
    LanguageItemModel(languageName: "Hindi", languageCode: "hi", countryCode: "IN", flagEmoji: "🇮🇳"),
    LanguageItemModel(languageName: "Arabic", languageCode: "ar", countryCode: "SA", flagEmoji: "🇸🇦"),
    LanguageItemModel(languageName: "Azerbaijani", languageCode: "az", countryCode: "AZ", flagEmoji: "🇦🇿"),
    LanguageItemModel(languageName: "Bengali", languageCode: "bn", countryCode: "BD", flagEmoji: "🇧🇩"),
    LanguageItemModel(languageName: "Burmese", languageCode: "my", countryCode: "MM", flagEmoji: "🇲🇲"),
    LanguageItemModel(languageName: "Chinese Simplified", languageCode: "zh", countryCode: "CN", flagEmoji: "🇨🇳"),
    LanguageItemModel(languageName: "Chinese Traditional", languageCode: "zh-TW", countryCode: "TW", flagEmoji: "🇹🇼"),
    LanguageItemModel(languageName: "Croatian", languageCode: "hr", countryCode: "HR", flagEmoji: "🇭🇷"),
    LanguageItemModel(languageName: "Czech", languageCode: "cs", countryCode: "CZ", flagEmoji: "🇨🇿"),
    LanguageItemModel(languageName: "Dutch", languageCode: "nl", countryCode: "NL", flagEmoji: "🇳🇱"),
    LanguageItemModel(languageName: "English", languageCode: "en", countryCode: "US", flagEmoji: "🇺🇸"),
    LanguageItemModel(languageName: "French", languageCode: "fr", countryCode: "FR", flagEmoji: "🇫🇷"),
    LanguageItemModel(languageName: "German", languageCode: "de", countryCode: "DE", flagEmoji: "🇩🇪"),
    LanguageItemModel(languageName: "Greek", languageCode: "el", countryCode: "GR", flagEmoji: "🇬🇷"),
    LanguageItemModel(languageName: "Hebrew", languageCode: "he", countryCode: "IL", flagEmoji: "🇮🇱"),
    LanguageItemModel(languageName: "Hungarian", languageCode: "hu", countryCode: "HU", flagEmoji: "🇭🇺"),
    LanguageItemModel(languageName: "Italian", languageCode: "it", countryCode: "IT", flagEmoji: "🇮🇹"),
    LanguageItemModel(languageName: "Japanese", languageCode: "ja", countryCode: "JP", flagEmoji: "🇯🇵"),
    LanguageItemModel(languageName: "Korean", languageCode: "ko", countryCode: "KR", flagEmoji: "🇰🇷"),
    LanguageItemModel(languageName: "Polish", languageCode: "pl", countryCode: "PL", flagEmoji: "🇵🇱"),
    LanguageItemModel(languageName: "Portuguese", languageCode: "pt", countryCode: "PT", flagEmoji: "🇵🇹"),
    LanguageItemModel(languageName: "Russian", languageCode: "ru", countryCode: "RU", flagEmoji: "🇷🇺"),
    LanguageItemModel(languageName: "Spanish", languageCode: "es", countryCode: "ES", flagEmoji: "🇪🇸"),
    LanguageItemModel(languageName: "Turkish", languageCode: "tr", countryCode: "TR", flagEmoji: "🇹🇷"),
    LanguageItemModel(languageName: "Ukrainian", languageCode: "uk", countryCode: "UA", flagEmoji: "🇺🇦"),
    LanguageItemModel(languageName: "Vietnamese", languageCode: "vi", countryCode: "VN", flagEmoji: "🇻🇳"),
  ];

  @override
  void initState() {
    super.initState();
    // Get the currently selected language
    selectedLanguageCode = getIt.get<LocalStorageService>().getString(LocalStorageService.selectedLanguage, optionalValue: Constant.languageEn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            TopBar(this, title: Languages.of(context).txtLanguagesOptions, isShowBack: true, isShowCheck: true),
            SizedBox(height: 10.setHeight),
            Expanded(
              child: Card(
                color: CustomAppColor.of(context).bgCard,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                margin: EdgeInsets.symmetric(
                  horizontal: 20.setWidth,
                ),
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                  itemCount: languagesList.length,
                  itemBuilder: (context, index) {
                    final language = languagesList[index];
                    final isSelected = selectedLanguageCode == language.languageCode;

                    return _buildLanguageItem(language, isSelected);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageItem(LanguageItemModel language, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLanguageCode = language.languageCode;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 14.setHeight),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgCard,
          border: Border(
            bottom: BorderSide(
              color: CustomAppColor.of(context).containerBorder,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            // Radio button
            Container(
              width: 20.setWidth,
              height: 20.setHeight,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtGray,
                  width: 2,
                ),
                color: isSelected ? CustomAppColor.of(context).primary : Colors.transparent,
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 8.setWidth,
                        height: 8.setHeight,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomAppColor.of(context).white,
                        ),
                      ),
                    )
                  : null,
            ),

            SizedBox(width: 16.setWidth),

            // Language name
            Expanded(
              child: CommonText(
                text: language.languageName,
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w500,
                textColor: CustomAppColor.of(context).txtBlack,
                textAlign: TextAlign.start,
              ),
            ),

            Text(
              language.flagEmoji,
              style: TextStyle(fontSize: 30.setFontSize),
              textAlign: TextAlign.center,
            ),

            /* Container(
              width: 32.setWidth,
              height: 32.setHeight,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: CustomAppColor.of(context).containerBorder,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  language.flagEmoji,
                  style: TextStyle(fontSize: 25.setFontSize),
                  textAlign: TextAlign.center,
                ),
              ),
            ), */
          ],
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    } else if (name == Constant.strCheck) {
      // Save the selected language and apply it
      Navigator.pop(context);
      // _applyLanguageChange();
    }
  }
}
