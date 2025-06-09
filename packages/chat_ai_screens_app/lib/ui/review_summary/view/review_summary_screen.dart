import 'package:chat_ai_screens_app_package/utils/sizer_utils.dart';
import 'package:chat_ai_screens_app_package/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/alert_dialog/common_alert_dialog.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class ReviewSummaryScreen extends StatefulWidget {
  const ReviewSummaryScreen({super.key});
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ReviewSummaryScreen());
  }

  @override
  State<ReviewSummaryScreen> createState() => _ReviewSummaryScreenState();
}

class _ReviewSummaryScreenState extends State<ReviewSummaryScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: Column(
          children: [
            IgnorePointer(
              ignoring: true,
              child: TopBar(
                this,
                title: Languages.of(context).txtReviewSummary,
                isShowBack: true,
              ),
            ),
            SizedBox(height: 15.setHeight),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
                child: const ReviewSummaryView(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CommonButton(
                  text: Languages.of(context).txtConfirmPayment,
                  onTap: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (_) {
                        return CommonDialog(
                          titleText: CommonText(
                            text: Languages.of(context).txtUpgradePlanSuccessful,
                            fontWeight: FontWeight.w800,
                            fontSize: 22.setFontSize,
                            textColor: CustomAppColor.of(context).txtBlack,
                          ),
                          descriptionText: CommonText(
                            text: Languages.of(context).txtLoremIpsumDesc,
                            fontSize: 14.setFontSize,
                            fontWeight: FontWeight.w400,
                            textColor: CustomAppColor.of(context).txtBlack,
                          ),
                          icon: Image.asset(
                            AppAssets.imgKing,
                            height: 110.setHeight,
                          ),
                          button: CommonButton(
                            text: "ok",
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).pop();
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            )
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

class ReviewSummaryView extends StatelessWidget {
  const ReviewSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: AssetImage(AppAssets.imgBgSubscription1),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              CommonText(
                text: Languages.of(context).txtSubscriptionPlan,
                fontWeight: FontWeight.w700,
                fontSize: 24.setFontSize,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonText(
                    text: "\$10 ",
                    fontWeight: FontWeight.w800,
                    fontSize: 45.setFontSize,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 10.setHeight),
                      CommonText(
                        text: "/1 Month",
                        fontWeight: FontWeight.w700,
                        fontSize: 20.setFontSize,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 20.setHeight),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 25.setHeight),
          decoration: BoxDecoration(
            border: Border.all(color: CustomAppColor.of(context).listTile),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: CustomAppColor.of(context).txtBlack.withOpacityPercent(0.06),
                blurRadius: 0,
                spreadRadius: 0,
              ),
              BoxShadow(
                color: CustomAppColor.of(context).txtWhite,
                blurRadius: 10,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: Languages.of(context).txtSubscriptionPlan,
                    fontWeight: FontWeight.w400,
                    fontSize: 18.setFontSize,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                  CommonText(
                    text: "1 month",
                    fontWeight: FontWeight.w600,
                    fontSize: 18.setFontSize,
                    textColor: CustomAppColor.of(context).txtBlack,
                  )
                ],
              ),
              SizedBox(height: 5.setHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: Languages.of(context).txtAmount,
                    fontWeight: FontWeight.w400,
                    fontSize: 18.setFontSize,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                  CommonText(
                    text: "\$2.00",
                    fontWeight: FontWeight.w600,
                    fontSize: 18.setFontSize,
                    textColor: CustomAppColor.of(context).txtBlack,
                  )
                ],
              ),
              SizedBox(height: 5.setHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: Languages.of(context).txtTax,
                    fontWeight: FontWeight.w400,
                    fontSize: 18.setFontSize,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                  CommonText(
                    text: "\$10.00",
                    fontWeight: FontWeight.w600,
                    fontSize: 18.setFontSize,
                    textColor: CustomAppColor.of(context).txtBlack,
                  )
                ],
              ),
              Divider(color: CustomAppColor.of(context).listTileColor),
              SizedBox(height: 5.setHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: Languages.of(context).txtTotalAmount,
                    fontWeight: FontWeight.w400,
                    fontSize: 18.setFontSize,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                  CommonText(
                    text: "\$12.00",
                    fontWeight: FontWeight.w600,
                    fontSize: 18.setFontSize,
                    textColor: CustomAppColor.of(context).txtBlack,
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20.setHeight),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 13.setHeight),
          decoration: BoxDecoration(
            border: Border.all(color: CustomAppColor.of(context).listTileColor),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: CustomAppColor.of(context).txtBlack.withOpacityPercent(0.06),
                blurRadius: 0,
                spreadRadius: 0,
              ),
              BoxShadow(
                color: CustomAppColor.of(context).txtWhite,
                blurRadius: 10,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50.setWidth,
                        height: 50.setHeight,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: CustomAppColor.of(context).primary.withOpacityPercent(0.2), shape: BoxShape.circle),
                        child: Image.asset(
                          AppAssets.icWallet,
                          height: 20.setHeight,
                          width: 20.setWidth,
                        ),
                      ),
                      SizedBox(width: 12.setWidth),
                      CommonText(
                        text: Languages.of(context).txtSubscriptionPlan,
                        fontWeight: FontWeight.w400,
                        fontSize: 18.setFontSize,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                    ],
                  ),
                  Image.asset(
                    AppAssets.icEditChat,
                    height: 20.setHeight,
                    width: 20.setWidth,
                    color: CustomAppColor.of(context).txtGray,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
