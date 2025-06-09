import 'package:chat_ai_app_package/interfaces/top_bar_click_listener.dart';
import 'package:chat_ai_app_package/localization/language/languages.dart';
import 'package:chat_ai_app_package/ui/languages/datamodel/language_data.dart';
import 'package:chat_ai_app_package/utils/app_assets.dart';
import 'package:chat_ai_app_package/utils/app_color.dart';
import 'package:chat_ai_app_package/utils/constant.dart';
import 'package:chat_ai_app_package/utils/sizer_utils.dart';
import 'package:chat_ai_app_package/widgets/text/common_text.dart';
import 'package:chat_ai_app_package/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({super.key});
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LanguagesScreen());
  }

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> implements TopBarClickListener {
  List<LanguageData> suggestedLanguageList = [];
  List<LanguageData> languageLis = [];

  void fillData() {
    suggestedLanguageList = [
      LanguageData(
        isSelected: true,
        countryFlagUrl: AppAssets.icFlagUK,
        countryName: "English (UK)",
      ),
      LanguageData(
        isSelected: false,
        countryFlagUrl: AppAssets.icFlagUS,
        countryName: "English (US)",
      ),
    ];
    languageLis = [
      LanguageData(
        isSelected: false,
        countryFlagUrl: AppAssets.icFlagIndia,
        countryName: "Hindi",
      ),
      LanguageData(
        isSelected: false,
        countryFlagUrl: AppAssets.icFlagSpanish,
        countryName: "Spanish",
      ),
      LanguageData(
        isSelected: false,
        countryFlagUrl: AppAssets.icFlagFrench,
        countryName: "French",
      ),
      LanguageData(
        isSelected: false,
        countryFlagUrl: AppAssets.icFlagGermany,
        countryName: "Germon",
      ),
      LanguageData(
        isSelected: false,
        countryFlagUrl: AppAssets.icFlagArabic,
        countryName: "Arabic",
      ),
      LanguageData(
        isSelected: false,
        countryFlagUrl: AppAssets.icFlagRussia,
        countryName: "Russian",
      ),
      LanguageData(
        isSelected: false,
        countryFlagUrl: AppAssets.icFlagIndonesia,
        countryName: "Indonesia",
      ),
      LanguageData(
        isSelected: false,
        countryFlagUrl: AppAssets.icFlagChines,
        countryName: "Chines",
      ),
      LanguageData(
        isSelected: false,
        countryFlagUrl: AppAssets.icFlagItalian,
        countryName: "Italian",
      ),
      LanguageData(
        isSelected: false,
        countryFlagUrl: AppAssets.icFlagIndia,
        countryName: "English (IND)",
      ),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    fillData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtLanguage,
            isShowBack: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: LanguageListView(
                languageList: languageLis,
                suggestedList: suggestedLanguageList,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}

class LanguageListView extends StatefulWidget {
  final List<LanguageData> suggestedList;
  final List<LanguageData> languageList;

  const LanguageListView({super.key, required this.languageList, required this.suggestedList});

  @override
  State<LanguageListView> createState() => _LanguageListViewState();
}

class _LanguageListViewState extends State<LanguageListView> {
  String? selectedLanguageCode;

  @override
  void initState() {
    super.initState();

    // Set default selection to the first suggested item
    if (widget.suggestedList.isNotEmpty) {
      final defaultLang = widget.suggestedList.first;
      selectedLanguageCode = defaultLang.countryName;

      // Update selection flags
      for (var lang in widget.suggestedList) {
        lang.isSelected = lang.countryName == selectedLanguageCode;
      }
      for (var lang in widget.languageList) {
        lang.isSelected = lang.countryName == selectedLanguageCode;
      }
    }
  }

  void onLanguageSelected(LanguageData selected) {
    setState(() {
      selectedLanguageCode = selected.countryName;

      for (var lang in widget.suggestedList) {
        lang.isSelected = lang.countryName == selectedLanguageCode;
      }
      for (var lang in widget.languageList) {
        lang.isSelected = lang.countryName == selectedLanguageCode;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10.setHeight),
          CommonText(
            text: "Suggested",
            textColor: CustomAppColor.of(context).txtBlack,
            fontWeight: FontWeight.w400,
            fontSize: 18.setFontSize,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 10.setHeight),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: widget.suggestedList.length,
            itemBuilder: (context, index) {
              final language = widget.suggestedList[index];
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            language.countryFlagUrl,
                            width: 25.setWidth,
                            height: 16.setHeight,
                          ),
                          SizedBox(width: 20.setWidth),
                          CommonText(
                            text: language.countryName,
                            textColor: CustomAppColor.of(context).txtBlack,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.setFontSize,
                          )
                        ],
                      ),
                      Radio<String>(
                        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                          if (states.contains(WidgetState.selected)) {
                            return CustomAppColor.of(context).primary;
                          }
                          return CustomAppColor.of(context).lineColor;
                        }),
                        value: language.countryName,
                        groupValue: selectedLanguageCode,
                        onChanged: (_) => onLanguageSelected(language),
                      )
                    ],
                  ),
                  const Divider(),
                ],
              );
            },
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: Languages.of(context).txtLanguage,
            textColor: CustomAppColor.of(context).txtBlack,
            fontWeight: FontWeight.w400,
            fontSize: 18.setFontSize,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 10.setHeight),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: widget.languageList.length,
            itemBuilder: (context, index) {
              final language = widget.languageList[index];
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            language.countryFlagUrl,
                            width: 25.setWidth,
                            height: 16.setHeight,
                          ),
                          SizedBox(width: 20.setWidth),
                          CommonText(
                            text: language.countryName,
                            textColor: CustomAppColor.of(context).txtBlack,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.setFontSize,
                          )
                        ],
                      ),
                      Radio<String>(
                        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                          if (states.contains(WidgetState.selected)) {
                            return CustomAppColor.of(context).primary;
                          }
                          return CustomAppColor.of(context).lineColor;
                        }),
                        value: language.countryName,
                        groupValue: selectedLanguageCode,
                        onChanged: (_) => onLanguageSelected(language),
                      )
                    ],
                  ),
                  const Divider(),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
