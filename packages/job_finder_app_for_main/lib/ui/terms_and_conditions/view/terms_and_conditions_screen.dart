import 'package:flutter/material.dart';
import 'package:job_finder_app_package_for_main/utils/utils.dart';

import '../../../../../../utils/sizer_utils.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const TermsAndConditionsScreen());
  }

  @override
  State<TermsAndConditionsScreen> createState() => _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> implements TopBarClickListener {
  List<Map<String, String>> contentList = [];

  void fillData() {
    contentList = [
      {
        "title": "1. Conditions of use",
        "content":
            "Lorem Ipsum is simply dummy text of the printing of the typesetting industry. Lorem Ipsum has been the text into industry's standard dummy text ever since the 1500s, it when an text of the printing  typesetting to the biggest industry. unknown printer took a galley of type and the scrambled it to make a type specimen book. It has been survived not only five centuries, but also the leap into electronic typesetting, remaining essentially to the real unchange. Lorem Ipsum is simply dummy text of the new printing typesetting industry."
      },
      {
        "title": "2. Privacy Policy",
        "content":
            "Lorem Ipsum is simply dummy text of the printing of the typesetting industry. Lorem Ipsum has been the text into industry's standard dummy text ever since the 1500s, it when an text of the printing  typesetting to the biggest industry. unknown printer took a galley of type and the scrambled it to make a type specimen book. It has been survived not only five centuries, but also the leap into electronic typesetting, remaining essentially to the real unchange. Lorem Ipsum is simply dummy text of the new printing typesetting industry. the scrambled it to make a type specimen book. It has been survived not only five centuries, but also the leap into electronic typesetting, remaining essentially to the real text of the printing unchange."
      },
      {
        "title": "3. Intellectual Property",
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
          TopBar(
            this,
            title: Languages.of(context).txtTermsAndConditions,
            isShowTitle: true,
            isShowBack: true,
            textColor: CustomAppColor.of(context).txtSecondaryWhite,
            iconColor: CustomAppColor.of(context).bgDetailsCard,
          ),
          SizedBox(height: 10.setHeight),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
              child: Column(
                children: [
                  CommonText(
                    text:
                        "Please read this Terms and Conditions it to make a type specimen book. It has been survived not only five steps centuries, but also the leap into electronic typesetting, remaining essentially.",
                    fontWeight: FontWeight.w400,
                    maxLines: 60,
                    textColor: CustomAppColor.of(context).txtGrey,
                    fontSize: 12.setFontSize,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 20.setHeight),
                  Column(
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
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _ContinueButtonView(
              onTap: () {},
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

class _ContinueButtonView extends StatelessWidget {
  final Function() onTap;
  const _ContinueButtonView({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScreenWhite,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 20,
            spreadRadius: 0,
            color: CustomAppColor.of(context).black.withOpacityPercent(.08),
          ),
        ],
      ),
      padding: EdgeInsets.only(left: 25.setWidth, right: 25.setWidth, bottom: 10.setHeight, top: 15.setHeight),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: CommonOutlineButton(
                height: 50.setHeight,
                text: Languages.of(context).txtDecline,
                buttonBorderColor: CustomAppColor.of(context).secondary,
                buttonTextColor: CustomAppColor.of(context).txtSecondary,
                buttonColor: CustomAppColor.of(context).bgScreenWhite,
              ),
            ),
            SizedBox(width: 15.setHeight),
            Expanded(
              child: CommonButton(
                height: 50.setHeight,
                text: Languages.of(context).txtAccept,
                buttonTextSize: 18.setFontSize,
                buttonTextWeight: FontWeight.w500,
                buttonColor: CustomAppColor.of(context).txtSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
