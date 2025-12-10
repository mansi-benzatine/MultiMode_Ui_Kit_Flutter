import 'package:baby_bloom_screens_app/localization/language/languages.dart';
import 'package:baby_bloom_screens_app/ui/payment_method/view/payment_method_screen.dart';
import 'package:baby_bloom_screens_app/utils/app_assets.dart';
import 'package:baby_bloom_screens_app/utils/app_color.dart';
import 'package:baby_bloom_screens_app/utils/constant.dart';
import 'package:baby_bloom_screens_app/utils/sizer_utils.dart';
import 'package:baby_bloom_screens_app/widgets/button/common_button.dart';
import 'package:baby_bloom_screens_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../../../widgets/alert_dialog/plan_activated_alert_dialog.dart';

class UpgradePlanScreen extends StatefulWidget {
  final bool isForUpgradeAlert;

  static Route<void> route({bool isForUpgradeAlert = false}) {
    return MaterialPageRoute(builder: (_) => UpgradePlanScreen(isForUpgradeAlert: isForUpgradeAlert));
  }

  const UpgradePlanScreen({super.key, this.isForUpgradeAlert = false});

  @override
  State<UpgradePlanScreen> createState() => _UpgradePlanScreenState();
}

class _UpgradePlanScreenState extends State<UpgradePlanScreen> {
  List<String> advantageList = [
    "Ad-Free Experience.",
    "Unlimited pregnancy articles and video sessions.",
    "Personalized weekly insights.",
    "Unlock the premium tracking tools.",
    "Easily share your data with loved ones.",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.isForUpgradeAlert) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
            context: context,
            builder: (dialogContext) {
              return PopScope(
                canPop: false,
                onPopInvokedWithResult: (didPop, result) {
                  if (!didPop) {
                    Navigator.pop(dialogContext);
                    Navigator.pop(context);
                  }
                },
                child: const PlanActivatedAlertDialog(),
              );
            });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.imgBgUpgradePlan,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned(
            top: 50.setHeight,
            right: 20.setWidth,
            child: IgnorePointer(
              ignoring: true,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.close,
                  color: CustomAppColor.of(context).white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0.screenHeight / 2.2,
            right: 20.setWidth,
            left: 20.setWidth,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffFBE9D7),
                        Color(0xffF6D5F7),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CommonText(
                            text: "\$9.49",
                            fontSize: 34.setFontSize,
                            fontFamily: Constant.fontFamilyBold700,
                            textColor: CustomAppColor.of(context).secondary,
                          ),
                          CommonText(
                            text: "/Month",
                            fontSize: 14.setFontSize,
                            fontFamily: Constant.fontFamilyBold700,
                            textColor: CustomAppColor.of(context).secondary,
                          )
                        ],
                      ),
                      CommonText(
                        text: "7 days free then \$9.49 billed monthly",
                        fontSize: 14.setFontSize,
                        fontFamily: Constant.fontFamilySemiBold600,
                        textColor: CustomAppColor.of(context).black,
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 0.setWidth,
                  bottom: 50.setHeight,
                  child: Image.asset(
                    AppAssets.imgCrown,
                    height: 90.setHeight,
                    width: 90.setHeight,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0.screenHeight / 1.65,
            left: 20.setWidth,
            right: 20.setWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: "Starts With a risk-free 7-day free trial.",
                  fontFamily: Constant.fontFamilyMedium500,
                  fontSize: 15.setFontSize,
                  textColor: CustomAppColor.of(context).black,
                ),
                SizedBox(height: 10.setHeight),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    advantageList.length,
                    (index) {
                      final item = advantageList[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 3.setHeight),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              AppAssets.icMark,
                              width: 20.setHeight,
                              height: 20.setHeight,
                            ),
                            SizedBox(width: 5.setHeight),
                            CommonText(
                              text: item,
                              fontFamily: Constant.fontFamilyBold700,
                              fontSize: 13.setFontSize,
                              textColor: CustomAppColor.of(context).black,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 25.setHeight),
                IgnorePointer(
                  ignoring: true,
                  child: CommonButton(
                    text: Languages.of(context).txtUpgradeNow,
                    onTap: () => Navigator.push(context, PaymentMethodScreen.route()),
                  ),
                ),
                SizedBox(height: 15.setHeight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: CommonText(
                        fontFamily: Constant.fontFamilyMedium500,
                        text: Languages.of(context).txtPrivacyPolicy,
                        textAlign: TextAlign.start,
                        textColor: CustomAppColor.of(context).black,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: CommonText(
                        fontFamily: Constant.fontFamilyMedium500,
                        textAlign: TextAlign.end,
                        text: Languages.of(context).txtTermsAndConditions,
                        textColor: CustomAppColor.of(context).black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.setHeight),
              ],
            ),
          )
        ],
      ),
    );
  }
}
