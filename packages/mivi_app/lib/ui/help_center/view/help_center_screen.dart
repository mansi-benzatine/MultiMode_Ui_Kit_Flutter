import 'package:flutter/material.dart';
import 'package:mivi_app/interfaces/top_bar_click_listener.dart';
import 'package:mivi_app/localization/language/languages.dart';
import 'package:mivi_app/utils/app_color.dart';
import 'package:mivi_app/utils/constant.dart';
import 'package:mivi_app/utils/sizer_utils.dart';
import 'package:mivi_app/widgets/text/common_text.dart';
import 'package:mivi_app/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';
import '../../../widgets/text_field/text_form_field.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (context) => const HelpCenterScreen(),
    );
  }

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> with TickerProviderStateMixin implements TopBarClickListener {
  late TabController _tabController;

  ValueNotifier<String> selectedContactUs = ValueNotifier("");

  ValueNotifier<int> expandedFAQIndex = ValueNotifier(-1);
  int selectedIndex = 0;
  List<Map<String, String>> get faqData => [
        {
          'question': "What is Mivi?",
          'answer': "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        },
        {
          'question': "How to use Mivi?",
          'answer': "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        },
        {
          'question': "How do I cancel any order?",
          'answer': "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        },
        {
          'question': "Can I get a discount on my order?",
          'answer': "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        },
        {
          'question': "Why can't I make payment?",
          'answer': "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        },
        {
          'question': "Can I split the payment?",
          'answer': "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        },
      ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(
      () {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Stack(
        children: [
          Column(
            children: [
              TopBar(
                this,
                isShowBack: true,
                title: Languages.of(context).txtHelpCenter,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTab(Languages.of(context).txtFAQ, 0),
                  SizedBox(width: 20.setWidth),
                  _buildTab(Languages.of(context).txtContactUs, 1),
                ],
              ),
              _tabsView(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          _tabController.index = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.only(left: 46.setWidth, top: 14.setHeight, right: 46.setWidth),
        decoration: BoxDecoration(
          color: isSelected ? CustomAppColor.of(context).selectedTabBar : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonText(
              text: title,
              textColor: isSelected ? CustomAppColor.of(context).secondary : null,
              fontFamily: Constant.fontFamilyBold700,
              fontSize: 15.setFontSize,
            ),
            SizedBox(height: 12.setHeight),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: 2.5,
              width: isSelected ? 45 : 0,
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).secondary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _tabsView() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(
              top: 20.setHeight,
              bottom: MediaQuery.of(context).padding.bottom + 10.setHeight,
              left: 15.setWidth,
              right: 15.setWidth,
            ),
            child: Column(
              children: [
                CommonTextFormFieldWithPrefix(
                  controller: TextEditingController(),
                  hintText: "Search...",
                  fillColor: CustomAppColor.of(context).transparent,
                  radius: 12,
                  prefixIcon: AppAssets.icSearch,
                ),
                SizedBox(height: 10.setHeight),
                _faqQuestionsAndAnswersView(),
              ],
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 10.setHeight),
            child: Column(
              children: [
                _itemContactUsView(title: "Customer Service", image: AppAssets.icCustomer),
                _itemContactUsView(title: "Whatsapp", image: AppAssets.icWhatsapp),
                _itemContactUsView(title: "Facebook", image: AppAssets.icFacebook),
                _itemContactUsView(title: "Website", image: AppAssets.icWebsite),
                _itemContactUsView(title: "Twitter", image: AppAssets.icTwitter),
                _itemContactUsView(title: "Instagram", image: AppAssets.icInstagram),
                _itemContactUsView(title: "Telegram", image: AppAssets.icTelegram),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _faqQuestionsAndAnswersView() {
    return Container(
      margin: EdgeInsets.only(top: 10.setHeight),
      child: ListView.builder(
        itemCount: faqData.length,
        padding: EdgeInsets.symmetric(horizontal: 0.setWidth),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _itemFAQView(
            question: faqData[index]['question'] ?? '',
            answer: faqData[index]['answer'] ?? '',
            index: index,
          );
        },
      ),
    );
  }

  _itemFAQView({required String question, required String answer, required int index}) {
    return ValueListenableBuilder(
      valueListenable: expandedFAQIndex,
      builder: (context, expandedIndex, child) {
        final isExpanded = expandedIndex == index;
        return Container(
          margin: EdgeInsets.only(bottom: 18.setHeight),
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
                  padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 12.setHeight),
                  decoration: BoxDecoration(
                    color: isExpanded ? CustomAppColor.of(context).secondary : CustomAppColor.of(context).helpCenterBg,
                    borderRadius: BorderRadius.vertical(
                      top: const Radius.circular(10),
                      bottom: Radius.circular(isExpanded ? 0 : 12),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: CommonText(
                          text: question,
                          fontSize: 13.setFontSize,
                          fontFamily: Constant.fontFamilySemiBold600,
                          textAlign: TextAlign.start,
                          textColor: isExpanded ? CustomAppColor.of(context).black : null,
                        ),
                      ),
                      SizedBox(width: 10.setWidth),
                      AnimatedRotation(
                        turns: isExpanded ? 0.75 : 0.25,
                        duration: const Duration(milliseconds: 300),
                        child: Icon(
                          Icons.chevron_right,
                          color: isExpanded ? CustomAppColor.of(context).black : CustomAppColor.of(context).icBlackWhite,
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
                          left: 10.setWidth,
                          right: 10.setWidth,
                          bottom: 10.setHeight,
                          top: 10.setHeight,
                        ),
                        alignment: Alignment.topLeft,
                        child: CommonText(
                          text: answer,
                          fontSize: 12.setFontSize,
                          fontFamily: Constant.fontFamilyMedium500,
                          textAlign: TextAlign.start,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        );
      },
    );
  }

  _itemContactUsView({required String title, required String image}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 0.setHeight),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.setWidth, vertical: 15.setHeight),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgScreen,
          border: Border(
            bottom: BorderSide(
              color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomAppColor.of(context).selectedTabBar,
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                image,
                height: 18.setHeight,
                width: 18.setHeight,
              ),
            ),
            SizedBox(width: 10.setWidth),
            Expanded(
              child: CommonText(
                text: title,
                fontSize: 15.setFontSize,
                fontFamily: Constant.fontFamilySemiBold600,
                textColor: CustomAppColor.of(context).txtBlack,
                textAlign: TextAlign.start,
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
