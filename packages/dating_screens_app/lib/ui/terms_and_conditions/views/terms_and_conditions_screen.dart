import 'package:dating_screens_app_package/localization/language/languages.dart';
import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../datamodels/terms_and_conditions_data.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const TermsAndConditionsScreen());
  }

  @override
  State<TermsAndConditionsScreen> createState() => _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> implements TopBarClickListener {
  final List<TermsAndConditionsData> privacyPolicySections = [
    TermsAndConditionsData(
      title: "Conditions of use",
      content:
          "Lorem Ipsum is simply dummy text of the printing of the typesetting industry. Lorem Ipsum has been the text into industry's standard dummy text ever since the 1500s, it when an text of the printing typesetting to the biggest industry. unknown printer took a galley of type and the scrambled it to make a type specimen book. It has been survived not only five centuries, but also the leap into electronic typesetting, remaining essentially to the real unchange. Lorem Ipsum is simply dummy text of the new printing typesetting industry. the scrambled it to make a type specimen book. It has been survived not only five centuries, but also the leap into electronic typesetting, remaining essentially to the real text of the printing unchange.",
    ),
    TermsAndConditionsData(
      title: "Privacy Policy",
      content:
          "Lorem Ipsum is simply dummy text of the printing of the typesetting industry. Lorem Ipsum has been the text into industry's standard dummy text ever since the 1500s, it when an text of the printing typesetting to the biggest industry. unknown printer took a galley of type and the scrambled it to make a type specimen book. It has been survived not only five centuries, but also the leap into electronic typesetting, remaining essentially to the real unchange. Lorem Ipsum is simply dummy text of the new printing typesetting industry. the scrambled it to make a type specimen book. It has been survived not only five centuries, but also the leap into electronic typesetting, remaining essentially to the real text of the printing unchange.",
    ),
    TermsAndConditionsData(
      title: "Intellectual Property ",
      content:
          "Lorem Ipsum is simply dummy text of the printing of the typesetting industry. Lorem Ipsum has been the text into industry's standard dummy text ever since the 1500s, it  it when an text of the printing  typesetting to the biggest industry. ",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtTermsOfService,
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
                  child: Column(
                    children: [
                      CommonText(
                        text:
                            "Please read this Terms and Conditions it to make a type specimen book. It has been survived not only five steps centuries, but also the leap into electronic typesetting, remaining essentially.",
                        fontSize: 13.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtGrey,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 8.setHeight),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: privacyPolicySections.length,
                        separatorBuilder: (_, __) => SizedBox(height: 20.setHeight),
                        itemBuilder: (context, index) {
                          final section = privacyPolicySections[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: "${index + 1}. ${section.title}",
                                fontSize: 18.setFontSize,
                                fontWeight: FontWeight.w700,
                                textColor: CustomAppColor.of(context).txtVelvet,
                              ),
                              SizedBox(height: 8.setHeight),
                              CommonText(
                                text: section.content,
                                fontSize: 13.setFontSize,
                                fontWeight: FontWeight.w400,
                                textColor: CustomAppColor.of(context).txtGrey,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: 8.setHeight),
                    ],
                  ),
                ),
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
