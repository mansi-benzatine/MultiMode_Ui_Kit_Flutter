import 'package:bitx_screens_app/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../localization/locale_constant.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class LanguageSettingScreen extends StatefulWidget {
  const LanguageSettingScreen({super.key});

  @override
  State<LanguageSettingScreen> createState() => _LanguageSettingScreenState();

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const LanguageSettingScreen());
  }
}

class _LanguageSettingScreenState extends State<LanguageSettingScreen> implements TopBarClickListener {
  final TextEditingController _searchController = TextEditingController();
  String selectedLanguage = "en_US";

  ValueNotifier<bool> isSearch = ValueNotifier(false);

  // All available languages
  final List<LanguageModel> allLanguages = [
    LanguageModel("🇮🇳", "Hindi", 'hi', 'IN'),
    LanguageModel("🇪🇸", "Spanish", 'es', 'ES'),
    LanguageModel("🇫🇷", "French", 'fr', 'FR'),
    LanguageModel("🇩🇪", "German", 'de', 'DE'),
    LanguageModel("🇸🇦", "Arabic", 'ar', 'SA'),
    LanguageModel("🇷🇺", "Russian", 'ru', 'RU'),
    LanguageModel("🇮🇩", "Indonesia", 'id', 'ID'),
    LanguageModel("🇮🇳", "English (IND)", 'en_IN', 'IN'),
  ];

  // Suggested languages (shown at top)
  final List<LanguageModel> suggestedLanguages = [
    LanguageModel("🇺🇸", "English (US)", 'en_US', 'US'),
    LanguageModel("🇬🇧", "English (UK)", 'en_GB', 'GB'),
  ];

  List<LanguageModel> filteredLanguages = [];

  @override
  void initState() {
    super.initState();
    filteredLanguages = allLanguages.where((lang) => !suggestedLanguages.any((suggested) => suggested.languageCode == lang.languageCode && suggested.countryCode == lang.countryCode)).toList();

    // Get current language
    selectedLanguage = getLocale().languageCode;
  }

  void _filterLanguages(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredLanguages = allLanguages.where((lang) => !suggestedLanguages.any((suggested) => suggested.languageCode == lang.languageCode && suggested.countryCode == lang.countryCode)).toList();
      } else {
        filteredLanguages = allLanguages
            .where((lang) => lang.language.toLowerCase().contains(query.toLowerCase()) && !suggestedLanguages.any((suggested) => suggested.languageCode == lang.languageCode && suggested.countryCode == lang.countryCode))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtLanguage,
              isShowBack: true,
              isShowSearch: true,
            ),
            ValueListenableBuilder(
              valueListenable: isSearch,
              builder: (context, value, child) {
                return (value) ? _buildSearchBar() : const SizedBox();
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.setHeight),
                    _buildSectionHeader(Languages.of(context).txtSuggested),
                    SizedBox(height: 15.setHeight),
                    ...suggestedLanguages.map((lang) => _buildLanguageItem(lang)),
                    SizedBox(height: 20.setHeight),
                    _buildSectionHeader(Languages.of(context).txtLanguages),
                    SizedBox(height: 15.setHeight),
                    ...filteredLanguages.map((lang) => _buildLanguageItem(lang)),
                    SizedBox(height: 10.setHeight),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 15.setHeight),
      padding: EdgeInsets.symmetric(horizontal: 5.setWidth),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgSearchBar,
        borderRadius: BorderRadius.circular(1000),
        border: Border.all(
          color: CustomAppColor.of(context).containerBorder,
          width: 1,
        ),
      ),
      child: TextField(
        controller: _searchController,
        onChanged: _filterLanguages,
        decoration: InputDecoration(
          hintText: Languages.of(context).txtSearchLanguages,
          hintStyle: TextStyle(
            color: CustomAppColor.of(context).txtGray,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w400,
            package: "bitx_screens_app",
          ),
          prefixIcon: Icon(
            Icons.search,
            color: CustomAppColor.of(context).txtGray,
            size: 20.setWidth,
          ),
          suffixIcon: InkWell(
            onTap: () {
              _searchController.clear();
              _filterLanguages("");
            },
            child: Icon(
              Icons.close,
              color: CustomAppColor.of(context).txtGray,
              size: 20.setWidth,
            ),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12.setHeight),
        ),
        style: TextStyle(
          color: CustomAppColor.of(context).txtBlack,
          fontSize: 14.setFontSize,
          fontWeight: FontWeight.w400,
          package: "bitx_screens_app",
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return CommonText(
      text: title,
      fontSize: 16.setFontSize,
      fontWeight: FontWeight.w600,
      textColor: CustomAppColor.of(context).txtGray,
      textAlign: TextAlign.start,
    );
  }

  Widget _buildLanguageItem(LanguageModel language) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedLanguage = language.languageCode;
        });
        changeLanguage(context, language.languageCode);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4.setHeight),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: CustomAppColor.of(context).border,
            ),
          ),
        ),
        child: Row(
          children: [
            CommonText(
              text: language.symbol,
              fontSize: 18.setFontSize,
            ),
            SizedBox(width: 15.setWidth),
            Expanded(
              child: CommonText(
                text: language.language,
                fontSize: 14.setFontSize,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.start,
              ),
            ),
            Radio<String>(
              value: language.languageCode,
              groupValue: selectedLanguage,
              activeColor: CustomAppColor.of(context).primary,
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  selectedLanguage = value;
                });
                changeLanguage(context, value);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
    if (name == Constant.strSearch) {
      isSearch.value = !isSearch.value;
    }
  }
}
