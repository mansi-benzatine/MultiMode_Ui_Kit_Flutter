import 'package:flutter/material.dart';
import 'package:stoxy_screens_app_package/utils/sizer_utils.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../localization/locale_constant.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class LanguageSettingScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const LanguageSettingScreen());
  }

  const LanguageSettingScreen({super.key});

  @override
  State<LanguageSettingScreen> createState() => _LanguageSettingScreenState();
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
            TopBar(this, title: Languages.of(context).txtLanguage, isShowBack: true, isShowSearch: true),
            // Search Bar
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
                    SizedBox(height: 20.setHeight),
                    // Suggested Section
                    _buildSectionHeader(Languages.of(context).txtSuggested),
                    SizedBox(height: 15.setHeight),
                    ...suggestedLanguages.map((lang) => _buildLanguageItem(lang)),
                    Divider(
                      color: CustomAppColor.of(context).containerBorder,
                      thickness: 1,
                    ),
                    SizedBox(height: 10.setHeight),
                    // Languages Section
                    _buildSectionHeader(Languages.of(context).txtLanguages),

                    SizedBox(height: 15.setHeight),
                    ...filteredLanguages.map((lang) => _buildLanguageItem(lang)),
                    SizedBox(height: 20.setHeight),
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
            package: "stoxy_screens_app_package",
            fontFamily: Constant.fontFamily,
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
          package: "stoxy_screens_app_package",
          fontFamily: Constant.fontFamily,
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return CommonText(
      text: title,
      fontSize: 16.setFontSize,
      fontWeight: FontWeight.w600,
      textColor: CustomAppColor.of(context).txtBlack,
      textAlign: TextAlign.start,
    );
  }

  Widget _buildLanguageItem(LanguageModel language) {
    bool isSelected = selectedLanguage == language.languageCode;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLanguage = language.languageCode;
        });
        changeLanguage(context, language.languageCode);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12.setHeight),
        padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 12.setHeight),
        decoration: BoxDecoration(
          color: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgSearchBar,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Flag
            CommonText(text: language.symbol, fontSize: 18.setFontSize),

            SizedBox(width: 15.setWidth),
            // Language Name
            Expanded(
              child: CommonText(
                text: language.language,
                fontSize: 14.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: (isSelected ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtBlack),
                textAlign: TextAlign.start,
              ),
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
