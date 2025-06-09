import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const PrivacyPolicyScreen());
  }

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> implements TopBarClickListener {
  List<Map<String, String>> questionList = [];

  void fillData() {
    questionList = [
      {
        "question": "Types of data we collect",
        "answer":
            "Lorem Ipsum is simply dummy text of the printing typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. Lorem Ipsum is simply dummy text of the printing typesetting industry."
      },
      {
        "question": "Use Of your personal data",
        "answer":
            "Lorem Ipsum is simply dummy text of the printing typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. Lorem Ipsum is simply dummy text of the printing typesetting industry."
      },
      {
        "question": "Disclosure of your personal data",
        "answer":
            "Lorem Ipsum is simply dummy text of the printing typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. Lorem Ipsum is simply dummy text of the printing typesetting industry."
      },
      {
        "question": "Types of data we collect",
        "answer":
            "Lorem Ipsum is simply dummy text of the printing typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. Lorem Ipsum is simply dummy text of the printing typesetting industry."
      },
      {
        "question": " Use Of your personal data",
        "answer":
            "Lorem Ipsum is simply dummy text of the printing typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. Lorem Ipsum is simply dummy text of the printing typesetting industry."
      },
      {
        "question": "Disclosure of your personal data",
        "answer":
            "Lorem Ipsum is simply dummy text of the printing typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. Lorem Ipsum is simply dummy text of the printing typesetting industry."
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            IgnorePointer(ignoring: true, child: TopBar(this, title: Languages.of(context).txtPrivacyPolicy)),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                  itemCount: questionList.length,
                  itemBuilder: (context, index) {
                    final privacy = questionList[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 25.setHeight),
                        CommonText(
                          text: "${index + 1}. ${privacy['question'] ?? ''}",
                          fontWeight: FontWeight.w600,
                          fontSize: 20.setFontSize,
                          textColor: CustomAppColor.of(context).primary,
                          height: 1,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 15.setHeight),
                        CommonText(
                          text: privacy["answer"] ?? '',
                          fontWeight: FontWeight.w400,
                          fontSize: 14.setFontSize,
                          textColor: CustomAppColor.of(context).txtBlack,
                          height: 1,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    );
                  }),
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
