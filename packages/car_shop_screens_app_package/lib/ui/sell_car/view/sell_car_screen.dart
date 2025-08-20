import 'package:car_shop_screens_app_package/utils/sizer_utils.dart';
import 'package:car_shop_screens_app_package/widgets/button/common_button.dart';
import 'package:car_shop_screens_app_package/widgets/text_field/text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../enter_car_detail/view/enter_car_detail_screen.dart';

class SellCarScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SellCarScreen());
  }

  const SellCarScreen({super.key});

  @override
  State<SellCarScreen> createState() => _SellCarScreenState();
}

class _SellCarScreenState extends State<SellCarScreen> implements TopBarClickListener {
  TextEditingController registrationNumberController = TextEditingController();

  List<Map<String, String>> sellCarInstructionList = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      sellCarInstructionList = [
        {
          "title": Languages.of(context).txtOnlinePriceEstimate,
          "img": AppAssets.icSellCarInst1,
        },
        {
          "title": Languages.of(context).txtFreeCarInspection,
          "img": AppAssets.icSellCarInst2,
        },
        {
          "title": Languages.of(context).txtCarAuctionBegins,
          "img": AppAssets.icSellCarInst3,
        },
        {
          "title": Languages.of(context).txtPickUpCarPayment,
          "img": AppAssets.icSellCarInst4,
        },
      ];
      setState(() {});
    });
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
              title: Languages.of(context).txtSellCar,
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      AppAssets.imgSellCarTop,
                      fit: BoxFit.contain,
                      width: 0.screenWidth,
                    ),
                    _buildSellCarForm(),
                    _sellCarInstruction(),
                    SizedBox(height: 20.setHeight),
                    _customerReview(),
                    Image.asset(
                      AppAssets.imgTrustedBySellers,
                      fit: BoxFit.contain,
                      width: 0.screenWidth,
                    ),
                    SizedBox(height: 20.setHeight),
                    _faq(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSellCarForm() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      margin: EdgeInsets.only(top: 30.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtEnterYourCarRegistrationNumber,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 15.setHeight),
          CommonTextFormField(
            controller: registrationNumberController,
            hintText: Languages.of(context).txtEnterCarNumber,
            labelText: Languages.of(context).txtCarNumber,
            borderColor: CustomAppColor.of(context).containerBorder,
            contentPadding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 12.setHeight),
            radius: 12.setWidth,
          ),
          SizedBox(height: 20.setHeight),
          IgnorePointer(
            ignoring: true,
            child: CommonButton(
              text: Languages.of(context).txtSellMyCar,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const EnterCarDetailScreen()));
              },
            ),
          ),
          SizedBox(height: 10.setHeight),
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: CustomAppColor.of(context).txtGray,
                  thickness: 0.35,
                  height: 20.setHeight,
                  indent: 50.setWidth,
                ),
              ),
              SizedBox(width: 15.setWidth),
              CommonText(
                text: Languages.of(context).txtOr,
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w400,
                textColor: CustomAppColor.of(context).txtGray,
              ),
              SizedBox(width: 15.setWidth),
              Expanded(
                child: Divider(
                  color: CustomAppColor.of(context).txtGray,
                  thickness: 0.35,
                  height: 20.setHeight,
                  endIndent: 50.setWidth,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const EnterCarDetailScreen()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 12.setHeight),
                child: CommonText(
                  text: Languages.of(context).txtEnterYourCarDetailsManually,
                  fontSize: 12.setFontSize,
                  fontWeight: FontWeight.w500,
                  textColor: CustomAppColor.of(context).compareBtnText,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _sellCarInstruction() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.setHeight),
      margin: EdgeInsets.only(top: 30.setHeight),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgSearchBar,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: CommonText(
              text: Languages.of(context).txtHowToSellYourCar,
              fontSize: 14.setFontSize,
              fontWeight: FontWeight.w500,
              textColor: CustomAppColor.of(context).txtBlack,
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 15.setHeight),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: Row(
              children: List.generate(sellCarInstructionList.length, (index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12.setWidth),
                  child: Container(
                    width: 130.setWidth,
                    height: 155.setHeight,
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).bgScreen,
                      borderRadius: BorderRadius.circular(12.setWidth),
                    ),
                    margin: EdgeInsets.only(right: 10.setWidth),
                    padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.asset(
                            sellCarInstructionList[index]["img"] ?? "",
                            fit: BoxFit.contain,
                          ),
                        ),
                        CommonText(
                          text: "0${index + 1}>",
                          fontSize: 10.setFontSize,
                          fontWeight: FontWeight.w600,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                        CommonText(
                          text: sellCarInstructionList[index]["title"] ?? "",
                          fontSize: 10.setFontSize,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.2,
                          textColor: CustomAppColor.of(context).txtBlack,
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 15.setHeight),
                      ],
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }

  Widget _customerReview() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          CommonText(
            text: Languages.of(context).txtCustomerReview,
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 10.setHeight),

          // Horizontal Review Cards
          SizedBox(
            height: 120.setHeight,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4, // Sample count
              itemBuilder: (context, index) {
                return Container(
                  width: 230.setWidth,
                  margin: EdgeInsets.only(right: 15.setWidth),
                  padding: EdgeInsets.all(16.setWidth),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.setWidth),
                    border: Border.all(
                      color: CustomAppColor.of(context).containerBorder,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // User Info Row
                      Row(
                        children: [
                          // Profile Image
                          Container(
                            width: 36.setWidth,
                            height: 36.setHeight,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: CustomAppColor.of(context).txtGray.withValues(alpha: 0.2),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                AppAssets.imgDummyGirl, // Using available dummy image
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: CustomAppColor.of(context).txtGray.withValues(alpha: 0.2),
                                    child: Icon(
                                      Icons.person,
                                      color: CustomAppColor.of(context).txtGray,
                                      size: 25.setWidth,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 12.setWidth),

                          // Name and Rating
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  text: "Jorj Liyon",
                                  fontSize: 12.setFontSize,
                                  fontWeight: FontWeight.w500,
                                  textColor: CustomAppColor.of(context).txtBlack,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: CustomAppColor.of(context).bgStar,
                                      size: 16.setWidth,
                                    ),
                                    SizedBox(width: 4.setWidth),
                                    CommonText(
                                      text: "5",
                                      fontSize: 14.setFontSize,
                                      fontWeight: FontWeight.w500,
                                      textColor: CustomAppColor.of(context).bgStar,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.setHeight),

                      // Review Text
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Lorem Ipsum Is Simply Dummy Text Of The Printing Typesetting Lorem Ipsum Is Simply Lorem Ipsum  ",
                                  style: TextStyle(
                                    fontSize: 10.setFontSize,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: Constant.fontFamily,
                                    letterSpacing: 0.0,
                                    color: CustomAppColor.of(context).txtBlack,
                                  ),
                                ),
                                TextSpan(
                                  text: "Read More",
                                  style: TextStyle(
                                    fontSize: 10.setFontSize,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: Constant.fontFamily,
                                    decoration: TextDecoration.underline,
                                    color: CustomAppColor.of(context).primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 30.setHeight),
        ],
      ),
    );
  }

  Widget _faq() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtFaq,
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 10.setHeight),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.setWidth),
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
                  answer: Languages.of(context).txtAbsolutelyWeConnectYouWithBuyersForFree,
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
                ),
              ],
            ),
          ),
          SizedBox(height: 30.setHeight),
        ],
      ),
    );
  }

  Widget _buildFAQItem({
    required String question,
    required String answer,
    required bool isExpanded,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.setHeight),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: CustomAppColor.of(context).containerBorder,
            width: 1,
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
                textColor: CustomAppColor.of(context).txtGray,
                textAlign: TextAlign.left,
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
