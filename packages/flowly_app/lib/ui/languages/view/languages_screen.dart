import 'package:flowly_app/interfaces/top_bar_click_listener.dart';
import 'package:flowly_app/localization/language/languages.dart';
import 'package:flowly_app/utils/app_color.dart';
import 'package:flowly_app/utils/constant.dart';
import 'package:flowly_app/utils/sizer_utils.dart';
import 'package:flowly_app/widgets/text/common_text.dart';
import 'package:flowly_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../datamodel/language_data.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (context) => const LanguagesScreen());
  }

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> implements TopBarClickListener {
  List<LanguagesDataModel> languages = [
    LanguagesDataModel(language: "English (UK)", flagImage: "🇬🇧", isSuggested: true),
    LanguagesDataModel(language: "English (US)", flagImage: "🇺🇸", isSuggested: true),
    LanguagesDataModel(language: "Hindi", flagImage: "🇮🇳"),
    LanguagesDataModel(language: "Spanish", flagImage: "🇪🇸"),
    LanguagesDataModel(language: "French", flagImage: "🇫🇷"),
    LanguagesDataModel(language: "German", flagImage: "🇩🇪"),
    LanguagesDataModel(language: "Arabic", flagImage: "🇸🇦"),
    LanguagesDataModel(language: "Russian", flagImage: "🇷🇺"),
    LanguagesDataModel(language: "Indonesia", flagImage: "🇮🇩"),
    LanguagesDataModel(language: "English (IND)", flagImage: "🇮🇳"),
  ];

  ValueNotifier<String> selectedLanguage = ValueNotifier("English (UK)");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            isShowBack: true,
            title: Languages.of(context).txtLanguages,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 20.setWidth,
                right: 20.setWidth,
                top: 0.setHeight,
                bottom: MediaQuery.of(context).padding.bottom + 10.setHeight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: Languages.of(context).txtSuggested,
                    fontSize: 15.setFontSize,
                    fontFamily: Constant.fontFamilyMulishMedium500,
                    textColor: CustomAppColor.of(context).txtLightGrey,
                  ),
                  SizedBox(height: 10.setHeight),
                  ...languages.where((e) => e.isSuggested).map(
                        (e) => _itemOfOptionsView(
                          image: e.flagImage,
                          title: e.language,
                        ),
                      ),
                  SizedBox(height: 14.setHeight),
                  CommonText(
                    text: Languages.of(context).txtLanguages,
                    fontSize: 15.setFontSize,
                    fontFamily: Constant.fontFamilyMulishMedium500,
                    textColor: CustomAppColor.of(context).txtLightGrey,
                  ),
                  SizedBox(height: 14.setHeight),
                  ...languages.where((e) => !e.isSuggested).map(
                        (e) => _itemOfOptionsView(
                          image: e.flagImage,
                          title: e.language,
                        ),
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _itemOfOptionsView({required String image, required String title}) {
    return ValueListenableBuilder(
      valueListenable: selectedLanguage,
      builder: (context, value, child) {
        return InkWell(
          highlightColor: CustomAppColor.of(context).transparent,
          splashColor: CustomAppColor.of(context).transparent,
          onTap: () {
            selectedLanguage.value = title;
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 10.setHeight),
            padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 8.setHeight),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: selectedLanguage.value == title
                    ? [
                        CustomAppColor.of(context).primary.withValues(alpha: 0.1),
                        CustomAppColor.of(context).primary.withValues(alpha: 0.1),
                      ]
                    : [
                        CustomAppColor.of(context).transparent,
                        CustomAppColor.of(context).transparent,
                      ],
              ),
              color: selectedLanguage.value == title ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgScreen,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: selectedLanguage.value == title ? CustomAppColor.of(context).secondary : CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
                width: selectedLanguage.value == title ? 1 : 1,
              ),
            ),
            child: Row(
              children: [
                CommonText(
                  text: image,
                  fontSize: 18.setFontSize,
                  fontFamily: Constant.fontFamilyMulishMedium500,
                ),
                SizedBox(width: 10.setWidth),
                Expanded(
                  child: CommonText(
                    text: title,
                    fontSize: 14.setFontSize,
                    fontFamily: Constant.fontFamilyMulishMedium500,
                    textColor: CustomAppColor.of(context).txtBlack,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
