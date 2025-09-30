import 'package:flutter/material.dart';
import 'package:step_counter_screens_app_package/utils/app_assets.dart';
import 'package:step_counter_screens_app_package/utils/sizer_utils.dart';
import 'package:step_counter_screens_app_package/widgets/button/common_button.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  static Route<void> route() => MaterialPageRoute(builder: (context) => const SubscriptionScreen());

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final ValueNotifier<int> subscriptionNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.only(left: 15.setWidth, right: 15.setWidth, top: 0.topPadding, bottom: 0.bottomPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IgnorePointer(
                ignoring: true,
                child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      AppAssets.icClose,
                      height: 24.setHeight,
                      width: 24.setWidth,
                      color: CustomAppColor.of(context).txtBlack,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25.setHeight),
              CommonText(
                text: Languages.of(context).txtGetAccessToAllCourcesAndFeatures.toUpperCase(),
                fontSize: 20.setFontSize,
                fontWeight: FontWeight.w700,
                textColor: CustomAppColor.of(context).txtBlack,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 15.setHeight),
              CommonText(
                text: Languages.of(context).txtChooseASubscriptionPlanToUnlockAllTheFunctionalityOfTheApplication,
                fontSize: 14.setFontSize,
                fontWeight: FontWeight.w500,
                textColor: CustomAppColor.of(context).txtDarkGray,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 25.setHeight),
              Row(
                children: [
                  Image.asset(
                    AppAssets.icRoundTrue,
                    height: 22.setHeight,
                    width: 33.setWidth,
                  ),
                  SizedBox(width: 8.setWidth),
                  Expanded(
                    child: CommonText(
                      text: Languages.of(context).txtUnlockOver15Cources,
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).txtBlack,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.setHeight),
              Row(
                children: [
                  Image.asset(
                    AppAssets.icRoundTrue,
                    height: 22.setHeight,
                    width: 33.setWidth,
                  ),
                  SizedBox(width: 8.setWidth),
                  Expanded(
                    child: CommonText(
                      text: Languages.of(context).txtUnlockOver120LearningChats,
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).txtBlack,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.setHeight),
              Row(
                children: [
                  Image.asset(
                    AppAssets.icRoundTrue,
                    height: 22.setHeight,
                    width: 33.setWidth,
                  ),
                  SizedBox(width: 8.setWidth),
                  Expanded(
                    child: CommonText(
                      text: Languages.of(context).txtSaveUpTo1000Wards,
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).txtBlack,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25.setHeight),
              CommonText(
                text: Languages.of(context).txtSelectYourSubcription,
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtBlack,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 20.setHeight),
              ValueListenableBuilder(
                valueListenable: subscriptionNotifier,
                builder: (context, value, child) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          subscriptionNotifier.value = 0;
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 14.setHeight),
                          decoration: BoxDecoration(
                            color: CustomAppColor.of(context).bgContainerLightAndDark,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: value == 0 ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgContainerLightAndDark,
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                AppAssets.icRoundStar,
                                height: 30.setHeight,
                                width: 30.setWidth,
                              ),
                              SizedBox(width: 10.setWidth),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonText(
                                      text: "3 ${Languages.of(context).txtMonths}",
                                      fontSize: 16.setFontSize,
                                      fontWeight: FontWeight.w600,
                                      textColor: CustomAppColor.of(context).txtBlack,
                                      textAlign: TextAlign.start,
                                    ),
                                    CommonText(
                                      text: "\$9.86 ${Languages.of(context).txtPerMonth}",
                                      fontSize: 12.setFontSize,
                                      fontWeight: FontWeight.w500,
                                      textColor: CustomAppColor.of(context).txtDarkGray,
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              ),
                              CommonText(
                                text: "\$30.99",
                                fontSize: 16.setFontSize,
                                fontWeight: FontWeight.w600,
                                textColor: value == 0 ? CustomAppColor.of(context).txtPrimary : CustomAppColor.of(context).txtBlack,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 12.setHeight),
                      InkWell(
                        onTap: () {
                          subscriptionNotifier.value = 1;
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 14.setHeight),
                          decoration: BoxDecoration(
                            color: CustomAppColor.of(context).bgContainerLightAndDark,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: value == 1 ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgContainerLightAndDark,
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                AppAssets.icRoundDiamond,
                                height: 30.setHeight,
                                width: 30.setWidth,
                              ),
                              SizedBox(width: 10.setWidth),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonText(
                                      text: "6 ${Languages.of(context).txtMonths}",
                                      fontSize: 16.setFontSize,
                                      fontWeight: FontWeight.w600,
                                      textColor: CustomAppColor.of(context).txtBlack,
                                      textAlign: TextAlign.start,
                                    ),
                                    CommonText(
                                      text: "\$9.86 ${Languages.of(context).txtPerMonth}",
                                      fontSize: 12.setFontSize,
                                      fontWeight: FontWeight.w500,
                                      textColor: CustomAppColor.of(context).txtDarkGray,
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              ),
                              CommonText(
                                text: "\$50.99",
                                fontSize: 16.setFontSize,
                                fontWeight: FontWeight.w600,
                                textColor: value == 1 ? CustomAppColor.of(context).txtPrimary : CustomAppColor.of(context).txtBlack,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 12.setHeight),
                      InkWell(
                        onTap: () {
                          subscriptionNotifier.value = 2;
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 14.setHeight),
                          decoration: BoxDecoration(
                            color: CustomAppColor.of(context).bgContainerLightAndDark,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: value == 2 ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgContainerLightAndDark,
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                AppAssets.icRoundKing,
                                height: 30.setHeight,
                                width: 30.setWidth,
                              ),
                              SizedBox(width: 10.setWidth),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonText(
                                      text: "12 ${Languages.of(context).txtMonths}",
                                      fontSize: 16.setFontSize,
                                      fontWeight: FontWeight.w600,
                                      textColor: CustomAppColor.of(context).txtBlack,
                                      textAlign: TextAlign.start,
                                    ),
                                    CommonText(
                                      text: "\$9.86 ${Languages.of(context).txtPerMonth}",
                                      fontSize: 12.setFontSize,
                                      fontWeight: FontWeight.w500,
                                      textColor: CustomAppColor.of(context).txtDarkGray,
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              ),
                              CommonText(
                                text: "\$79.99",
                                fontSize: 16.setFontSize,
                                fontWeight: FontWeight.w600,
                                textColor: value == 2 ? CustomAppColor.of(context).txtPrimary : CustomAppColor.of(context).txtBlack,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 0.screenHeight / 12),
              IgnorePointer(
                ignoring: true,
                child: CommonButton(
                  height: 50.setHeight,
                  text: Languages.of(context).txtContinue.toUpperCase(),
                  buttonTextSize: 16.setFontSize,
                  buttonTextWeight: FontWeight.w600,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  stackImage: AppAssets.icArrowRight,
                  imageSize: 30.setHeight,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
