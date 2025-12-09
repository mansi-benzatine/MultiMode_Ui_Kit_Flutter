import 'package:flowly_app/interfaces/top_bar_click_listener.dart';
import 'package:flowly_app/localization/language/languages.dart';
import 'package:flowly_app/utils/app_color.dart';
import 'package:flowly_app/utils/constant.dart';
import 'package:flowly_app/utils/sizer_utils.dart';
import 'package:flowly_app/widgets/text/common_text.dart';
import 'package:flowly_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen());
  }

  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> implements TopBarClickListener {
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
              title: Languages.of(context).txtPrivacyPolicy,
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
                        fontSize: 15.setFontSize,
                        fontFamily: Constant.fontFamilyMulishSemiBold600,
                      ),
                      SizedBox(height: 8.setHeight),
                      CommonText(
                        text: section["content"] ?? "",
                        fontSize: 12.setFontSize,
                        fontFamily: Constant.fontFamilyMulishMedium500,
                        textColor: CustomAppColor.of(context).txtLightGrey,
                        textAlign: TextAlign.start,
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
