import 'package:cinemix_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:cinemix_screens_app/localization/language/languages.dart';
import 'package:cinemix_screens_app/utils/app_color.dart';
import 'package:cinemix_screens_app/utils/constant.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:cinemix_screens_app/widgets/text/common_text.dart';
import 'package:cinemix_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../widgets/text_field/text_form_field.dart';

class HelpCenterScreen extends StatefulWidget {
  final int currentIndex;

  const HelpCenterScreen({super.key, this.currentIndex = 0});

  static Route<dynamic> route({int currentIndex = 0}) {
    return MaterialPageRoute(
      builder: (context) => HelpCenterScreen(currentIndex: currentIndex),
    );
  }

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> with TickerProviderStateMixin implements TopBarClickListener {
  late TabController _tabController;

  ValueNotifier<String> selectedContactUs = ValueNotifier("");
  ValueNotifier<int> selectedFAQCategory = ValueNotifier(0);

  ValueNotifier<int> expandedFAQIndex = ValueNotifier(-1);

  final List<String> faqCategories = [
    "General",
    "Account",
    "Service",
    "Payment",
    "Subscription",
    "Other",
  ];

  Map<int, List<Map<String, String>>> get faqData => {
        0: [
          {
            'question': "What is Cinemix?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "How to use Cinemix?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
        ],
        1: [
          {
            'question': "How do i can any order?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "Can i get a discount on my order?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "Why Can't i make payment?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "Can i split the payment?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. m",
          },
        ],
        2: [
          {
            'question': "How do i can any order?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "Can i get a discount on my order?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "Why Can't i make payment?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "Can i split the payment?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. m",
          },
        ],
        3: [
          {
            'question': "How do i can any order?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "Can i get a discount on my order?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "Why Can't i make payment?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "Can i split the payment?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. m",
          },
        ],
        4: [
          {
            'question': "How do i can any order?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "Can i get a discount on my order?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "Why Can't i make payment?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "Can i split the payment?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. m",
          },
        ],
        5: [
          {
            'question': "How do i can any order?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "Can i get a discount on my order?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "Why Can't i make payment?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "Can i split the payment?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. m",
          },
        ],
      };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: widget.currentIndex);
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
                title: Languages.of(context).txtHelpAndSupport,
              ),
              _tabBarView(),
              _tabsView(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tabBarView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: IgnorePointer(
        ignoring: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _tabController.index = 0;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  decoration: BoxDecoration(
                    color: _tabController.index == 0 ? CustomAppColor.of(context).primary : CustomAppColor.of(context).btnGrey,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 12.setHeight,
                  ),
                  child: CommonText(
                    text: Languages.of(context).txtFAQ,
                    fontSize: 14.setFontSize,
                    fontFamily: Constant.fontFamilyClashDisplayMedium500,
                    textColor: _tabController.index == 0 ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtBlack,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.setWidth),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _tabController.index = 1;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  decoration: BoxDecoration(
                    color: _tabController.index == 1 ? CustomAppColor.of(context).primary : CustomAppColor.of(context).btnGrey,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 12.setHeight,
                  ),
                  child: CommonText(
                    text: Languages.of(context).txtContactUs.toUpperCase(),
                    fontSize: 14.setFontSize,
                    fontFamily: Constant.fontFamilyClashDisplayMedium500,
                    textColor: _tabController.index == 1 ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtBlack,
                  ),
                ),
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
        physics: NeverScrollableScrollPhysics(),
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
                _faqCategoriesView(),
                SizedBox(height: 15.setHeight),
                CommonTextFormFieldWithPrefix(
                  controller: TextEditingController(),
                  hintText: "Search...",
                  radius: 12,
                  prefixIcon: AppAssets.icSearch,
                ),
                SizedBox(height: 10.setHeight),
                _faqQuestionsAndAnswersView(),
              ],
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(
              top: 25.setHeight,
              bottom: MediaQuery.of(context).padding.bottom + 10.setHeight,
              left: 15.setWidth,
              right: 15.setWidth,
            ),
            child: Wrap(
              spacing: 15.setWidth,
              runSpacing: 15.setHeight,
              children: [
                _itemContactUsView(title: "Customer Service", image: AppAssets.icCustomer),
                _itemContactUsView(title: "Whatsapp", image: AppAssets.icWhatsapp),
                _itemContactUsView(title: "Facebook", image: AppAssets.icFacebook),
                _itemContactUsView(title: "Website", image: AppAssets.icGlobal),
                _itemContactUsView(title: "Twitter", image: AppAssets.icTwitter),
                _itemContactUsView(title: "Instagram", image: AppAssets.icInstagram),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _faqCategoriesView() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          faqCategories.length,
          (index) => ValueListenableBuilder(
            valueListenable: selectedFAQCategory,
            builder: (context, value, child) {
              return InkWell(
                splashColor: CustomAppColor.of(context).transparent,
                highlightColor: CustomAppColor.of(context).transparent,
                onTap: () {
                  selectedFAQCategory.value = index;
                  expandedFAQIndex.value = -1;
                },
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 5.setWidth),
                      padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
                      alignment: Alignment.center,
                      child: CommonText(
                        text: faqCategories[index],
                        fontSize: 15.setFontSize,
                        fontFamily: Constant.fontFamilyClashGroteskMedium500,
                        textColor: value == index ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtGray,
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      height: value == index ? 2.setHeight : 0,
                      width: 25.setWidth,
                      child: Icon(
                        Icons.arrow_drop_up_rounded,
                        color: value == index ? CustomAppColor.of(context).primary : Colors.transparent,
                      ),
                    ),
                    SizedBox(height: 15.setHeight)
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  _faqQuestionsAndAnswersView() {
    return ValueListenableBuilder(
      valueListenable: selectedFAQCategory,
      builder: (context, selectedCategory, child) {
        final faqs = faqData[selectedCategory] ?? [];
        return Container(
          margin: EdgeInsets.only(top: 10.setHeight),
          child: ListView.builder(
            itemCount: faqs.length,
            padding: EdgeInsets.symmetric(horizontal: 0.setWidth),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _itemFAQView(
                question: faqs[index]['question'] ?? '',
                answer: faqs[index]['answer'] ?? '',
                index: index,
              );
            },
          ),
        );
      },
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
                  padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 8.setHeight),
                  decoration: BoxDecoration(
                    color: isExpanded ? CustomAppColor.of(context).primary : CustomAppColor.of(context).btnGrey,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10),
                      bottom: Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: CommonText(
                          text: question,
                          fontSize: 14.setFontSize,
                          textColor: isExpanded ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtBlack,
                          fontFamily: Constant.fontFamilyClashDisplayMedium500,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(width: 10.setWidth),
                      AnimatedRotation(
                        turns: isExpanded ? 0.50 : 0.0,
                        duration: const Duration(milliseconds: 300),
                        child: Icon(
                          Icons.arrow_drop_down_rounded,
                          color: isExpanded ? CustomAppColor.of(context).white : CustomAppColor.of(context).icBlackWhite,
                          size: 30,
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
                        padding: const EdgeInsets.all(12),
                        alignment: Alignment.topLeft,
                        child: CommonText(
                          text: answer,
                          fontSize: 13.setFontSize,
                          fontFamily: Constant.fontFamilyClashGroteskMedium500,
                          textColor: CustomAppColor.of(context).txtLightGrey,
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
    double itemWidth = (MediaQuery.of(context).size.width - 15.setWidth * 2 - 15.setWidth) / 2;

    return Container(
      width: itemWidth,
      padding: EdgeInsets.symmetric(vertical: 12.setHeight, horizontal: 12.setWidth),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScreen,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
          width: 0.5,
        ),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CustomAppColor.of(context).btnGrey,
            ),
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              image,
              height: 18.setHeight,
              width: 18.setHeight,
            ),
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: title,
            fontSize: 15.setFontSize,
            fontFamily: Constant.fontFamilyClashGroteskMedium500,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }

  Widget faqItemView({required String title, required String image}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 25.setHeight),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            height: 35.setHeight,
            width: 35.setHeight,
            color: CustomAppColor.of(context).primary,
          ),
          SizedBox(height: 8.setHeight),
          CommonText(
            text: title,
            fontSize: 16.setFontSize,
            fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.center,
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
