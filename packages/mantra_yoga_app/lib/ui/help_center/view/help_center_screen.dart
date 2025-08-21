import 'package:flutter/material.dart';
import 'package:mantra_yoga_app_package/utils/sizer_utils.dart';

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
            'question': Languages.of(context).txtWhatIsMantraYoga,
            'answer': Languages.of(context).txtLoremIpsum,
          },
          {
            'question': Languages.of(context).txtHowToUseMantraYoga,
            'answer': Languages.of(context).txtLoremIpsum,
          },
        ],
        1: [
          // Account
          {
            'question': Languages.of(context).txtWhatIsCreditRefund,
            'answer': Languages.of(context).txtLoremIpsum,
          },
          {
            'question': Languages.of(context).txtWhatIsCreditRefund,
            'answer': Languages.of(context).txtLoremIpsum,
          },
          {
            'question': Languages.of(context).txtWhatIsCreditRefund,
            'answer': Languages.of(context).txtLoremIpsum,
          },
          {
            'question': Languages.of(context).txtWhatIsCreditRefund,
            'answer': Languages.of(context).txtLoremIpsum,
          },
          {
            'question': Languages.of(context).txtWhatIsCreditRefund,
            'answer': Languages.of(context).txtLoremIpsum,
          },
          {
            'question': Languages.of(context).txtWhatIsCreditRefund,
            'answer': Languages.of(context).txtLoremIpsum,
          },
          {
            'question': Languages.of(context).txtWhatIsCreditRefund,
            'answer': Languages.of(context).txtLoremIpsum,
          },
          {
            'question': Languages.of(context).txtWhatIsCreditRefund,
            'answer': Languages.of(context).txtLoremIpsum,
          },
          {
            'question': Languages.of(context).txtWhatIsCreditRefund,
            'answer': Languages.of(context).txtLoremIpsum,
          },
          {
            'question': Languages.of(context).txtWhatIsCreditRefund,
            'answer': Languages.of(context).txtLoremIpsum,
          },
          {
            'question': Languages.of(context).txtWhatIsCreditRefund,
            'answer': Languages.of(context).txtLoremIpsum,
          },
        ],
        2: [
          // Service
          {
            'question': Languages.of(context).txtHowToUseMantraYoga,
            'answer': Languages.of(context).txtLoremIpsum,
          },
        ],
        3: [
          // Payment
          {
            'question': Languages.of(context).txtHowDoICanUpgradePremium,
            'answer': Languages.of(context).txtLoremIpsum,
          },
          {
            'question': Languages.of(context).txtCanIGetADiscountAtCheckout,
            'answer': Languages.of(context).txtLoremIpsum,
          },
          {
            'question': Languages.of(context).txtWhyCantIMakeAPayment,
            'answer': Languages.of(context).txtLoremIpsum,
          },
          {
            'question': Languages.of(context).txtHowDoICanUpgradePremium,
            'answer': Languages.of(context).txtLoremIpsum,
          },
          {
            'question': Languages.of(context).txtCanIGetADiscountAtCheckout,
            'answer': Languages.of(context).txtLoremIpsum,
          },
          {
            'question': Languages.of(context).txtWhyCantIMakeAPayment,
            'answer': Languages.of(context).txtLoremIpsum,
          },
        ],
        4: [
          // Subscription
          {
            'question': Languages.of(context).txtHowDoICanUpgradePremium,
            'answer': Languages.of(context).txtLoremIpsum,
          },
        ],
        5: [
          // Other
          {
            'question': Languages.of(context).txtWhatIsMantraYoga,
            'answer': Languages.of(context).txtLoremIpsum,
          },
        ],
      };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
      labelStyle: TextStyle(
        fontSize: 14.setFontSize,
        fontWeight: FontWeight.w700,
        fontFamily: Constant.fontFamilyBold700,
        color: CustomAppColor.of(context).txtPrimary,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 14.setFontSize,
        fontWeight: FontWeight.w500,
        fontFamily: Constant.fontFamilyMedium500,
        color: CustomAppColor.of(context).txtBlack,
      ),
      overlayColor: WidgetStateProperty.all(CustomAppColor.of(context).transparent),
      tabs: [
        Tab(text: Languages.of(context).txtFAQ),
        Tab(text: Languages.of(context).txtContactUs),
      ],
    );
  }

  _tabsView() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 20.setHeight, bottom: MediaQuery.of(context).padding.bottom + 10.setHeight),
            child: Column(
              children: [
                _faqCategoriesView(),
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
                _itemContactUsView(title: Languages.of(context).txtCustomerService, image: AppAssets.icCustomerService),
                _itemContactUsView(title: Languages.of(context).txtWhatsapp, image: AppAssets.icWhatsapp),
                _itemContactUsView(title: Languages.of(context).txtFacebook, image: AppAssets.icFacebookHelpCenter),
                _itemContactUsView(title: Languages.of(context).txtWebsite, image: AppAssets.icWebsite),
                _itemContactUsView(title: Languages.of(context).txtTwitter, image: AppAssets.icTwitter),
                _itemContactUsView(title: Languages.of(context).txtInstagram, image: AppAssets.icInstagram),
                _itemContactUsView(title: Languages.of(context).txtTelegram, image: AppAssets.icTelegram),
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
      padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
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
                  expandedFAQIndex.value = -1; // Reset expanded FAQ when category changes
                },
                child: Container(
                  height: 40.setHeight,
                  margin: EdgeInsets.only(right: 10.setWidth),
                  padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
                  decoration: BoxDecoration(
                    color: value == index ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgScreen,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: value == index ? CustomAppColor.of(context).borderColor : CustomAppColor.of(context).txtLightGray,
                      width: 1.5,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: CommonText(
                    text: faqCategories[index],
                    fontSize: 14.setFontSize,
                    fontWeight: value == index ? FontWeight.w700 : FontWeight.w500,
                    fontFamily: value == index ? Constant.fontFamilyBold700 : Constant.fontFamilyMedium500,
                    textColor: value == index ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtLightGray,
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
            padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
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
          margin: EdgeInsets.only(bottom: 12.setHeight),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgScreen,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: CustomAppColor.of(context).primary, width: 1.5),
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
                    color: isExpanded ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgScreen,
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
                          fontWeight: FontWeight.w600,
                          fontFamily: Constant.fontFamilySemiBold600,
                          textColor: isExpanded ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtPrimary,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(width: 10.setWidth),
                      AnimatedRotation(
                        turns: isExpanded ? 0.5 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: Image.asset(
                          AppAssets.icArrowDown,
                          height: 16.setHeight,
                          width: 16.setHeight,
                          color: isExpanded ? CustomAppColor.of(context).white : CustomAppColor.of(context).primary,
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
                        child: CommonText(
                          text: answer,
                          fontSize: 12.setFontSize,
                          fontWeight: FontWeight.w500,
                          fontFamily: Constant.fontFamilyMedium500,
                          textColor: CustomAppColor.of(context).txtDarkGray,
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
    return ValueListenableBuilder(
      valueListenable: selectedContactUs,
      builder: (context, value, child) {
        return InkWell(
          highlightColor: CustomAppColor.of(context).transparent,
          splashColor: CustomAppColor.of(context).transparent,
          onTap: () {
            selectedContactUs.value = title;
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 12.setHeight),
            padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 15.setHeight),
            decoration: BoxDecoration(
              color: (value == title) ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgScreen,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: (value == title) ? CustomAppColor.of(context).borderColor : CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
                width: (value == title) ? 3 : 1,
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
                    fontSize: 14.setFontSize,
                    fontWeight: (value == title) ? FontWeight.w700 : FontWeight.w500,
                    fontFamily: (value == title) ? Constant.fontFamilyBold700 : Constant.fontFamilyMedium500,
                    textColor: (value == title) ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtBlack,
                    textAlign: TextAlign.start,
                  ),
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
