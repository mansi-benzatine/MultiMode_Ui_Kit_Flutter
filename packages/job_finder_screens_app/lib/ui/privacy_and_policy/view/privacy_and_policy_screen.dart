import 'package:flutter/material.dart';

import '../../../../../../localization/language/languages.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/constant.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/top_bar/topbar.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../widgets/text/common_text.dart';

class PrivacyAndPolicyScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const PrivacyAndPolicyScreen());
  }

  const PrivacyAndPolicyScreen({super.key});

  @override
  State<PrivacyAndPolicyScreen> createState() => _PrivacyAndPolicyScreenState();
}

class _PrivacyAndPolicyScreenState extends State<PrivacyAndPolicyScreen> implements TopBarClickListener {
  List<Map<String, String>> contentList = [];

  void fillData() {
    contentList = [
      {
        "title": "1. Introduction",
        "content":
            "The scrambled it to make a type specimen book. It has been survived not only five centuries, but also the leap into electronic typesetting, remaining essentially to the real text of the printing unchange.\n\n"
                "Lorem Ipsum is simply dummy text of the printing of the typesetting industry. Lorem Ipsum has been the text into industry's standard dummy text ever since the 1500s, it when an text of the printing  typesetting to the biggest industry. unknown printer took a galley of type and the scrambled it to make a type specimen book. It has been survived not only five centuries, but also the leap into electronic typesetting, remaining essentially to the real unchange. Lorem Ipsum is simply dummy text of the new printing typesetting industry."
      },
      {
        "title": "2. Use of Your Personal Data",
        "content":
            "Lorem Ipsum is simply dummy text of the printing of the typesetting industry. Lorem Ipsum has been the text into industry's standard dummy text ever since the 1500s, it when an text of the printing  typesetting to the biggest industry. unknown printer took a galley of type and the scrambled it to make a type specimen book. It has been survived not only five centuries, but also the leap into electronic typesetting, remaining essentially to the real unchange. Lorem Ipsum is simply dummy text of the new printing typesetting industry. the scrambled it to make a type specimen book. It has been survived not only five centuries, but also the leap into electronic typesetting, remaining essentially to the real text of the printing unchange."
      },
      {
        "title": "3. Disclosure of Your Personal Data",
        "content":
            "Lorem Ipsum is simply dummy text of the printing of the typesetting industry. Lorem Ipsum has been the text into industry's standard dummy text ever since the 1500s, it when an text of the printing  typesetting to the biggest industry. unknown printer took a galley of type and the scrambled it to make a type specimen book. It has been survived not only five centuries, but also the leap into electronic typesetting, remaining essentially to the real unchange. Lorem Ipsum is simply dummy text of the new printing typesetting industry. the scrambled it to make a type specimen book. It has been survived not only five centuries, but also the leap into electronic typesetting, remaining essentially to the real text of the printing unchange."
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      body: Column(
        children: [
          IgnorePointer(
            ignoring: true,
            child: TopBar(
              this,
              title: Languages.of(context).txtPrivacyAndPolicy,
              isShowTitle: true,
              isShowBack: true,
              textColor: CustomAppColor.of(context).txtSecondaryWhite,
              iconColor: CustomAppColor.of(context).bgDetailsCard,
            ),
          ),
          SizedBox(height: 10.setHeight),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: contentList
                    .map(
                      (section) => Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: ContentView(
                          title: section["title"]!,
                          content: section["content"]!,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
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

class ContentView extends StatelessWidget {
  final String title;
  final String content;

  const ContentView({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: title,
          fontWeight: FontWeight.w700,
          textColor: CustomAppColor.of(context).txtSecondaryWhite,
          fontSize: 18.setFontSize,
        ),
        const SizedBox(height: 8),
        CommonText(
          text: content,
          fontWeight: FontWeight.w400,
          maxLines: 60,
          textColor: CustomAppColor.of(context).txtGrey,
          fontSize: 12.setFontSize,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
