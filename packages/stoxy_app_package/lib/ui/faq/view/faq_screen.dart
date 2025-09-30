import 'package:flutter/material.dart';
import 'package:stoxy_app_package/utils/app_color.dart';
import 'package:stoxy_app_package/utils/sizer_utils.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> with TickerProviderStateMixin implements TopBarClickListener {
  late TabController _tabControllerFaq;
  int selectedFaqIndex = 0;

  // Track which FAQ items are expanded

  List<String> tabListFaq = ["General", "Payment", "Account", "Service", "Return", "Refund", "Shipping", "Other"];

  @override
  void initState() {
    super.initState();
    _tabControllerFaq = TabController(length: tabListFaq.length, vsync: this);
  }

  @override
  void dispose() {
    _tabControllerFaq.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtFaq,
              isShowBack: true,
            ),
            SizedBox(height: 10.setHeight),
            TabBar(
              controller: _tabControllerFaq,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(25.setWidth),
                color: CustomAppColor.of(context).transparent,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.zero,
              dividerColor: Colors.transparent,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              labelPadding: EdgeInsets.only(right: 10.setWidth),
              padding: EdgeInsets.only(
                left: 16.setWidth,
              ),
              labelColor: CustomAppColor.of(context).txtBlack,
              onTap: (index) {
                setState(() {
                  selectedFaqIndex = index;
                  _tabControllerFaq.animateTo(index);
                });
              },
              tabs: List.generate(
                tabListFaq.length,
                (index) => Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.setWidth),
                    color: selectedFaqIndex == index ? CustomAppColor.of(context).primary : null,
                    border: selectedFaqIndex == index
                        ? null
                        : Border.all(
                            color: CustomAppColor.of(context).primary,
                            width: 1,
                          ),
                  ),
                  height: 40.setHeight,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.setWidth,
                  ),
                  child: CommonText(
                    text: tabListFaq[index],
                    textColor: selectedFaqIndex == index ? CustomAppColor.of(context).txtRoundTabSelected : CustomAppColor.of(context).primary,
                    fontSize: 16.setFontSize,
                    fontWeight: selectedFaqIndex == index ? FontWeight.w700 : FontWeight.w400,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  left: 20.setWidth,
                  right: 20.setWidth,
                  bottom: 30.setHeight,
                  top: 10.setHeight,
                ),
                /*    child: Column(
                  children: [
                    // FAQ Items
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          // If the tapped item is already expanded, collapse it by setting
                          // the expanded index to -1. Otherwise, expand the tapped item.
                          _expandedIndex = _expandedIndex == 0 ? -1 : 0;
                        });
                      },
                      child: _buildFAQItem(
                        question: Languages.of(context).txtWhatisMusify,
                        answer: Languages.of(context).txtLoremIpsum,
                        isExpanded: _expandedIndex == 0,
                        index: 0,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          // If the tapped item is already expanded, collapse it by setting
                          // the expanded index to -1. Otherwise, expand the tapped item.
                          _expandedIndex = _expandedIndex == 1 ? -1 : 1;
                        });
                      },
                      child: _buildFAQItem(
                        question: Languages.of(context).txtHowToUseMusify,
                        answer: Languages.of(context).txtLoremIpsumShort,
                        isExpanded: _expandedIndex == 1,
                        index: 1,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          // If the tapped item is already expanded, collapse it by setting
                          // the expanded index to -1. Otherwise, expand the tapped item.
                          _expandedIndex = _expandedIndex == 2 ? -1 : 2;
                        });
                      },
                      child: _buildFAQItem(
                        question: Languages.of(context).txtHowDoICanUpgradePremium,
                        answer: Languages.of(context).txtLoremIpsumShort,
                        isExpanded: _expandedIndex == 2,
                        index: 2,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          // If the tapped item is already expanded, collapse it by setting
                          // the expanded index to -1. Otherwise, expand the tapped item.
                          _expandedIndex = _expandedIndex == 3 ? -1 : 3;
                        });
                      },
                      child: _buildFAQItem(
                        question: Languages.of(context).txtCanIGetADiscountAtCheckout,
                        answer: Languages.of(context).txtLoremIpsumShort,
                        isExpanded: _expandedIndex == 3,
                        index: 3,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          // If the tapped item is already expanded, collapse it by setting
                          // the expanded index to -1. Otherwise, expand the tapped item.
                          _expandedIndex = _expandedIndex == 4 ? -1 : 4;
                        });
                      },
                      child: _buildFAQItem(
                        question: Languages.of(context).txtWhyCanTICanMakeAPayment,
                        answer: Languages.of(context).txtLoremIpsumShort,
                        isExpanded: _expandedIndex == 4,
                        index: 4,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          // If the tapped item is already expanded, collapse it by setting
                          // the expanded index to -1. Otherwise, expand the tapped item.
                          _expandedIndex = _expandedIndex == 5 ? -1 : 5;
                        });
                      },
                      child: _buildFAQItem(
                        question: Languages.of(context).txtWhatAreFeaturesInMusify,
                        answer: Languages.of(context).txtLoremIpsumShort,
                        isExpanded: _expandedIndex == 5,
                        index: 5,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          // If the tapped item is already expanded, collapse it by setting
                          // the expanded index to -1. Otherwise, expand the tapped item.
                          _expandedIndex = _expandedIndex == 6 ? -1 : 6;
                        });
                      },
                      child: _buildFAQItem(
                        question: Languages.of(context).txtWhatIsCreditRefund,
                        answer: Languages.of(context).txtLoremIpsumShort,
                        isExpanded: _expandedIndex == 6,
                        index: 6,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          // If the tapped item is already expanded, collapse it by setting
                          // the expanded index to -1. Otherwise, expand the tapped item.
                          _expandedIndex = _expandedIndex == 7 ? -1 : 7;
                        });
                      },
                      child: _buildFAQItem(
                        question: Languages.of(context).txtHowToFindMissingMusic,
                        answer: Languages.of(context).txtLoremIpsumShort,
                        isExpanded: _expandedIndex == 7,
                        index: 7,
                        isLast: true,
                      ),
                    ),
                  ],
                ),*/
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
