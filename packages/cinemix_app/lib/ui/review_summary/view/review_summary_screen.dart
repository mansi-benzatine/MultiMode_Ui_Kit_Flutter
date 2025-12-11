import 'package:cinemix_app/interfaces/top_bar_click_listener.dart';
import 'package:cinemix_app/localization/language/languages.dart';
import 'package:cinemix_app/utils/app_assets.dart';
import 'package:cinemix_app/utils/app_color.dart';
import 'package:cinemix_app/utils/constant.dart';
import 'package:cinemix_app/utils/sizer_utils.dart';
import 'package:cinemix_app/widgets/alert_dialog/subscription_success_alert_dialog.dart';
import 'package:cinemix_app/widgets/button/common_button.dart';
import 'package:cinemix_app/widgets/text/common_text.dart';
import 'package:cinemix_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

class ReviewSummaryScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ReviewSummaryScreen());
  }

  const ReviewSummaryScreen({super.key});

  @override
  State<ReviewSummaryScreen> createState() => _ReviewSummaryScreenState();
}

class _ReviewSummaryScreenState extends State<ReviewSummaryScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            isShowBack: true,
            title: Languages.of(context).txtReviewSummary,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
              child: Column(
                children: [
                  _planCard(),
                  SizedBox(height: 20.setHeight),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16.setHeight, horizontal: 12.setWidth),
                    margin: EdgeInsets.only(bottom: 8.setHeight),
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).bgScreen,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: CustomAppColor.of(context).txtBlack.withValues(alpha: .1),
                        width: .8,
                      ),
                    ),
                    child: Column(
                      children: [
                        _amountRow("Amount", "\$4.99"),
                        SizedBox(height: 8.setHeight),
                        _amountRow("Tax", "\$1.99"),
                        Divider(
                          color: CustomAppColor.of(context).txtBlack.withValues(alpha: .1),
                          height: 30.setHeight,
                        ),
                        _amountRow("Payment Method", "\$6.99"),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.setHeight),
                  _walletBox(),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.setWidth, bottom: 55.setHeight, right: 20.setWidth),
            child: CommonButton(
              text: Languages.of(context).txtConfirmPayment,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const SubscriptionSuccessAlertDialog();
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _planCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 16.setHeight),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: CustomAppColor.of(context).primary,
          width: 1.5,
        ),
        gradient: LinearGradient(
          colors: [
            CustomAppColor.of(context).bgTextFormFieldShadow,
            CustomAppColor.of(context).bgTextFormFieldShadowLight,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: "Standard",
                  fontSize: 18.setFontSize,
                  fontFamily: Constant.fontFamilyClashDisplayMedium500,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
                SizedBox(height: 6.setHeight),
                CommonText(
                  text: "7 Days Free Trial, Automatic Renewal.",
                  fontSize: 12.setFontSize,
                  textAlign: TextAlign.start,
                  textColor: CustomAppColor.of(context).txtGray,
                ),
              ],
            ),
          ),
          SizedBox(width: 15.setWidth),
          CommonText(
            text: "\$4.99",
            fontSize: 28.setFontSize,
            fontFamily: Constant.fontFamilyClashGroteskSemiBold600,
          ),
        ],
      ),
    );
  }

  Widget _amountRow(String label, String value) {
    return Row(
      children: [
        CommonText(
          text: label,
          fontFamily: Constant.fontFamilyClashGroteskMedium500,
        ),
        const Spacer(),
        CommonText(
          text: value,
          fontFamily: Constant.fontFamilyClashGroteskMedium500,
        ),
      ],
    );
  }

  Widget _walletBox() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.setHeight, horizontal: 12.setWidth),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScreen,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: CustomAppColor.of(context).txtBlack.withValues(alpha: .1),
          width: .8,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).btnGrey,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.account_balance_wallet_outlined, size: 20),
          ),
          SizedBox(width: 12.setWidth),
          CommonText(
            text: "My Wallet",
            fontSize: 14.setFontSize,
            textColor: CustomAppColor.of(context).txtBlack,
            fontFamily: Constant.fontFamilyClashGroteskMedium500,
          ),
          const Spacer(),
          Image.asset(
            AppAssets.icEdit,
            color: CustomAppColor.of(context).icBlackWhite,
            width: 18.setWidth,
            height: 18.setHeight,
          )
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) Navigator.pop(context);
  }
}
