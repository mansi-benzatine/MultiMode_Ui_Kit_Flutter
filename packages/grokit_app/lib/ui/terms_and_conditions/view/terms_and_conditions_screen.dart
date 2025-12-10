import 'package:flutter/material.dart';
import 'package:grokit_app/interfaces/top_bar_click_listener.dart';
import 'package:grokit_app/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart' show Constant;
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const TermsAndConditionsScreen());
  }

  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() => _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> implements TopBarClickListener {
  final List<Map<String, String>> _policySections = [
    {
      "title": "Types Of Data We Collect",
      "content": "Lorem Ipsum is simply dummy text of the printing typesetting industry. "
          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it to make a type specimen book."
          "Lorem Ipsum is simply dummy text of the printing typesetting industry. "
          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it to make a type specimen book."
          "Lorem Ipsum is simply dummy text of the printing typesetting industry. "
    },
    {
      "title": "Use Of Your Personal Data",
      "content": "Lorem Ipsum is simply dummy text of the printing typesetting industry. "
          "It has survived not only five centuries, but also the leap into electronic typesetting, "
          "remaining essentially unchanged."
          "Lorem Ipsum is simply dummy text of the printing typesetting industry. "
          "It has survived not only five centuries, but also the leap into electronic typesetting, "
          "remaining essentially unchanged."
          "Lorem Ipsum is simply dummy text of the printing typesetting industry. "
          "It has survived not only five centuries, but also the leap into electronic typesetting, "
          "remaining essentially unchanged."
    },
    {
      "title": "Disclosure Of Your Personal Data",
      "content": "Lorem Ipsum is simply dummy text of the printing typesetting industry. "
          "When an unknown printer took a galley of type and scrambled it to make a type specimen book."
          "Lorem Ipsum is simply dummy text of the printing typesetting industry. "
          "When an unknown printer took a galley of type and scrambled it to make a type specimen book."
          "Lorem Ipsum is simply dummy text of the printing typesetting industry. "
          "When an unknown printer took a galley of type and scrambled it to make a type specimen book."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              isShowBack: true,
              title: Languages.of(context).txtTermsAndConditions,
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
                itemCount: _policySections.length,
                separatorBuilder: (_, __) => const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  final section = _policySections[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: "${index + 1}. ${section["title"]}",
                        fontSize: 16.setFontSize,
                        fontFamily: Constant.fontFamilyBold700,
                      ),
                      SizedBox(height: 8.setHeight),
                      CommonText(
                        text: section["content"] ?? "",
                        fontSize: 13.setFontSize,
                        fontFamily: Constant.fontFamilyMedium500,
                        textAlign: TextAlign.start,
                        textColor: CustomAppColor.of(context).txtGray,
                      ),
                    ],
                  );
                },
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
  }
}
