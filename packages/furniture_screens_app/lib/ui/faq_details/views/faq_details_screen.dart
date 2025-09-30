import 'package:flutter/material.dart';
import 'package:furniture_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:furniture_screens_app_package/utils/app_color.dart';
import 'package:furniture_screens_app_package/utils/constant.dart';
import 'package:furniture_screens_app_package/utils/sizer_utils.dart';
import 'package:furniture_screens_app_package/widgets/top_bar/topbar.dart';

import '../../../widgets/text/common_text.dart';

class FaqDetailsScreen extends StatefulWidget {
  final String title;
  static Route<void> route({required String title}) {
    return MaterialPageRoute(
        builder: (_) => FaqDetailsScreen(
              title: title,
            ));
  }

  const FaqDetailsScreen({super.key, this.title = "About Furnify"});

  @override
  State<FaqDetailsScreen> createState() => _FaqDetailsScreenState();
}

class _FaqDetailsScreenState extends State<FaqDetailsScreen> implements TopBarClickListener {
  final List<Map<String, String>> _faqDetails = [
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
              title: widget.title,
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 10.setHeight),
                itemCount: _faqDetails.length,
                separatorBuilder: (_, __) => const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  final section = _faqDetails[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: "${index + 1}. ${section["title"]}",
                        fontSize: 18.setFontSize,
                        fontFamily: Constant.fontFamilyBold700,
                        textColor: CustomAppColor.of(context).txtPrimary,
                      ),
                      SizedBox(height: 8.setHeight),
                      CommonText(
                        text: section["content"] ?? "",
                        fontSize: 14.setFontSize,
                        fontFamily: Constant.fontFamilyMedium500,
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
