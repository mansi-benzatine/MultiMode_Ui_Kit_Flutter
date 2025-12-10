import 'package:flutter/material.dart';
import 'package:grokit_app/interfaces/top_bar_click_listener.dart';
import 'package:grokit_app/utils/app_color.dart';
import 'package:grokit_app/utils/constant.dart';
import 'package:grokit_app/utils/sizer_utils.dart';
import 'package:grokit_app/widgets/text/common_text.dart';

import '../../../localization/language/languages.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../datamodel/language_data.dart';

class LanguagesScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const LanguagesScreen());
  }

  const LanguagesScreen({super.key});

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
    LanguagesDataModel(language: "Germon", flagImage: "🇩🇪"),
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
                left: 22.setWidth,
                right: 22.setWidth,
                top: 5.setHeight,
                bottom: MediaQuery.of(context).padding.bottom + 10.setHeight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: Languages.of(context).txtSuggested,
                    fontSize: 14.setFontSize,
                    fontFamily: Constant.fontFamilySemiBold600,
                    textColor: CustomAppColor.of(context).txtGray,
                  ),
                  SizedBox(height: 10.setHeight),
                  ...languages.where((e) => e.isSuggested).map(
                        (e) => _itemOfOptionsView(
                          image: e.flagImage,
                          title: e.language,
                        ),
                      ),
                  SizedBox(height: 10.setHeight),
                  CommonText(
                    text: Languages.of(context).txtLanguages,
                    fontSize: 14.setFontSize,
                    fontFamily: Constant.fontFamilySemiBold600,
                    textColor: CustomAppColor.of(context).txtGray,
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
            padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 10.setHeight),
            decoration: BoxDecoration(
              color: selectedLanguage.value == title ? CustomAppColor.of(context).unselectedCard : CustomAppColor.of(context).bgScreen,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: selectedLanguage.value == title ? CustomAppColor.of(context).txtPrimary : CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
                width: selectedLanguage.value == title ? 1.5 : 1,
              ),
            ),
            child: Row(
              children: [
                CommonText(
                  text: image,
                  fontSize: 20.setFontSize,
                  fontWeight: FontWeight.w700,
                  fontFamily: Constant.fontFamilyBold700,
                ),
                SizedBox(width: 10.setWidth),
                Expanded(
                  child: CommonText(
                    text: title,
                    fontSize: 14.setFontSize,
                    fontFamily: Constant.fontFamilySemiBold600,
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
