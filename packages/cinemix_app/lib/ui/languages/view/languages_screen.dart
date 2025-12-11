import 'package:cinemix_app/interfaces/top_bar_click_listener.dart';
import 'package:cinemix_app/localization/language/languages.dart';
import 'package:cinemix_app/ui/languages/datamodel/languages_data.dart';
import 'package:cinemix_app/utils/app_color.dart';
import 'package:cinemix_app/utils/constant.dart';
import 'package:cinemix_app/utils/sizer_utils.dart';
import 'package:cinemix_app/widgets/text/common_text.dart';
import 'package:cinemix_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

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
            title: Languages.of(context).txtLanguage,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 22.setWidth,
                right: 22.setWidth,
                top: 0.setHeight,
                bottom: MediaQuery.of(context).padding.bottom + 10.setHeight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: Languages.of(context).txtSuggested,
                    fontSize: 16.setFontSize,
                    fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
                    textColor: CustomAppColor.of(context).txtLightGrey,
                  ),
                  SizedBox(height: 10.setHeight),
                  ...languages.where((e) => e.isSuggested).map(
                        (e) => _itemOfOptionsView(
                          image: e.flagImage,
                          title: e.language,
                        ),
                      ),
                  Divider(color: CustomAppColor.of(context).border, height: 25.setHeight),
                  CommonText(
                    text: Languages.of(context).txtLanguage,
                    fontSize: 16.setFontSize,
                    fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
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
            margin: EdgeInsets.only(bottom: 12.setHeight),
            padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 10.setHeight),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  CustomAppColor.of(context).bgTextFormFieldShadowLight,
                  CustomAppColor.of(context).bgShadowDark,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
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
                  fontFamily: Constant.fontFamilyClashGroteskMedium500,
                ),
                SizedBox(width: 10.setWidth),
                Expanded(
                  child: CommonText(
                    text: title,
                    fontSize: 15.setFontSize,
                    fontFamily: Constant.fontFamilyClashGroteskMedium500,
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
