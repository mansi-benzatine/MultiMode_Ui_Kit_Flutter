import 'package:baby_bloom_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_screens_app/localization/language/languages.dart';
import 'package:baby_bloom_screens_app/utils/app_assets.dart';
import 'package:baby_bloom_screens_app/utils/app_color.dart';
import 'package:baby_bloom_screens_app/utils/constant.dart';
import 'package:baby_bloom_screens_app/utils/sizer_utils.dart';
import 'package:baby_bloom_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../../widgets/text/common_text.dart';

class FaqScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const FaqScreen());
  }

  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> implements TopBarClickListener {
  ValueNotifier<int> expandedFAQIndex = ValueNotifier(-1);
  List<Map<String, String>> get faqData => [
        {
          'question': "How does this app track my pregnancy?",
          'answer': "The app uses your due date or last period data calculate your pregnancy progress week by week.",
        },
        {
          'question': "Is the information provided medically accurate?",
          'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
        },
        {
          'question': "Can I track baby movements and kicks?",
          'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
        },
        {
          'question': "How do I set reminders for doctor visits?",
          'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
        },
        {
          'question': "Will the app track contractions during labor?",
          'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
        },
        {
          'question': "Is my data safe?",
          'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
        },
        {
          'question': "Can I track my weight and nutrition?",
          'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
        },
        {
          'question': "Does the app give baby growth updates?",
          'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
        },
        {
          'question': "Can my partner use the app too?",
          'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
        },
        {
          'question': "Does the app provide exercise or yoga tips?",
          'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
        },
      ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtFaq,
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [_faqQuestionsAndAnswersView()],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _faqQuestionsAndAnswersView() {
    return ListView.builder(
      itemCount: faqData.length,
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _itemFAQView(
          question: faqData[index]['question'] ?? '',
          answer: faqData[index]['answer'] ?? '',
          index: index,
        );
      },
    );
  }

  _itemFAQView({required String question, required String answer, required int index}) {
    return ValueListenableBuilder(
      valueListenable: expandedFAQIndex,
      builder: (context, expandedIndex, child) {
        final isExpanded = expandedIndex == index;
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 0.setHeight),
          child: Container(
            margin: EdgeInsets.only(bottom: 22.setHeight),
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).bgScreen,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: CustomAppColor.of(context).dividerColor, width: 1),
            ),
            child: Column(
              children: [
                InkWell(
                  highlightColor: CustomAppColor.of(context).transparent,
                  splashColor: CustomAppColor.of(context).transparent,
                  onTap: () {
                    expandedFAQIndex.value = isExpanded ? -1 : index;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 15.setHeight),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: const Radius.circular(10),
                        bottom: Radius.circular(isExpanded ? 0 : 10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: CommonText(
                            text: question,
                            fontSize: 14.setFontSize,
                            fontFamily: Constant.fontFamilySemiBold600,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(width: 10.setWidth),
                        AnimatedRotation(
                          turns: isExpanded ? 0.25 : 0.74,
                          duration: const Duration(milliseconds: 300),
                          child: Image.asset(
                            AppAssets.icArrowLeft,
                            height: 16.setHeight,
                            width: 16.setHeight,
                            color: CustomAppColor.of(context).icBlackWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: isExpanded
                      ? Container(
                          padding: EdgeInsets.only(
                            left: 15.setWidth,
                            right: 15.setWidth,
                            bottom: 15.setHeight,
                            top: 15.setHeight,
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                                width: 1,
                              ),
                            ),
                          ),
                          alignment: Alignment.topLeft,
                          child: CommonText(
                            text: answer,
                            fontSize: 12.setFontSize,
                            fontFamily: Constant.fontFamilyMedium500,
                            textColor: CustomAppColor.of(context).txtLightGrey,
                            textAlign: TextAlign.start,
                          ),
                        )
                      : const SizedBox.shrink(),
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
