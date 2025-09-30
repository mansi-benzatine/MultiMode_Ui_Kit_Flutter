import 'package:flutter/material.dart';
import 'package:furniture_app_package/ui/chat/views/chat_screen.dart';
import 'package:furniture_app_package/ui/faq_details/views/faq_details_screen.dart';
import 'package:furniture_app_package/utils/sizer_utils.dart';
import 'package:furniture_app_package/widgets/text_field/text_form_field.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

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
  ValueNotifier<int> selectedFAQCategory = ValueNotifier(0);
  final List<Map<String, String>> faqItems = [
    {"title": "About Family", "icon": AppAssets.icHelpCenter},
    {"title": "How To Use", "icon": AppAssets.icHelpCenter},
    {"title": "Payments", "icon": AppAssets.icPaymentMethod},
    {"title": "Offers & Promo", "icon": AppAssets.icDiscount},
    {"title": "My Orders", "icon": AppAssets.icShoppingCart},
    {"title": "My Account", "icon": AppAssets.icUser},
  ];

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
          // General
          {
            'question': "What is Furnify?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "How to use furnify?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
        ],
        1: [
          {
            'question': "How do i can any order?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "Can i get a discount on my order?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "Why Can't i make payment?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "Can i split the payment?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. m",
          },
        ],
        2: [
          {
            'question': "How do i can any order?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "Can i get a discount on my order?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "Why Can't i make payment?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "Can i split the payment?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. m",
          },
        ],
        3: [
          {
            'question': "How do i can any order?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "Can i get a discount on my order?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "Why Can't i make payment?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "Can i split the payment?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. m",
          },
        ],
        4: [
          {
            'question': "How do i can any order?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "Can i get a discount on my order?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "Why Can't i make payment?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "Can i split the payment?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. m",
          },
        ],
        5: [
          {
            'question': "How do i can any order?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "Can i get a discount on my order?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "Why Can't i make payment?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. ",
          },
          {
            'question': "Can i split the payment?",
            'answer': "Lorem Ipsum is simply dummy text of the printing a  typesetting industry. Lorem Ipsum is simply dummy text of the printing  typesetting industry. m",
          },
        ],
      };

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
              _tabBarView(),
              _tabsView(),
            ],
          ),
        ],
      ),
    );
  }

  _tabBarView() {
    return TabBar(
      controller: _tabController,
      padding: EdgeInsets.only(left: 15.setWidth, right: 15.setWidth),
      dividerHeight: 1,
      dividerColor: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: CustomAppColor.of(context).primary,
      indicatorWeight: 3,
      overlayColor: WidgetStateProperty.all(CustomAppColor.of(context).transparent),
      tabs: [
        Tab(
          child: CommonText(
            text: Languages.of(context).txtFAQ,
            fontSize: 16.setFontSize,
            fontFamily: _tabController.index == 0 ? Constant.fontFamilyBold700 : Constant.fontFamilySemiBold600,
            textColor: _tabController.index == 0 ? CustomAppColor.of(context).txtPrimary : CustomAppColor.of(context).txtBlack,
          ),
        ),
        Tab(
          child: CommonText(
            text: Languages.of(context).txtContactUs,
            fontSize: 16.setFontSize,
            fontFamily: _tabController.index == 1 ? Constant.fontFamilyBold700 : Constant.fontFamilySemiBold600,
            textColor: _tabController.index == 1 ? CustomAppColor.of(context).txtPrimary : CustomAppColor.of(context).txtBlack,
          ),
        ),
      ],
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
                _faqCategoriesView(),
                SizedBox(height: 20.setHeight),
                CommonTextFormFieldWithPrefix(
                  controller: TextEditingController(),
                  hintText: "Search...",
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
            child: Column(
              children: [
                _itemContactUsView(title: "Customer Service", image: AppAssets.icCustomerService),
                _itemContactUsView(title: "Whatsapp", image: AppAssets.imgWhatsapp),
                _itemContactUsView(title: "Facebook", image: AppAssets.imgFacebook),
                _itemContactUsView(title: "Website", image: AppAssets.icGoogle),
                _itemContactUsView(title: "Twitter", image: AppAssets.imgTwitter),
                _itemContactUsView(title: "Instagram", image: AppAssets.imgInstagram),
                _itemContactUsView(title: "Telegram", image: AppAssets.imgTelegram),
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
                child: Container(
                  height: 40.setHeight,
                  margin: EdgeInsets.only(right: 10.setWidth),
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                  decoration: BoxDecoration(
                    color: value == index ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgScreen,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: value == index ? CustomAppColor.of(context).primary : CustomAppColor.of(context).dividerColor,
                      width: 0.5,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: CommonText(
                    text: faqCategories[index],
                    fontSize: 14.setFontSize,
                    fontWeight: value == index ? FontWeight.w700 : FontWeight.w500,
                    fontFamily: value == index ? Constant.fontFamilySemiBold600 : Constant.fontFamilyMedium500,
                    textColor: value == index ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtGray,
                  ),
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
          margin: EdgeInsets.only(top: 20.setHeight),
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
                      color: isExpanded ? CustomAppColor.of(context).primary : CustomAppColor.of(context).containerBg,
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
                            textColor: isExpanded ? CustomAppColor.of(context).white : CustomAppColor.of(context).icBlackWhite,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(width: 10.setWidth),
                        AnimatedRotation(
                          turns: isExpanded ? 0.5 : 0,
                          duration: const Duration(milliseconds: 300),
                          child: Image.asset(
                            AppAssets.icArrow,
                            height: 16.setHeight,
                            width: 16.setHeight,
                            color: isExpanded ? CustomAppColor.of(context).white : CustomAppColor.of(context).icBlackWhite,
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

  _itemContactUsView({required String title, required String image}) {
    return InkWell(
      highlightColor: CustomAppColor.of(context).transparent,
      splashColor: CustomAppColor.of(context).transparent,
      onTap: () {
        if (title == "Customer Service") Navigator.push(context, ChatScreen.route());
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 5.setHeight),
        child: Container(
          margin: EdgeInsets.only(bottom: 12.setHeight),
          padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 15.setHeight),
          decoration: BoxDecoration(
            color: (title == "Customer Service") ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgScreen,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: (title == "Customer Service") ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
              width: (title == "Customer Service") ? 1 : 0.5,
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                image,
                height: 20.setHeight,
                width: 20.setHeight,
              ),
              SizedBox(width: 10.setWidth),
              Expanded(
                child: CommonText(
                  text: title,
                  fontSize: 16.setFontSize,
                  fontFamily: (title == "Customer Service") ? Constant.fontFamilyBold700 : Constant.fontFamilySemiBold600,
                  textColor: (title == "Customer Service") ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget faqItemView({required String title, required String image}) {
    return InkWell(
      onTap: () {
        Navigator.push(context, FaqDetailsScreen.route(title: title));
      },
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
              fontFamily: Constant.fontFamilyBold700,
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
