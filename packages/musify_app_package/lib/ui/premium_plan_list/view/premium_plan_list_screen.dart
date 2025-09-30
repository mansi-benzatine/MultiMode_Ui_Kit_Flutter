import 'package:flutter/material.dart';
import 'package:musify_app_package/utils/utils.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../select_payment_method/view/select_payment_method_screen.dart';

class PremiumPlanListScreen extends StatefulWidget {
  const PremiumPlanListScreen({super.key});

  @override
  State<PremiumPlanListScreen> createState() => _PremiumPlanListScreenState();
}

class _PremiumPlanListScreenState extends State<PremiumPlanListScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtPremiumPlans,
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
                child: Column(
                  children: [
                    // Monthly Plan
                    _buildPremiumPlanCard(
                      price: "\$8.00",
                      period: "/month",
                      features: [
                        "Listening With Better Audio Quality",
                        "Listening Without Adds",
                        "Unlimited Download Music",
                      ],
                    ),

                    SizedBox(height: 20.setHeight),

                    // 3 Month Plan
                    _buildPremiumPlanCard(
                      price: "\$18.00",
                      period: "/3 month",
                      features: [
                        "Listening With Better Audio Quality",
                        "Listening Without Adds",
                        "Unlimited Download Music",
                      ],
                    ),

                    SizedBox(height: 20.setHeight),

                    // Yearly Plan
                    _buildPremiumPlanCard(
                      price: "\$49.00",
                      period: "/year",
                      features: [
                        "Listening With Better Audio Quality",
                        "Listening Without Adds",
                        "Unlimited Download Music",
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPremiumPlanCard({
    required String price,
    required String period,
    required List<String> features,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            CustomAppColor.of(context).primary.withValues(alpha: 0.3),
            CustomAppColor.of(context).txtWhite,
          ],
          stops: const [0, 0.7],
        ),
        borderRadius: BorderRadius.circular(20.setWidth),
        border: Border.all(
          color: CustomAppColor.of(context).primary.withOpacityPercent(0.2),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          // Crown Icon
          Container(
            width: 70.setWidth,
            height: 80.setHeight,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CustomAppColor.of(context).primary,
            ),
            padding: EdgeInsets.all(12.setWidth),
            child: Image.asset(
              AppAssets.icPremiumProfile,
              width: 45.setWidth,
              height: 45.setHeight,
              fit: BoxFit.contain,
            ),
          ),

          SizedBox(height: 10.setHeight),

          // Price
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonText(
                text: price,
                fontSize: 32.setFontSize,
                fontWeight: FontWeight.w700,
                textColor: CustomAppColor.of(context).txtBlack,
                fontFamily: Constant.fontFamily,
              ),
              SizedBox(width: 5.setWidth),
              CommonText(
                text: period,
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w400,
                textColor: CustomAppColor.of(context).txtBlack,
                fontFamily: Constant.fontFamily,
              ),
            ],
          ),

          SizedBox(height: 12.setHeight),

          // Features
          Padding(
            padding: EdgeInsets.only(left: 30.setWidth),
            child: Column(
              children: features
                  .map((feature) => Container(
                        margin: EdgeInsets.only(bottom: 12.setHeight),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 6.setWidth,
                              height: 6.setHeight,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: CustomAppColor.of(context).txtBlack,
                              ),
                            ),
                            SizedBox(width: 12.setWidth),
                            Expanded(
                              child: CommonText(
                                text: feature,
                                fontSize: 14.setFontSize,
                                fontWeight: FontWeight.w400,
                                textColor: CustomAppColor.of(context).txtBlack,
                                fontFamily: Constant.fontFamily,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),

          SizedBox(height: 5.setHeight),

          // Get Premium Button
          CommonButton(
            height: 44.setHeight,
            text: Languages.of(context).txtGetPremium,
            onTap: () {
              // Handle premium purchase
              Navigator.push(context, MaterialPageRoute(builder: (context) => SelectPaymentMethodScreen(plan: PremiumPlanData(price: price, period: period, features: features))));
            },
          ),
        ],
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

class PremiumPlanData {
  final String price;
  final String period;
  final List<String> features;

  PremiumPlanData({required this.price, required this.period, required this.features});
}
