import 'package:flutter/material.dart';
import 'package:food_delivery_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:food_delivery_screens_app_package/localization/language/languages.dart';
import 'package:food_delivery_screens_app_package/utils/app_color.dart';
import 'package:food_delivery_screens_app_package/utils/constant.dart';
import 'package:food_delivery_screens_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_screens_app_package/widgets/text/common_text.dart';
import 'package:food_delivery_screens_app_package/widgets/top_bar/topbar.dart';

import '../datamodel/term_and_condition_data.dart';

class TermAndConditionScreen extends StatefulWidget {
  const TermAndConditionScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const TermAndConditionScreen());
  }

  @override
  State<TermAndConditionScreen> createState() => _TermAndConditionScreenState();
}

class _TermAndConditionScreenState extends State<TermAndConditionScreen> implements TopBarClickListener {
  List<TermsSection> sections = [];

  void fillData() {
    sections = [
      TermsSection(
        title: '1. Conditions Of Use',
        description:
            'Lorem Ipsum is simply dummy text of the printing of the typesetting industry. Lorem Ipsum has been the text into industry\'s standard dummy text ever since the 1500s, it when an text of the printing  typesetting to the biggest industry. unknown printer took a galley of type and the scrambled it to make a type specimen book. It has been survived not only five centuries, but also the leap into electronic typesetting, remaining essentially to the real unchange. Lorem Ipsum is simply dummy text of the new printing typesetting industry. Lorem Ipsum is simply dummy text of the new printing typesetting industry.',
      ),
      TermsSection(
        title: '2. Privacy Policy',
        description:
            'Please read this Terms and Conditions it to make a type specimen book. It has been survived not only five steps centuries, but also the leap into electronic typesetting, remaining essentially. Please read this Terms and the Conditions it to make a type specimen book. It has been survived not only five steps centuries, but also the leap into electronic typesetting, remaining essentially. Lorem Ipsum is simply dummy text of the new printing typesetting industry.Lorem Ipsum is simply dummy text of the new printing typesetting industry.',
      ),
      TermsSection(
        title: '3. Intellectual Property',
        description:
            'Lorem Ipsum is simply dummy text of the printing of the typesetting industry. Lorem Ipsum has been the text into industry\'s standard dummy text ever since the 1500s, it when an text of the printing  typesetting to the biggest industry. unknown printer took a galley of type and the scrambled it to make a type specimen book. It has been survived not only five centuries, but also the leap into electronic typesetting, remaining essentially to the real unchange. Lorem Ipsum is simply dummy text of the new printing typesetting industry. Lorem Ipsum is simply dummy text of the new printing typesetting industry.',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtTermAndCondition,
              isShowBack: true,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 24.setWidth),
                children: [
                  CommonText(
                    text:
                        'Please read this Terms and Conditions it to make a type specimen book. It has been survived not only five steps centuries, but also the leap into electronic typesetting, remaining essentially.',
                    fontWeight: FontWeight.w400,
                    fontSize: 13.setFontSize,
                    textColor: CustomAppColor.of(context).txtGrey,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 16.setHeight),
                  ...sections.map(
                    (section) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: section.title,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.setFontSize,
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 10.setHeight),
                          CommonText(
                            text: section.description,
                            fontWeight: FontWeight.w400,
                            fontSize: 13.setFontSize,
                            textAlign: TextAlign.start,
                            textColor: CustomAppColor.of(context).txtGrey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
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
