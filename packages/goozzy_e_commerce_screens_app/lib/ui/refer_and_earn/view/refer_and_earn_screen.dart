import 'package:flutter/material.dart';
import 'package:goozzy_e_commerce_screens_app_package/utils/utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../interfaces/top_bar_click_listener.dart';
import '../../../../../../ui/app/my_app.dart';
import '../../../../../../utils/app_assets.dart';
import '../../../../../../utils/constant.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/button/common_button.dart';
import '../../../../../../widgets/text/common_text.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/string_constant.dart';
import '../../../widgets/topbar/topbar.dart';

class ReferAndEarnScreen extends StatelessWidget implements TopBarClickListener {
  ReferAndEarnScreen({super.key});
  static Route route() {
    return MaterialPageRoute(builder: (context) => ReferAndEarnScreen());
  }

  final pageController = PageController(viewportFraction: 1.0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgTopBar,
        body: Column(
          children: [
            IgnorePointer(
              ignoring: true,
              child: TopBar(
                this,
                isShowBack: true,
                title: Languages.of(context).referAndEarn,
                textColor: CustomAppColor.of(context).txtBlack,
                topBarColor: CustomAppColor.of(context).bgBlackWhiteScaffold,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _referAndEarn(context),
                    Padding(
                      padding: EdgeInsets.only(top: AppSizes.setHeight(12)),
                      child: _myLevel(context),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: AppSizes.setHeight(8)),
                      child: _earnUp(context),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: AppSizes.setHeight(8)),
                      child: _frequentlyAskQuestion(context),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: AppSizes.setHeight(12)),
                      child: _whomToRefer(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _referAndEarn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20), vertical: AppSizes.setHeight(10)),
      color: CustomAppColor.of(context).bgScaffold,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).referFriendsAndEarn,
            fontSize: AppSizes.setFontSize(24),
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: AppSizes.setHeight(10)),
          Container(
            width: AppSizes.setWidth(60),
            height: AppSizes.setHeight(4),
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).containerBorder,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(height: AppSizes.setHeight(10)),
          CommonText(
            text: Languages.of(context).inviteYourFriend,
            fontSize: AppSizes.setFontSize(16),
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtGrey,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(22)),
            child: Row(
              children: [
                Image.asset(
                  AppAssets.icGreyDiscount,
                  width: AppSizes.setWidth(36),
                  height: AppSizes.setHeight(36),
                ),
                SizedBox(width: AppSizes.setWidth(20)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: AppStrings.discount,
                      fontSize: AppSizes.setFontSize(17),
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w700,
                    ),
                    CommonText(
                      text: Languages.of(context).firstThreeOrders,
                      fontSize: AppSizes.setFontSize(12),
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w400,
                      textColor: CustomAppColor.of(context).txtGrey,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _myLevel(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20), vertical: AppSizes.setHeight(20)),
      width: double.infinity,
      color: CustomAppColor.of(context).bgScaffold,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).myLevel.toUpperCase(),
                fontSize: AppSizes.setFontSize(18),
                fontWeight: FontWeight.w700,
              ),
              CommonText(
                text: Languages.of(context).viewAll.toUpperCase(),
                fontSize: AppSizes.setFontSize(14),
                textAlign: TextAlign.start,
                fontWeight: FontWeight.w700,
                textColor: CustomAppColor.of(context).txtPurple,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: AppSizes.setHeight(40)),
            child: Row(
              children: [
                Image.asset(
                  AppAssets.imgLevelZero,
                  width: AppSizes.setWidth(79),
                  height: AppSizes.setHeight(115),
                ),
                Padding(
                  padding: EdgeInsets.only(left: AppSizes.setWidth(32)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CommonText(
                            text: Languages.of(context).numberOfReferrals,
                            fontSize: AppSizes.setFontSize(15),
                          ),
                          CommonText(
                            text: "0",
                            fontSize: AppSizes.setFontSize(15),
                            textColor: CustomAppColor.of(context).txtPurple,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: AppSizes.setHeight(4)),
                        child: CommonText(
                          text: Languages.of(context).criteriaForNextLevel,
                          fontSize: AppSizes.setFontSize(13),
                          textColor: CustomAppColor.of(context).txtGrey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: AppSizes.setHeight(20)),
                        child: CommonButton(
                          width: AppSizes.setWidth(220),
                          height: AppSizes.setHeight(30),
                          isButtonShadow: false,
                          radius: 4,
                          child: CommonText(
                            text: Languages.of(context).referAFriend,
                            textColor: CustomAppColor.of(context).white,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(39)),
            child: Container(
              color: CustomAppColor.of(context).containerBorder,
              height: AppSizes.setHeight(59),
              width: AppSizes.setWidth(1),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(2)),
            child: Stack(
              children: [
                Row(
                  children: [
                    Image.asset(
                      AppAssets.imgLevelOne,
                      width: AppSizes.setWidth(79),
                      height: AppSizes.setHeight(115),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: AppSizes.setWidth(32)),
                      child: CommonText(
                        text: AppStrings.salesOfFirstThreeOrders,
                        fontSize: AppSizes.setFontSize(13),
                        textColor: CustomAppColor.of(context).txtGrey,
                      ),
                    ),
                  ],
                ),
                Positioned.fill(
                  child: Container(
                    color: CustomAppColor.of(context).bgScaffold.withOpacityPercent(0.6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _earnUp(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(20), horizontal: AppSizes.setWidth(20)),
      color: CustomAppColor.of(context).bgScaffold,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonText(
            text: Languages.of(context).youCanEarnUpTo,
            fontSize: AppSizes.setFontSize(16),
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w600,
          ),
          CommonText(
            text: Languages.of(context).learnMore.toUpperCase(),
            fontSize: AppSizes.setFontSize(14),
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w700,
            textColor: CustomAppColor.of(context).txtPurple,
          ),
        ],
      ),
    );
  }

  _frequentlyAskQuestion(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).bgScaffold,
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.setHeight(20),
        horizontal: AppSizes.setWidth(20),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                AppAssets.imgEarnMore,
                width: AppSizes.setWidth(336),
                height: AppSizes.setHeight(191),
              ),
              Positioned(
                right: AppSizes.setWidth(20),
                top: AppSizes.setHeight(18),
                child: Image.asset(
                  AppAssets.icMore,
                  height: AppSizes.setHeight(16),
                  width: AppSizes.setWidth(4),
                  color: CustomAppColor.of(context).white,
                ),
              ),
              Positioned(
                left: AppSizes.setWidth(20),
                bottom: AppSizes.setHeight(18),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(
                      text: "0:00",
                      fontWeight: FontWeight.w700,
                      fontSize: AppSizes.setFontSize(14),
                      textColor: CustomAppColor.of(context).white,
                    ),
                    SizedBox(width: AppSizes.setWidth(10)),
                    Flexible(
                      child: Container(
                        height: AppSizes.setHeight(4),
                        width: AppSizes.setWidth(200),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              CustomAppColor.of(context).white,
                              CustomAppColor.of(context).white.withOpacityPercent(0.2),
                            ],
                            begin: Alignment.centerLeft,
                          ),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    SizedBox(width: AppSizes.setWidth(10)),
                    CommonText(
                      text: AppStrings.youtube,
                      fontWeight: FontWeight.w700,
                      fontSize: AppSizes.setFontSize(10),
                      textColor: CustomAppColor.of(context).white,
                    )
                  ],
                ),
              ),
              Image.asset(
                AppAssets.icYoutubePlay,
                height: AppSizes.setHeight(52),
                width: AppSizes.setWidth(87),
                fit: BoxFit.contain,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(25)),
            child: CommonButton(
              borderColor: CustomAppColor.of(context).borderPurple,
              buttonColor: CustomAppColor.of(context).btnWhite,
              radius: 3,
              child: CommonText(
                text: Languages.of(context).frequentlyAskedQuestions,
                textColor: CustomAppColor.of(context).txtPurple,
                fontSize: AppSizes.setFontSize(14),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              style: TextStyle(
                fontFamily: Constant.fontFamilyUrbanist,
                color: CustomAppColor.of(context).txtGrey,
                fontSize: AppSizes.setFontSize(12),
                fontWeight: FontWeight.w400,
              ),
              children: [
                TextSpan(
                  text: Languages.of(context).byParticipatingInTheReferralProgram,
                ),
                TextSpan(
                  text: Languages.of(context).termsAndCondition,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(
                  text: Languages.of(context).andAcknowledge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _whomToRefer(BuildContext context) {
    return Container(
      width: AppSizes.fullWidth,
      color: CustomAppColor.of(context).bgScaffold,
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.setHeight(20),
        horizontal: AppSizes.setWidth(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: AppSizes.setHeight(16)),
            child: CommonText(
              text: Languages.of(context).whomToRefer,
              fontSize: AppSizes.setFontSize(18),
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(20)),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.imgRefer,
                    height: AppSizes.setHeight(87),
                    width: AppSizes.setWidth(87),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: AppSizes.setHeight(12)),
                    child: CommonText(
                      text: Languages.of(context).referAFriend,
                      fontSize: AppSizes.setFontSize(18),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: AppSizes.setHeight(12)),
                    child: CommonText(
                      text: Languages.of(context).referralsRequireConstantCommunication,
                      fontSize: AppSizes.setFontSize(15),
                      fontWeight: FontWeight.w400,
                      textColor: CustomAppColor.of(context).txtGrey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: AppSizes.setHeight(20)),
                    child: _indicatorWidget(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _indicatorWidget(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: 3,
      axisDirection: Axis.horizontal,
      effect: WormEffect(
        dotColor: CustomAppColor.of(context).dividerGrey,
        activeDotColor: CustomAppColor.of(context).txtPurple,
        dotHeight: AppSizes.setHeight(4),
        dotWidth: AppSizes.setWidth(15),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {String value = ""}) {
    if (name == AppStrings.back) {
      Navigator.pop(GoozzyECommerceScreensMyApp.navigatorKey.currentState!.context);
    }
  }
}
