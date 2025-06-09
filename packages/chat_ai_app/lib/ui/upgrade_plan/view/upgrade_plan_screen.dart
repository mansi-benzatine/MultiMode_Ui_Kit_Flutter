import 'package:chat_ai_app_package/ui/payment_method/view/payment_method_screen.dart';
import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class UpgradePlanScreen extends StatefulWidget {
  const UpgradePlanScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const UpgradePlanScreen());
  }

  @override
  State<UpgradePlanScreen> createState() => _UpgradePlanScreenState();
}

class _UpgradePlanScreenState extends State<UpgradePlanScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        bottom: true,
        top: false,
        child: Column(
          children: [
            TopBar(this, title: Languages.of(context).txtUpgradePlan),
            Expanded(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 20.setHeight),
                child: Column(
                  children: [
                    _ItemCardSubscription(
                      bgImage: AppAssets.imgBgSubscription1,
                      price: '10',
                      period: '1 ${Languages.of(context).txtMonth}',
                      feature1: Languages.of(context).txtAlwaysAvailable,
                      feature2: Languages.of(context).txtFastResponse,
                      feature3: Languages.of(context).txtPriorityToAccessNewFeatures,
                      feature4: Languages.of(context).txtAdvancedAnalytics,
                    ),
                    SizedBox(height: 30.setHeight),
                    _ItemCardSubscription(
                      bgImage: AppAssets.imgBgSubscription2,
                      price: '45',
                      period: '6 ${Languages.of(context).txtMonth}',
                      feature1: Languages.of(context).txtAlwaysAvailable,
                      feature2: Languages.of(context).txtFastResponse,
                      feature3: Languages.of(context).txtPriorityToAccessNewFeatures,
                      feature4: Languages.of(context).txtAdvancedAnalytics,
                    ),
                    SizedBox(height: 30.setHeight),
                    _ItemCardSubscription(
                      bgImage: AppAssets.imgBgSubscription3,
                      price: '75',
                      period: '12 ${Languages.of(context).txtMonth}',
                      feature1: Languages.of(context).txtAlwaysAvailable,
                      feature2: Languages.of(context).txtFastResponse,
                      feature3: Languages.of(context).txtPriorityToAccessNewFeatures,
                      feature4: Languages.of(context).txtAdvancedAnalytics,
                    ),
                    SizedBox(height: 40.setHeight),
                  ],
                ),
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

class _ItemCardSubscription extends StatelessWidget {
  final String bgImage;
  final String price;
  final String period;
  final String feature1;
  final String feature2;
  final String feature3;
  final String feature4;

  const _ItemCardSubscription({
    required this.bgImage,
    required this.price,
    required this.period,
    required this.feature1,
    required this.feature2,
    required this.feature3,
    required this.feature4,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            // width: 0.screenWidth,
            // height: 400.setHeight,
            margin: EdgeInsets.only(top: 45.setHeight),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(bgImage),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 65.setHeight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CommonText(
                      text: "\$ $price ",
                      fontWeight: FontWeight.w900,
                      fontSize: 45.setFontSize,
                      textColor: CustomAppColor.of(context).txtWhite,
                      height: 1,
                      textAlign: TextAlign.center,
                    ),
                    CommonText(
                      text: "/ $period",
                      fontWeight: FontWeight.w700,
                      fontSize: 20.setFontSize,
                      textColor: CustomAppColor.of(context).txtWhite,
                      height: 1.5,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: 10.setHeight),
                Divider(
                  endIndent: 20.setWidth,
                  indent: 20.setWidth,
                  thickness: .8,
                  color: CustomAppColor.of(context).txtWhite,
                ),
                SizedBox(height: 10.setHeight),
                _itemFeature(context: context, feature: feature1),
                SizedBox(height: 5.setHeight),
                _itemFeature(context: context, feature: feature2),
                SizedBox(height: 5.setHeight),
                _itemFeature(context: context, feature: feature3),
                SizedBox(height: 5.setHeight),
                _itemFeature(context: context, feature: feature4),
                SizedBox(height: 20.setHeight),
                CommonButton(
                  text: Languages.of(context).txtGetPremium,
                  alignment: Alignment.centerLeft,
                  height: 50.setHeight,
                  mLeft: 15.setWidth,
                  mRight: 15.setWidth,
                  buttonColor: CustomAppColor.of(context).txtWhite,
                  buttonTextColor: CustomAppColor.of(context).txtBlack,
                  onTap: () {
                    Navigator.push(context, PaymentMethodScreen.route());
                  },
                ),
                SizedBox(height: 20.setHeight),
              ],
            ),
          ),
          Image.asset(
            AppAssets.imgKing,
            width: 90.setHeight,
            height: 90.setHeight,
            gaplessPlayback: true,
          )
        ],
      ),
    );
  }

  _itemFeature({required BuildContext context, required String feature}) {
    return Row(
      children: [
        SizedBox(width: 40.setWidth),
        Image.asset(
          AppAssets.icDone,
          height: 30.setHeight,
          width: 30.setHeight,
          gaplessPlayback: true,
        ),
        SizedBox(width: 8.setWidth),
        Expanded(
          child: CommonText(
            text: feature,
            fontWeight: FontWeight.w600,
            fontSize: 16.setFontSize,
            textColor: CustomAppColor.of(context).txtWhite,
            height: 1,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
