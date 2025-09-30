import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:step_counter_screens_app_package/ui/subscription/view/subscription_screen.dart';
import 'package:step_counter_screens_app_package/utils/app_assets.dart';
import 'package:step_counter_screens_app_package/utils/debug.dart';
import 'package:step_counter_screens_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
import '../../../utils/utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../app/my_app.dart';
import '../../instructions/view/instructions_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ValueNotifier<bool> isDarkMode = ValueNotifier<bool>(false);
  ValueNotifier<bool> isGoogleFit = ValueNotifier<bool>(false);
  ValueNotifier<bool> isWaterTracker = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    bool isDarkModePref = !Utils.isLightTheme();
    isDarkMode.value = isDarkModePref;
    /* isDarkMode.value = !getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: false);*/
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
            child: CommonText(
              text: Languages.of(context).txtProfile,
              fontSize: 20.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).txtBlack,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, top: 20.setHeight, bottom: 30.setHeight),
              child: IgnorePointer(
                ignoring: true,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(context, SubscriptionScreen.route()),
                      child: Container(
                        decoration: BoxDecoration(
                          color: CustomAppColor.of(context).primary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12.setHeight, horizontal: 10.setWidth),
                        child: Row(
                          children: [
                            Image.asset(
                              AppAssets.imgCrown,
                              width: 65.setWidth,
                              height: 65.setHeight,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 8.setWidth),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text: "Subscription",
                                    fontSize: 18.setFontSize,
                                    fontWeight: FontWeight.w600,
                                    textColor: CustomAppColor.of(context).white,
                                  ),
                                  SizedBox(height: 4.setHeight),
                                  CommonText(
                                    text: "Choose a Subscription plan to unlock all the functionality of the application",
                                    fontSize: 11.setFontSize,
                                    textAlign: TextAlign.start,
                                    fontWeight: FontWeight.w400,
                                    textColor: CustomAppColor.of(context).white,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 25.setHeight),
                    _stepTrackerAndAchievementView(),
                    SizedBox(height: 25.setHeight),
                    _accountSettingsView(),
                    SizedBox(height: 25.setHeight),
                    _termsAndSupportView(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _stepTrackerAndAchievementView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: Languages.of(context).txtStepTrackerAndAchievement.toUpperCase(),
          fontSize: 16.setFontSize,
          fontWeight: FontWeight.w600,
          textColor: CustomAppColor.of(context).txtBlack,
        ),
        SizedBox(height: 12.setHeight),
        Container(
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: CustomAppColor.of(context).borderColor),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 18.setHeight),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CommonText(
                          text: "1927",
                          fontSize: 18.setFontSize,
                          fontWeight: FontWeight.w700,
                          textColor: CustomAppColor.of(context).colorCalories,
                        ),
                        CommonText(
                          text: Languages.of(context).txtKcal,
                          fontSize: 12.setFontSize,
                          fontWeight: FontWeight.w400,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CommonText(
                          text: "43,003",
                          fontSize: 18.setFontSize,
                          fontWeight: FontWeight.w700,
                          textColor: CustomAppColor.of(context).colorSteps,
                        ),
                        CommonText(
                          text: Languages.of(context).txtSteps,
                          fontSize: 12.setFontSize,
                          fontWeight: FontWeight.w400,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CommonText(
                          text: "75",
                          fontSize: 18.setFontSize,
                          fontWeight: FontWeight.w700,
                          textColor: CustomAppColor.of(context).colorDistance,
                        ),
                        CommonText(
                          text: Languages.of(context).txtKm,
                          fontSize: 12.setFontSize,
                          fontWeight: FontWeight.w400,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                color: CustomAppColor.of(context).dividerColor,
                thickness: 1,
                height: 30.setHeight,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.setWidth),
                child: Row(
                  children: [
                    Image.asset(
                      AppAssets.icAchievementsMedal,
                      height: 35.setHeight,
                      width: 30.setWidth,
                    ),
                    SizedBox(width: 10.setWidth),
                    Expanded(
                      child: CommonText(
                        text: Languages.of(context).txtAchievements,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(width: 10.setWidth),
                    CommonText(
                      text: "6",
                      fontSize: 20.setFontSize,
                      fontWeight: FontWeight.w700,
                      textColor: CustomAppColor.of(context).txtPrimary,
                    ),
                    SizedBox(width: 5.setWidth),
                    Image.asset(
                      AppAssets.icArrowRight,
                      height: 28.setHeight,
                      width: 28.setHeight,
                      color: CustomAppColor.of(context).txtBlack,
                    ),
                  ],
                ),
              ),
              Divider(
                color: CustomAppColor.of(context).dividerColor,
                thickness: 1,
                height: 30.setHeight,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.setWidth),
                child: Row(
                  children: [
                    Image.asset(
                      AppAssets.icHistoryProfile,
                      height: 26.setHeight,
                      width: 26.setHeight,
                    ),
                    SizedBox(width: 12.setWidth),
                    Expanded(
                      child: CommonText(
                        text: Languages.of(context).txtHistory,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(width: 10.setWidth),
                    Image.asset(
                      AppAssets.icArrowRight,
                      height: 28.setHeight,
                      width: 28.setHeight,
                      color: CustomAppColor.of(context).txtBlack,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  _accountSettingsView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: Languages.of(context).txtAccountSettings.toUpperCase(),
          fontSize: 16.setFontSize,
          fontWeight: FontWeight.w600,
          textColor: CustomAppColor.of(context).txtBlack,
        ),
        SizedBox(height: 12.setHeight),
        Container(
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: CustomAppColor.of(context).borderColor),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 18.setHeight),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
                child: Row(
                  children: [
                    Image.asset(
                      AppAssets.icGoogle,
                      height: 20.setHeight,
                      width: 20.setHeight,
                    ),
                    SizedBox(width: 14.setWidth),
                    Expanded(
                      child: CommonText(
                        text: Languages.of(context).txtBackupAndRestore,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(width: 10.setWidth),
                    Image.asset(
                      AppAssets.icSync,
                      height: 18.setHeight,
                      width: 18.setHeight,
                      color: CustomAppColor.of(context).txtBlack,
                    ),
                  ],
                ),
              ),
              Divider(
                color: CustomAppColor.of(context).dividerColor,
                thickness: 1,
                height: 45.setHeight,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.setWidth, right: 8.setWidth),
                child: Row(
                  children: [
                    Image.asset(
                      AppAssets.icGoogleFit,
                      height: 22.setHeight,
                      width: 22.setHeight,
                    ),
                    SizedBox(width: 14.setWidth),
                    Expanded(
                      child: CommonText(
                        text: Languages.of(context).txtGoogleFit,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.start,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: isGoogleFit,
                      builder: (context, value, child) {
                        return FlutterSwitch(
                          value: value,
                          onToggle: (bool newValue) {
                            isGoogleFit.value = newValue;
                            Debug.printLoge("isGoogleFit.value", "${isGoogleFit.value}");
                          },
                          activeColor: CustomAppColor.of(context).primary,
                          inactiveColor: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
                          activeToggleColor: CustomAppColor.of(context).white,
                          inactiveToggleColor: CustomAppColor.of(context).white,
                          width: 40.setWidth,
                          height: 20.setHeight,
                          toggleSize: 16.0,
                          borderRadius: 16.0,
                          padding: 3.5,
                        );
                      },
                    ),
                  ],
                ),
              ),
              Divider(
                color: CustomAppColor.of(context).dividerColor,
                thickness: 1,
                height: 45.setHeight,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.setWidth),
                child: Row(
                  children: [
                    Image.asset(
                      AppAssets.icWaterTracker,
                      height: 26.setHeight,
                      width: 26.setHeight,
                    ),
                    SizedBox(width: 12.setWidth),
                    Expanded(
                      child: CommonText(
                        text: Languages.of(context).txtWaterTracker,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(width: 10.setWidth),
                    ValueListenableBuilder(
                      valueListenable: isWaterTracker,
                      builder: (context, value, child) {
                        return FlutterSwitch(
                          value: value,
                          onToggle: (bool newValue) {
                            isWaterTracker.value = newValue;
                            Debug.printLoge("isWaterTracker.value", "${isWaterTracker.value}");
                          },
                          activeColor: CustomAppColor.of(context).primary,
                          inactiveColor: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
                          activeToggleColor: CustomAppColor.of(context).white,
                          inactiveToggleColor: CustomAppColor.of(context).white,
                          width: 40.setWidth,
                          height: 20.setHeight,
                          toggleSize: 16.0,
                          borderRadius: 16.0,
                          padding: 3.5,
                        );
                      },
                    )
                  ],
                ),
              ),
              Divider(
                color: CustomAppColor.of(context).dividerColor,
                thickness: 1,
                height: 45.setHeight,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
                child: Row(
                  children: [
                    Image.asset(
                      AppAssets.icDarkMode,
                      height: 24.setHeight,
                      width: 24.setHeight,
                    ),
                    SizedBox(width: 14.setWidth),
                    Expanded(
                      child: CommonText(
                        text: Languages.of(context).txtDarkMode,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(width: 10.setWidth),
                    ValueListenableBuilder(
                      valueListenable: isDarkMode,
                      builder: (context, value, child) {
                        return FlutterSwitch(
                          value: value,
                          onToggle: (bool newValue) async {
                            isDarkMode.value = newValue;
                            getIt.get<LocalStorageService>().setBool(LocalStorageService.isLightTheme, !newValue);
                            await Future.delayed(const Duration(milliseconds: 100));
                            Debug.printLoge("isDarkMode.value", "${isDarkMode.value} ${getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: false)} ");
                            // ignore: use_build_context_synchronously
                            final newTheme = newValue ? ThemeData.dark() : ThemeData.light();
                            StepCounterScreensApp.changeTheme(context, newTheme);
                          },
                          activeColor: CustomAppColor.of(context).primary,
                          inactiveColor: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
                          activeToggleColor: CustomAppColor.of(context).white,
                          inactiveToggleColor: CustomAppColor.of(context).white,
                          width: 40.setWidth,
                          height: 20.setHeight,
                          toggleSize: 16.0,
                          borderRadius: 16.0,
                          padding: 3.5,
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  _termsAndSupportView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: Languages.of(context).txtTermsAndSupport.toUpperCase(),
          fontSize: 16.setFontSize,
          fontWeight: FontWeight.w600,
          textColor: CustomAppColor.of(context).txtBlack,
        ),
        SizedBox(height: 12.setHeight),
        Container(
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: CustomAppColor.of(context).borderColor),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 18.setHeight),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, InstructionsScreen.route());
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.setWidth),
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.icInstructions,
                        height: 22.setHeight,
                        width: 22.setHeight,
                      ),
                      SizedBox(width: 14.setWidth),
                      Expanded(
                        child: CommonText(
                          text: Languages.of(context).txtInstruction,
                          fontSize: 16.setFontSize,
                          fontWeight: FontWeight.w400,
                          textColor: CustomAppColor.of(context).txtBlack,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(width: 10.setWidth),
                      Image.asset(
                        AppAssets.icArrowRight,
                        height: 28.setHeight,
                        width: 28.setHeight,
                        color: CustomAppColor.of(context).txtBlack,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: CustomAppColor.of(context).dividerColor,
                thickness: 1,
                height: 40.setHeight,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.setWidth),
                child: Row(
                  children: [
                    Image.asset(
                      AppAssets.icFeedback,
                      height: 23.setHeight,
                      width: 24.setHeight,
                    ),
                    SizedBox(width: 14.setWidth),
                    Expanded(
                      child: CommonText(
                        text: Languages.of(context).txtFeedback,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtBlack,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(width: 10.setWidth),
                    Image.asset(
                      AppAssets.icArrowRight,
                      height: 28.setHeight,
                      width: 28.setHeight,
                      color: CustomAppColor.of(context).txtBlack,
                    ),
                  ],
                ),
              ),
              Divider(
                color: CustomAppColor.of(context).dividerColor,
                thickness: 1,
                height: 40.setHeight,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, SubscriptionScreen.route());
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.setWidth),
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.icRemoveAds,
                        height: 22.setHeight,
                        width: 22.setHeight,
                      ),
                      SizedBox(width: 14.setWidth),
                      Expanded(
                        child: CommonText(
                          text: Languages.of(context).txtRemoveAds,
                          fontSize: 16.setFontSize,
                          fontWeight: FontWeight.w400,
                          textColor: CustomAppColor.of(context).txtBlack,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(width: 10.setWidth),
                      Image.asset(
                        AppAssets.icArrowRight,
                        height: 28.setHeight,
                        width: 28.setHeight,
                        color: CustomAppColor.of(context).txtBlack,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
