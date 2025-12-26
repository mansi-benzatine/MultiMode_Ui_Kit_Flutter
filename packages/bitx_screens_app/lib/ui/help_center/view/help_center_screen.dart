import 'package:bitx_screens_app/utils/app_color.dart';
import 'package:bitx_screens_app/utils/sizer_utils.dart';
import 'package:bitx_screens_app/widgets/text_field/text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

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
  late TextEditingController searchController;

  ValueNotifier<int> expandedFAQIndex = ValueNotifier(-1);

  List<Map<String, String>> get searchFaqData {
    var list = faqData;

    if (searchController.text.isNotEmpty) {
      list = list
          .where(
            (e) => e["question"]!.toLowerCase().contains(searchController.text.toLowerCase()),
          )
          .toList();
    }

    return list;
  }

  List<Map<String, String>> get faqData => [
        {
          'question': "What is Cryptocoin?",
          'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
        },
        {
          'question': "How to use Cryptocoin?",
          'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
        },
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
      ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.currentIndex,
    );
    _tabController.addListener(
      () {
        setState(() {});
      },
    );

    searchController = TextEditingController();

    searchController.addListener(() {
      setState(() {});
    });
  }

  void onChanged(String value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Column(
              children: [
                TopBar(
                  this,
                  isShowBack: true,
                  title: Languages.of(context).txtHelpCenter,
                ),
                _tabBarView(),
                _tabsView(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _tabBarView() {
    return IgnorePointer(
      ignoring: true,
      child: TabBar(
        controller: _tabController,
        dividerColor: CustomAppColor.of(context).bgScreen,
        indicatorColor: CustomAppColor.of(context).bgScreen,
        indicator: BoxDecoration(color: CustomAppColor.of(context).bgScreen),
        overlayColor: WidgetStateProperty.all(CustomAppColor.of(context).transparent),
        tabs: [
          IgnorePointer(
            ignoring: true,
            child: Tab(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: _tabController.index == 0 ? CustomAppColor.of(context).primary : null,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: CustomAppColor.of(context).border),
                  gradient: _tabController.index == 0 ? null : CustomAppColor.of(context).linearGradiant,
                ),
                child: CommonText(
                  text: Languages.of(context).txtFaq,
                  fontSize: 16.setFontSize,
                  fontWeight: _tabController.index == 0 ? FontWeight.w700 : FontWeight.w600,
                  textColor: _tabController.index == 0 ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtBlack,
                ),
              ),
            ),
          ),
          IgnorePointer(
            ignoring: true,
            child: Tab(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: _tabController.index == 1 ? CustomAppColor.of(context).primary : null,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: CustomAppColor.of(context).border),
                  gradient: _tabController.index == 1 ? null : CustomAppColor.of(context).linearGradiant,
                ),
                child: CommonText(
                  text: Languages.of(context).txtContactUs,
                  fontSize: 16.setFontSize,
                  fontWeight: _tabController.index == 1 ? FontWeight.w700 : FontWeight.w600,
                  textColor: _tabController.index == 1 ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtBlack,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _tabsView() {
    return Expanded(
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
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
                CommonTextFormField(
                  controller: searchController,
                  hintText: "Search..",
                  borderColor: CustomAppColor.of(context).iconTextFormFeild,
                  fillColor: CustomAppColor.of(context).bgScreen,
                  prefixIcon: AppAssets.icSearch,
                  onTextChanged: (p0) => onChanged(p0),
                ),
                _faqQuestionsAndAnswersView(),
              ],
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(
              top: 10.setHeight,
              bottom: MediaQuery.of(context).padding.bottom + 10.setHeight,
            ),
            child: Column(
              children: [
                Wrap(
                  runSpacing: 12.setHeight,
                  spacing: 12.setWidth,
                  children: [
                    _itemContactUsView(title: "Customer Service", image: AppAssets.icCustomerService),
                    _itemContactUsView(title: "Whatsapp", image: AppAssets.icWhatsapp),
                    _itemContactUsView(title: "Facebook", image: AppAssets.icFacebook),
                    _itemContactUsView(title: "Website", image: AppAssets.icGoogle),
                    _itemContactUsView(title: "Twitter", image: AppAssets.icTwitter),
                    _itemContactUsView(title: "Instagram", image: AppAssets.icInstagram),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _faqQuestionsAndAnswersView() {
    return Container(
      margin: EdgeInsets.only(top: 20.setHeight),
      child: searchFaqData.isNotEmpty
          ? ListView.builder(
              itemCount: searchFaqData.length,
              padding: EdgeInsets.symmetric(horizontal: 0.setWidth),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _itemFAQView(
                  question: searchFaqData[index]["question"] ?? '',
                  answer: searchFaqData[index]['answer'] ?? '',
                  index: index,
                );
              },
            )
          : emptyListView(),
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
              border: Border.all(color: CustomAppColor.of(context).bgCard, width: 2),
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
                      gradient: !isExpanded
                          ? LinearGradient(
                              colors: [
                                const Color(0xFFCFD7FB),
                                const Color(0xFFCFD7FB).withValues(alpha: 0.3),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            )
                          : null,
                      color: isExpanded ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgCard,
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
                            fontWeight: FontWeight.w600,
                            textColor: isExpanded ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtBlack,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(width: 10.setWidth),
                        AnimatedRotation(
                          turns: isExpanded ? 0.75 : 0.25,
                          duration: const Duration(milliseconds: 300),
                          child: Image.asset(
                            AppAssets.icArrowRight,
                            height: 16.setHeight,
                            width: 16.setHeight,
                            color: isExpanded ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtBlack,
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
                            fontFamily: Constant.fontFamily,
                            fontWeight: FontWeight.w500,
                            textColor: CustomAppColor.of(context).txtBlack,
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

  Widget emptyListView() {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 50.setHeight),
          Image.asset(
            AppAssets.imgMarketEmpty,
            height: 220.setHeight,
            width: 220.setWidth,
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: Languages.of(context).txtSearchNotFound,
            fontWeight: FontWeight.w600,
            fontSize: 20.setFontSize,
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: Languages.of(context).txtSearchNotFoundSub,
            fontSize: 13.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtGray,
          ),
        ],
      ),
    );
  }

  _itemContactUsView({required String title, required String image}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 0.screenWidth / 2.4,
        padding: EdgeInsets.symmetric(vertical: 16.setHeight),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: CustomAppColor.of(context).border,
          ),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomAppColor.of(context).icRoundBg,
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                image,
                color: image == AppAssets.icCustomerService ? CustomAppColor.of(context).txtBlack : null,
                height: 20.setHeight,
                width: 20.setHeight,
              ),
            ),
            SizedBox(height: 15.setHeight),
            CommonText(
              text: title,
              fontSize: 14.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).txtBlack,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }

  Widget faqItemView({required String title, required String image}) {
    return InkWell(
      onTap: () {},
      child: Container(
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
              fontWeight: FontWeight.w700,
              textColor: CustomAppColor.of(context).txtBlack,
              textAlign: TextAlign.center,
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
