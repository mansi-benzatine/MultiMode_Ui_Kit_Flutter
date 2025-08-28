import 'package:flutter/material.dart';
import 'package:mantra_yoga_screens_app_package/utils/sizer_utils.dart';
import 'package:mantra_yoga_screens_app_package/widgets/button/common_button.dart';

import '../../../dialogs/alerts/subscription_congratulation_dialog.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../payment_method/view/payment_method_screen.dart';

class UpgradePlanScreen extends StatefulWidget {
  final bool isForAlert;
  const UpgradePlanScreen({super.key, this.isForAlert = false});

  static Route<dynamic> route({bool isForAlert = false}) {
    return MaterialPageRoute(
      builder: (context) => UpgradePlanScreen(isForAlert: isForAlert),
    );
  }

  @override
  State<UpgradePlanScreen> createState() => _UpgradePlanScreenState();
}

class _UpgradePlanScreenState extends State<UpgradePlanScreen> implements TopBarClickListener {
  ValueNotifier<int> isMonthly = ValueNotifier(0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.isForAlert) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        SubscriptionCongratulationDialog.show(context);
      });
    }
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
                title: Languages.of(context).txtUpgradePlan,
              ),
              _tabBar(),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    left: 15.setWidth,
                    right: 15.setWidth,
                    top: 10.setHeight,
                    bottom: MediaQuery.of(context).padding.bottom + 10.setHeight,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _pricingView(),
                      SizedBox(height: 20.setHeight),
                      _subscriptionBenefitsView(),
                      SizedBox(height: 10.setHeight),
                      _paymentMethodView(),
                    ],
                  ),
                ),
              ),
              IgnorePointer(
                ignoring: true,
                child: CommonButton(
                  text: "${Languages.of(context).txtContinue} - \$100.00",
                  onTap: () {
                    SubscriptionCongratulationDialog.show(context);
                  },
                  buttonColor: CustomAppColor.of(context).primary,
                  borderColor: CustomAppColor.of(context).borderColor,
                  borderWidth: 4,
                  radius: 18,
                  mLeft: 20.setWidth,
                  mRight: 20.setWidth,
                  mBottom: MediaQuery.of(context).padding.bottom + 10.setHeight,
                  mTop: 20.setHeight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _tabBar() {
    return ValueListenableBuilder(
      valueListenable: isMonthly,
      builder: (context, value, child) {
        return Container(
          padding: EdgeInsets.only(left: 15.setWidth, right: 15.setWidth, bottom: 10.setHeight),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    isMonthly.value = 0;
                  },
                  child: AnimatedBuilder(
                    animation: isMonthly,
                    builder: (context, child) {
                      bool isSelected = isMonthly.value == 0;
                      return Container(
                        height: 48.setHeight,
                        decoration: BoxDecoration(
                          color: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).transparent,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: isSelected ? CustomAppColor.of(context).borderColor : CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
                            width: isSelected ? 3 : 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            Languages.of(context).txtMonthly,
                            style: TextStyle(
                              fontSize: 14.setFontSize,
                              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                              fontFamily: isSelected ? Constant.fontFamilyBold700 : Constant.fontFamilyMedium500,
                              color: isSelected ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtDarkGray,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(width: 10.setWidth),
              Expanded(
                child: GestureDetector(
                  onTap: () => isMonthly.value = 1,
                  child: AnimatedBuilder(
                    animation: isMonthly,
                    builder: (context, child) {
                      bool isSelected = isMonthly.value == 1;
                      return Container(
                        height: 48.setHeight,
                        decoration: BoxDecoration(
                          color: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).transparent,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: isSelected ? CustomAppColor.of(context).borderColor : CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
                            width: isSelected ? 3 : 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            Languages.of(context).txtYearly,
                            style: TextStyle(
                              fontSize: 14.setFontSize,
                              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                              fontFamily: isSelected ? Constant.fontFamilyBold700 : Constant.fontFamilyMedium500,
                              color: isSelected ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtDarkGray,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _pricingView() {
    return ValueListenableBuilder(
      valueListenable: isMonthly,
      builder: (context, value, child) {
        return Container(
          width: 0.screenWidth,
          padding: EdgeInsets.only(left: 15.setWidth, right: 15.setWidth, top: 15.setHeight, bottom: 15.setHeight),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).containerFillBorderAndBlack,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: CustomAppColor.of(context).primary, width: 2),
          ),
          child: Column(
            children: [
              CommonText(
                text: Languages.of(context).txtAppName,
                fontSize: 14.setFontSize,
                fontWeight: FontWeight.w600,
                fontFamily: Constant.fontFamilySemiBold600,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              SizedBox(height: 10.setHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CommonText(
                    text: isMonthly.value == 0 ? "\$100.00" : "\$1000.00",
                    fontSize: 28.setFontSize,
                    fontWeight: FontWeight.w700,
                    fontFamily: Constant.fontFamilyBold700,
                    textColor: CustomAppColor.of(context).txtBlack,
                    height: 1,
                  ),
                  SizedBox(width: 3.setWidth),
                  Container(
                    margin: EdgeInsets.only(bottom: 2.setHeight),
                    child: CommonText(
                      text: "/${isMonthly.value == 0 ? Languages.of(context).txtMonth : Languages.of(context).txtYear}",
                      fontSize: 13.setFontSize,
                      fontWeight: FontWeight.w600,
                      fontFamily: Constant.fontFamilySemiBold600,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  _subscriptionBenefitsView() {
    Widget itemBenefitView(String text) {
      return Container(
        margin: EdgeInsets.only(bottom: 10.setHeight),
        child: Row(
          children: [
            Image.asset(
              AppAssets.icRoundDone,
              width: 25.setWidth,
              height: 25.setHeight,
            ),
            SizedBox(width: 12.setWidth),
            Expanded(
              child: CommonText(
                text: text,
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w500,
                fontFamily: Constant.fontFamilyMedium500,
                textColor: CustomAppColor.of(context).txtBlack,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: Languages.of(context).txtSubscriptionBenefits,
          fontSize: 14.setFontSize,
          fontWeight: FontWeight.w700,
          fontFamily: Constant.fontFamilyBold700,
          textColor: CustomAppColor.of(context).txtBlack,
        ),
        SizedBox(height: 15.setHeight),
        itemBenefitView(Languages.of(context).txtRemoveAllAds),
        itemBenefitView(Languages.of(context).txtNewMonthlyContents),
        itemBenefitView(Languages.of(context).txtGetDetailedReportsEachMonth),
        itemBenefitView(Languages.of(context).txt100GuidedMeditationsCoveringAnxietyFocusStressGratitudeAndMuchMore),
        itemBenefitView(Languages.of(context).txtExclusiveEarlyAccessToNewFeatureAndContents),
        itemBenefitView(Languages.of(context).txtMonitorAndAccessYourEntireUsageHistoryToDate),
      ],
    );
  }

  _paymentMethodView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: Languages.of(context).txtPaymentMethod,
          fontSize: 14.setFontSize,
          fontWeight: FontWeight.w700,
          fontFamily: Constant.fontFamilyBold700,
          textColor: CustomAppColor.of(context).txtBlack,
        ),
        SizedBox(height: 15.setHeight),
        IgnorePointer(
          ignoring: true,
          child: InkWell(
            highlightColor: CustomAppColor.of(context).transparent,
            splashColor: CustomAppColor.of(context).transparent,
            onTap: () {
              Navigator.push(context, PaymentMethodScreen.route(isFromSelection: true));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 15.setHeight),
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).bgScreen,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    AppAssets.icPaymentWallet,
                    height: 20.setHeight,
                    width: 20.setHeight,
                    color: CustomAppColor.of(context).txtBlack,
                  ),
                  SizedBox(width: 10.setWidth),
                  Expanded(
                    child: CommonText(
                      text: Languages.of(context).txtMyWallet,
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w600,
                      fontFamily: Constant.fontFamilySemiBold600,
                      textColor: CustomAppColor.of(context).txtBlack,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Image.asset(
                    AppAssets.icEditOutline,
                    height: 20.setHeight,
                    width: 20.setWidth,
                    color: CustomAppColor.of(context).txtBlack,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
