import 'dart:io';

import 'package:car_shop_screens_app_package/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class HelpCenterScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const HelpCenterScreen());
  }

  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> with TickerProviderStateMixin implements TopBarClickListener {
  late TabController _tabController;
  late TabController _tabControllerFaq;

  int selectedFaqIndex = 0;

  List<String> tabListFaq = ["General", "Payment", "Account", "Service", "Return", "Refund", "Shipping", "Other"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabControllerFaq = TabController(length: tabListFaq.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
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
              title: Languages.of(context).txtHelpCenter,
              isShowBack: true,
            ),
            // Tab Bar
            TabBar(
              controller: _tabController,
              isScrollable: false,
              labelColor: CustomAppColor.of(context).tabSelectedTxtColor2,
              unselectedLabelColor: CustomAppColor.of(context).tabTxtColor2,
              labelStyle: TextStyle(
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w600,
                fontFamily: Constant.fontFamily,
                color: CustomAppColor.of(context).tabSelectedTxtColor2,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w400,
                fontFamily: Constant.fontFamily,
                color: CustomAppColor.of(context).tabTxtColor2,
              ),
              indicatorWeight: 2,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: CustomAppColor.of(context).primary,
              indicatorPadding: EdgeInsets.only(
                top: Platform.isAndroid ? 35.setHeight : 40.setHeight,
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.setWidth),
              indicator: BoxDecoration(
                gradient: CustomAppColor.of(context).primaryGradient,
                borderRadius: BorderRadius.circular(10),
              ),
              tabs: [
                Tab(text: Languages.of(context).txtFaq),
                Tab(text: Languages.of(context).txtContactUs),
              ],
            ),
            // Tab Bar View
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildFaqList(),
                  _buildContactUsList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFaqList() {
    return Column(
      children: [
        SizedBox(height: 20.setHeight),
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
          labelColor: CustomAppColor.of(context).tabSelectedTxtColor2,
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
                gradient: selectedFaqIndex == index ? CustomAppColor.of(context).primaryGradient : null,
                border: selectedFaqIndex == index
                    ? null
                    : Border.all(
                        color: CustomAppColor.of(context).txtGray,
                        width: 0.5,
                      ),
              ),
              height: 35.setHeight,
              padding: EdgeInsets.symmetric(
                horizontal: 20.setWidth,
              ),
              child: CommonText(
                text: tabListFaq[index],
                textColor: selectedFaqIndex == index ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtGray,
                fontSize: 14.setFontSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SizedBox(height: 10.setHeight),
        _buildSearchBar(),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              left: 20.setWidth,
              right: 20.setWidth,
              bottom: 30.setHeight,
              top: 10.setHeight,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.setWidth),
                border: Border.all(
                  color: CustomAppColor.of(context).containerBorder,
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  // FAQ Items
                  _buildFAQItem(
                    question: Languages.of(context).txtIsItFreeToSellMyCarInNewYork,
                    answer: Languages.of(context).txtLoremIpsum,
                    isExpanded: true, // First item expanded by default
                  ),

                  _buildFAQItem(
                    question: Languages.of(context).txtWhatHappensIfIReceiveMultipleOffersForMyCar,
                    answer: Languages.of(context).txtYouCanChooseTheBestOfferThatSuitsYourNeedsWeLLHelpYouCompareAllOffers,
                    isExpanded: false,
                  ),

                  _buildFAQItem(
                    question: Languages.of(context).txtAmIObligatedToAcceptAnyOffersIReceive,
                    answer: Languages.of(context).txtNoYouAreNotObligatedToAcceptAnyOfferYouHaveCompleteControlOverTheSellingProcess,
                    isExpanded: false,
                  ),

                  _buildFAQItem(
                    question: Languages.of(context).txtWhatIfIChangeMyMindAboutSellingMyCar,
                    answer: Languages.of(context).txtYouCanWithdrawYourCarFromThePlatformAtAnyTimeBeforeAcceptingAnOffer,
                    isExpanded: false,
                  ),

                  _buildFAQItem(
                    question: Languages.of(context).txtIsMyPersonalInformationSecureOnThePlatform,
                    answer: Languages.of(context).txtYesWeUseIndustryStandardSecurityMeasuresToProtectYourPersonalInformation,
                    isExpanded: false,
                  ),

                  _buildFAQItem(
                    question: Languages.of(context).txtHowLongDoesItTakeToSellMyCar,
                    answer: Languages.of(context).txtTypicallyItTakes2448HoursToReceiveOffersOnceYourCarIsListedOnOurPlatform,
                    isExpanded: false,
                  ),

                  _buildFAQItem(
                    question: Languages.of(context).txtWhatHappensIfMyCarDoesntSell,
                    answer: Languages.of(context).txtIfYourCarDoesntReceiveOffersWeLLProvideSuggestionsToImproveYourListingOrHelpYouAdjustThePrice,
                    isExpanded: false,
                  ),

                  _buildFAQItem(
                    question: Languages.of(context).txtIAmADealerWithAFleetOfCarsCanIGetABetterDeal,
                    answer: Languages.of(context).txtYesWeOfferSpecialDealerProgramsWithBetterRatesForFleetSalesContactOurBusinessTeamForMoreDetails,
                    isExpanded: false,
                    isLast: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFAQItem({
    required String question,
    required String answer,
    required bool isExpanded,
    bool isLast = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.setHeight),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : Border(
                bottom: BorderSide(
                  color: CustomAppColor.of(context).containerBorder,
                  width: 0.5,
                ),
              ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: ExpansionTile(
          initiallyExpanded: isExpanded,
          tilePadding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 0.setHeight),
          childrenPadding: EdgeInsets.only(
            left: 16.setWidth,
            right: 16.setWidth,
            bottom: 16.setHeight,
            top: 0.setHeight,
          ),
          onExpansionChanged: (value) {
            setState(() {
              isExpanded = value;
            });
          },
          title: CommonText(
            text: question,
            fontSize: 12.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtBlack,
            maxLines: 2,
            textAlign: TextAlign.left,
          ),
          trailing: Icon(
            Icons.arrow_drop_down_rounded,
            color: CustomAppColor.of(context).txtBlack,
            size: 24.setWidth,
          ),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: CommonText(
                text: answer,
                fontSize: 10.setFontSize,
                fontWeight: FontWeight.w400,
                textColor: CustomAppColor.of(context).txtBlack,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 15.setHeight),
      padding: EdgeInsets.symmetric(horizontal: 5.setWidth),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgSearchBar,
        borderRadius: BorderRadius.circular(1000),
      ),
      child: TextField(
        controller: TextEditingController(),
        onChanged: (value) {
          // _filterLanguages(value);
        },
        decoration: InputDecoration(
          hintText: Languages.of(context).txtSearch,
          hintStyle: TextStyle(
            color: CustomAppColor.of(context).txtGray,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: CustomAppColor.of(context).txtGray,
            size: 20.setWidth,
          ),
          suffixIcon: InkWell(
            onTap: () {
              // _searchController.clear();
              // _filterLanguages("");
            },
            child: Icon(
              Icons.close,
              color: CustomAppColor.of(context).txtGray,
              size: 20.setWidth,
            ),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12.setHeight),
        ),
        style: TextStyle(
          color: CustomAppColor.of(context).txtBlack,
          fontSize: 14.setFontSize,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildContactUsList() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
      child: Column(
        children: [
          _buildContactItem(
            icon: AppAssets.icCustomerService,
            title: Languages.of(context).txtCustomerService,
            iconColor: CustomAppColor.of(context).txtBlack,
            onTap: () {
              // Handle customer service contact
              _handleContactAction("customer_service");
            },
          ),
          _buildContactItem(
            icon: AppAssets.icWp,
            title: Languages.of(context).txtWhatsapp,
            onTap: () {
              // Handle WhatsApp contact
              _handleContactAction("whatsapp");
            },
          ),
          _buildContactItem(
            icon: AppAssets.icWebsite,
            title: Languages.of(context).txtWebsite,
            onTap: () {
              // Handle website visit
              _handleContactAction("website");
            },
          ),
          _buildContactItem(
            icon: AppAssets.icFb,
            title: Languages.of(context).txtFacebook,
            onTap: () {
              // Handle Facebook contact
              _handleContactAction("facebook");
            },
          ),
          _buildContactItem(
            icon: AppAssets.icTwitter,
            title: Languages.of(context).txtTwitter,
            onTap: () {
              // Handle Twitter contact
              _handleContactAction("twitter");
            },
          ),
          _buildContactItem(
            icon: AppAssets.icInstagram,
            title: Languages.of(context).txtInstagram,
            onTap: () {
              // Handle Instagram contact
              _handleContactAction("instagram");
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem({
    required String icon,
    required String title,
    Color? iconColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 15.setHeight),
        padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 15.setHeight),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgSearchBar,
          borderRadius: BorderRadius.circular(15.setWidth),
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 20.setWidth,
              height: 20.setHeight,
              color: iconColor,
            ),
            SizedBox(width: 15.setWidth),
            Expanded(
              child: CommonText(
                text: title,
                fontSize: 14.setFontSize,
                fontWeight: FontWeight.w500,
                textColor: CustomAppColor.of(context).txtBlack,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleContactAction(String action) {
    // Handle different contact actions
    switch (action) {
      case "customer_service":
        // Open phone dialer or show customer service options
        /*Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CustomerService()),
        );*/
        break;
      case "whatsapp":
        // Open WhatsApp
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Opening WhatsApp...")),
        );
        break;
      case "website":
        // Open website
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Opening Website...")),
        );
        break;
      case "facebook":
        // Open Facebook page
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Opening Facebook...")),
        );
        break;
      case "twitter":
        // Open Twitter profile
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Opening Twitter...")),
        );
        break;
      case "instagram":
        // Open Instagram profile
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Opening Instagram...")),
        );
        break;
    }
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
