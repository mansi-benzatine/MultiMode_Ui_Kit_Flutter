import 'package:flutter/material.dart';
import 'package:musify_app_package/localization/language/languages.dart';
import 'package:musify_app_package/ui/select_payment_method/view/select_payment_method_screen.dart';
import 'package:musify_app_package/utils/constant.dart';
import 'package:musify_app_package/utils/sizer_utils.dart';
import 'package:musify_app_package/utils/utils.dart';
import 'package:musify_app_package/widgets/top_bar/topbar.dart';

import '../../../dialogs/alerts/congratulations_dialog.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../dashboard/view/dashboard_screen.dart';
import '../../premium_plan_list/view/premium_plan_list_screen.dart';

class CheckOutScreen extends StatefulWidget {
  final PremiumPlanData plan;
  final PaymentMethodData paymentMethod;
  const CheckOutScreen({super.key, required this.plan, required this.paymentMethod});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> implements TopBarClickListener {
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
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
                child: Column(
                  children: [
                    // Premium Plan Card
                    Container(
                      padding: EdgeInsets.all(24.setWidth),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            CustomAppColor.of(context).primary.withOpacityPercent(0.3),
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
                                text: widget.plan.price,
                                fontSize: 32.setFontSize,
                                fontWeight: FontWeight.w700,
                                textColor: CustomAppColor.of(context).txtBlack,
                                fontFamily: Constant.fontFamily,
                              ),
                              SizedBox(width: 5.setWidth),
                              CommonText(
                                text: widget.plan.period,
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: widget.plan.features
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
                        ],
                      ),
                    ),

                    SizedBox(height: 20.setHeight),

                    // Payment Method Section
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 14.setHeight),
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).bgSearchBar,
                        borderRadius: BorderRadius.circular(10.setWidth),
                      ),
                      child: Row(
                        children: [
                          // Payment Method Icon
                          Image.asset(
                            widget.paymentMethod.icon,
                            width: 22.setWidth,
                            height: 22.setHeight,
                            fit: BoxFit.contain,
                            color: widget.paymentMethod.iconColor,
                          ),

                          SizedBox(width: 16.setWidth),

                          // Payment Method Name
                          Expanded(
                            child: CommonText(
                              text: widget.paymentMethod.name,
                              fontSize: 16.setFontSize,
                              fontWeight: FontWeight.w600,
                              textColor: CustomAppColor.of(context).txtBlack,
                              fontFamily: Constant.fontFamily,
                              textAlign: TextAlign.start,
                            ),
                          ),

                          // Edit Icon
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset(
                              AppAssets.icEdit,
                              width: 20.setWidth,
                              height: 20.setHeight,
                              fit: BoxFit.contain,
                              color: CustomAppColor.of(context).txtBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Confirm Button
            Padding(
              padding: EdgeInsets.all(20.setWidth),
              child: CommonButton(
                text: Languages.of(context).txtConfirm,
                onTap: () {
                  // Handle payment confirmation
                  showDialog(
                      context: context,
                      barrierColor: CustomAppColor.of(context).txtBlack.withOpacityPercent(0.3),
                      builder: (dialogContext) => CongratulationsDialog(
                            title: Languages.of(context).txtCongratulations,
                            message: Languages.of(context).txtLoremIpsumShort,
                            icon: AppAssets.icPremiumProfile,
                            onComplete: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => const DashboardScreen()));
                            },
                          ));
                },
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
