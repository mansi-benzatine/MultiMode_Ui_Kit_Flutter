import 'package:dating_app_package/localization/language/languages.dart';
import 'package:dating_app_package/utils/sizer_utils.dart';
import 'package:dating_app_package/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/button/common_button.dart';
import '../datamodels/subscription_data.dart';

class SubscriptionPlanScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SubscriptionPlanScreen());
  }

  const SubscriptionPlanScreen({super.key});

  @override
  State<SubscriptionPlanScreen> createState() => _SubscriptionPlanScreenState();
}

class _SubscriptionPlanScreenState extends State<SubscriptionPlanScreen> {
  int selectedIndex = 1;

  final List<SubscriptionPlan> plans = [
    SubscriptionPlan(duration: "1 Month", price: "\$4.99", savings: "Save 67%"),
    SubscriptionPlan(duration: "6 Months", price: "\$14.99", savings: "Save 50%"),
    SubscriptionPlan(duration: "12 Month", price: "\$19.99", savings: "Save 80%"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: CustomAppColor.of(context).txtGrey,
                    size: 29,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20.setHeight),
                      Image.asset(AppAssets.imgUnlimitedChatAndVideoChat, height: 120.setHeight),
                      SizedBox(height: 20.setHeight),
                      CommonText(
                        text: Languages.of(context).txtUnlimitedChatAndVideoChat,
                        fontWeight: FontWeight.w700,
                        fontSize: 20.setFontSize,
                      ),
                      SizedBox(height: 6.setHeight),
                      CommonText(
                        text: Languages.of(context).txtUnlimitedChatAndVideoChatDesc,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.setFontSize,
                        textColor: CustomAppColor.of(context).txtGrey,
                      ),
                      SizedBox(height: 15.setHeight),
                      Column(
                        children: List.generate(plans.length, (index) {
                          final plan = plans[index];
                          final isSelected = index == selectedIndex;
                          return GestureDetector(
                            onTap: () => setState(() => selectedIndex = index),
                            child: Container(
                              margin: EdgeInsets.only(bottom: 14.setHeight),
                              padding: EdgeInsets.symmetric(horizontal: 18.setWidth, vertical: 12.setHeight),
                              decoration: BoxDecoration(
                                color: isSelected ? CustomAppColor.of(context).txtVelvetPink : CustomAppColor.of(context).bgScaffold,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: isSelected ? CustomAppColor.of(context).txtVelvetPink : CustomAppColor.of(context).textFormFieldBorder,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CommonText(
                                          text: "${plan.price} / ${plan.duration}",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18.setFontSize,
                                          textColor: isSelected ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtVelvet,
                                        ),
                                        SizedBox(height: 4.setHeight),
                                        CommonText(
                                          text: plan.savings,
                                          fontSize: 14.setFontSize,
                                          textColor: isSelected ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtVelvet,
                                        )
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
                                    color: isSelected ? Colors.white : CustomAppColor.of(context).textFormFieldBorder,
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _policyText(Languages.of(context).txtPrivacyPolicy),
                            _policyText(Languages.of(context).txtTermsOfService),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.setHeight),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
                        child: CommonText(
                          text: "1. All payments made through Play Store are controlled and managed by Google.\n"
                              "2. Payment will be charged to your Play Store Account at confirmation of purchase.\n"
                              "3. Subscription automatically renews unless auto-renew is turned off at least 24-hours before the end of the current period.\n"
                              "4. Account will be charged for renewal within 24-hours prior to the end of the current period.\n"
                              "5. Auto-renewal can be turned off at any time in account settings.\n"
                              "6. By cancelling your plan your access and benefits will be turned off.\n"
                              "7. If you cancel a subscription purchased via Play Store, all purchases are final. Partial refunds, if offered, will be forfeited if you purchase a subscription to this product, where applicable.",
                          fontSize: 11.setFontSize,
                          textColor: CustomAppColor.of(context).txtGrey,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(height: 16.setHeight),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.setWidth),
                child: CommonButton(
                  text: Languages.of(context).txtContinue.toUpperCase(),
                  onTap: () => Navigator.pop(context),
                ),
              ),
              SizedBox(height: 16.setHeight),
            ],
          ),
        ),
      ),
    );
  }

  Widget _policyText(String title) {
    return CommonText(
      text: title,
      fontSize: 12.setFontSize,
      textColor: CustomAppColor.of(context).txtVelvetPink,
      fontWeight: FontWeight.w800,
      textAlign: TextAlign.center,
    );
  }
}
