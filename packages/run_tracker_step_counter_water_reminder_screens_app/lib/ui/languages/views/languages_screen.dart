import 'package:flutter/material.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/constant.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/sizer_utils.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/widgets/top_bar/topbar.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import '../datamodels/languages_data.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (context) => const LanguageScreen());
  }

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen>
    implements TopBarClickListener {
  String? _selectedLanguage;
  List<LanguageData> languageList(BuildContext context) {
    return [
      LanguageData(language: "English (US)", isSuggested: true),
      LanguageData(language: "English (UK)", isSuggested: true),
      LanguageData(language: "Mandarin"),
      LanguageData(language: "Hindi"),
      LanguageData(language: "Spanish"),
      LanguageData(language: "French"),
      LanguageData(language: "Arabic"),
      LanguageData(language: "Bengali"),
      LanguageData(language: "Russian"),
      LanguageData(language: "Indonesian"),
    ];
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final allLanguages = languageList(context);
      if (allLanguages.isNotEmpty) {
        setState(() {
          _selectedLanguage = allLanguages.first.language;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final suggestedLanguages = languageList(
      context,
    ).where((item) => item.isSuggested).toList();
    final otherLanguages = languageList(
      context,
    ).where((item) => !item.isSuggested).toList();

    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,

      body: Column(
        children: [
          TopBar(
            this,
            isShowBack: true,
            isShowSimpleTitle: true,
            simpleTitle: Languages.of(context).txtLanguage,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.setWidth,
                  vertical: 14.setHeight,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: Languages.of(context).txtSuggested,
                      fontWeight: FontWeight.w700,
                      fontSize: 18.setFontSize,
                    ),
                    buildLanguageList(suggestedLanguages),
                    Divider(color: CustomAppColor.of(context).containerBorder),
                    buildLanguageList(otherLanguages),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLanguageList(List<LanguageData> languages) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 2.setHeight),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: languages.length,
      itemBuilder: (context, index) {
        final languageData = languages[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 4.setHeight),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: languageData.language,
                fontWeight: FontWeight.w600,
                fontSize: 16.setFontSize,
              ),
              Radio<String>(
                fillColor: WidgetStateProperty.resolveWith((states) {
                  return CustomAppColor.of(context).primary;
                }),
                value: languageData.language,
                groupValue: _selectedLanguage,
                onChanged: (String? value) {
                  setState(() {
                    _selectedLanguage = value;
                  });
                },
              ),
            ],
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
