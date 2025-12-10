import 'package:baby_bloom_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_app/localization/language/languages.dart';
import 'package:baby_bloom_app/ui/app/my_app.dart';
import 'package:baby_bloom_app/ui/edit_profile/view/edit_profile_screen.dart';
import 'package:baby_bloom_app/ui/help_center/view/help_center_screen.dart';
import 'package:baby_bloom_app/ui/languages/view/languages_screen.dart';
import 'package:baby_bloom_app/ui/notification_history/view/notification_history_screen.dart';
import 'package:baby_bloom_app/ui/privacy_policy/view/privacy_policy_screen.dart';
import 'package:baby_bloom_app/ui/profile_setup/views/your_weight_screen.dart';
import 'package:baby_bloom_app/ui/terms_and_conditions/view/terms_and_conditions_screen.dart';
import 'package:baby_bloom_app/ui/upgrade_plan/view/upgrade_plan_screen.dart';
import 'package:baby_bloom_app/utils/app_assets.dart';
import 'package:baby_bloom_app/utils/app_color.dart';
import 'package:baby_bloom_app/utils/constant.dart';
import 'package:baby_bloom_app/utils/preference.dart';
import 'package:baby_bloom_app/utils/sizer_utils.dart';
import 'package:baby_bloom_app/widgets/alert_dialog/logout_aleart_dialog.dart';
import 'package:baby_bloom_app/widgets/alert_dialog/pregnancy_loss_alert_dialog.dart';
import 'package:baby_bloom_app/widgets/alert_dialog/rate_us_alert_dialog.dart';
import 'package:baby_bloom_app/widgets/text/common_text.dart';
import 'package:baby_bloom_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../utils/service_locator.dart';
import '../../../utils/utils.dart';
import '../../../widgets/bottom_sheet/edit_due_date_bottom_sheet.dart';
import '../datamodel/my_profile_data.dart';

class MyProfileScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const MyProfileScreen());
  }

  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> implements TopBarClickListener {
  List<ProfileOption> myInformationList(BuildContext context) {
    return [
      ProfileOption(
        title: Languages.of(context).txtEditProfile,
        icon: AppAssets.icUser,
        onTap: () {
          Navigator.push(context, EditProfileScreen.route());
        },
      ),
      ProfileOption(
        title: "15/04/2026",
        icon: AppAssets.icCalender,
        trailString: Languages.of(context).txtChangeDueDate,
        onTap: () {
          Utils.showBottomSheetDialog(
            context,
            isScrollControlled: true,
            widgets: const EditDueDateBottomSheet(),
          );
        },
      ),
      ProfileOption(
        title: "60 kg",
        icon: AppAssets.icUnfilledWeight,
        trailString: Languages.of(context).txtChange,
        onTap: () {
          Navigator.push(context, YourWeightScreen.route());
        },
      ),
      ProfileOption(
        title: Languages.of(context).txtPregnancyLoss,
        icon: AppAssets.icSadEmoji,
        hasToggle: true,
        toggleValue: false,
      ),
    ];
  }

  List<ProfileOption> personalizationList(BuildContext context) {
    return [
      ProfileOption(
        title: Languages.of(context).txtNotificationHistory,
        icon: AppAssets.icNotification,
        onTap: () {
          Navigator.push(context, NotificationHistoryScreen.route());
        },
      ),
      ProfileOption(
        title: Languages.of(context).txtLanguages,
        icon: AppAssets.icLanguage,
        onTap: () {
          Navigator.push(context, LanguagesScreen.route());
        },
      ),
      ProfileOption(
        title: Languages.of(context).txtDarkMode,
        icon: AppAssets.icMoon,
        hasToggle: true,
        toggleValue: false,
      ),
    ];
  }

  List<ProfileOption> otherList(BuildContext context) {
    return [
      ProfileOption(
        title: Languages.of(context).txtRateUs,
        icon: AppAssets.icStar,
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return const ReviewAlertDialog();
            },
          );
        },
      ),
      ProfileOption(
        title: Languages.of(context).txtPrivacyPolicy,
        icon: AppAssets.icShield,
        onTap: () {
          Navigator.push(context, PrivacyPolicyScreen.route());
        },
      ),
      ProfileOption(
        title: Languages.of(context).txtTermsAndConditions,
        icon: AppAssets.icInfo,
        onTap: () {
          Navigator.push(context, TermsAndConditionScreen.route());
        },
      ),
      ProfileOption(
        title: Languages.of(context).txtHelpCenter,
        icon: AppAssets.icMsg,
        onTap: () {
          Navigator.push(context, HelpCenterScreen.route());
        },
      ),
      ProfileOption(
        title: Languages.of(context).txtLogout,
        icon: AppAssets.icLogout,
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return const LogoutDialog();
            },
          );
        },
      ),
    ];
  }

  ValueNotifier<bool> isDarkMode = ValueNotifier(false);
  ValueNotifier<bool> isPregnancyLoss = ValueNotifier(false);

  _fillData() {
    bool isDarkModePref = !Utils.isLightTheme();
    isDarkMode.value = isDarkModePref;
  }

  @override
  void initState() {
    super.initState();
    _fillData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtMyProfile,
            isShowBack: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    profileInformationView(),
                    GestureDetector(onTap: () => Navigator.push(context, UpgradePlanScreen.route()), child: Image.asset(AppAssets.imgContainerUpgradePlan)),
                    SizedBox(height: 15.setHeight),
                    CommonText(
                      fontSize: 15.setFontSize,
                      text: Languages.of(context).txtMyInformation,
                      textColor: CustomAppColor.of(context).txtLightGrey,
                    ),
                    SizedBox(height: 15.setHeight),
                    myProfileSettingsView(myInformationList(context)),
                    SizedBox(height: 15.setHeight),
                    CommonText(
                      fontSize: 15.setFontSize,
                      text: Languages.of(context).txtPersonalization,
                      textColor: CustomAppColor.of(context).txtLightGrey,
                    ),
                    SizedBox(height: 15.setHeight),
                    myProfileSettingsView(personalizationList(context)),
                    SizedBox(height: 15.setHeight),
                    CommonText(
                      fontSize: 15.setFontSize,
                      text: Languages.of(context).txtOther,
                      textColor: CustomAppColor.of(context).txtLightGrey,
                    ),
                    SizedBox(height: 15.setHeight),
                    myProfileSettingsView(otherList(context)),
                    SizedBox(height: 60.setHeight),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget profileInformationView() {
    return Row(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 30,
              child: Image.asset(
                AppAssets.imgDummyProfile,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomAppColor.of(context).black,
                  border: Border.all(
                    color: CustomAppColor.of(context).white,
                  ),
                ),
                padding: const EdgeInsets.all(3),
                child: Image.asset(
                  AppAssets.icEdit,
                  width: 9.setWidth,
                  height: 9.setHeight,
                ),
              ),
            )
          ],
        ),
        SizedBox(width: 10.setWidth),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: "Elvina Jack",
              fontFamily: Constant.fontFamilySemiBold600,
              fontSize: 16.setFontSize,
            ),
            CommonText(
              text: "elvina@yourdomain.com",
              textColor: CustomAppColor.of(context).txtLightGrey,
            ),
          ],
        )
      ],
    );
  }

  Widget myProfileSettingsView(List<ProfileOption> optionsList) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(
          height: 20.setHeight,
          thickness: .5,
        );
      },
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: optionsList.length,
      itemBuilder: (context, index) {
        final item = optionsList[index];
        return InkWell(
          onTap: item.onTap,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomAppColor.of(context).btnGrey,
                ),
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  item.icon,
                  width: 16.setWidth,
                  height: 16.setHeight,
                  color: item.title == Languages.of(context).txtLogout ? Colors.red : CustomAppColor.of(context).icBlackWhite,
                ),
              ),
              SizedBox(width: 16.setWidth),
              Expanded(
                child: CommonText(
                  text: item.title,
                  textColor: item.title == Languages.of(context).txtLogout ? Colors.red : CustomAppColor.of(context).txtBlack,
                  fontSize: 15.setFontSize,
                  textAlign: TextAlign.start,
                  fontFamily: Constant.fontFamilyMedium500,
                ),
              ),
              if (item.hasToggle && item.title == Languages.of(context).txtDarkMode)
                ValueListenableBuilder<bool>(
                  valueListenable: isDarkMode,
                  builder: (context, value, child) {
                    return FlutterSwitch(
                      value: value,
                      onToggle: (bool newValue) {
                        isDarkMode.value = newValue;
                        getIt.get<LocalStorageService>().setBool(
                              LocalStorageService.isLightTheme,
                              !newValue,
                            );
                        final newTheme = newValue ? ThemeData.dark() : ThemeData.light();
                        BabyBloomApp.changeTheme(context, newTheme);
                      },
                      activeColor: CustomAppColor.of(context).roundBg,
                      inactiveColor: CustomAppColor.of(context).txtGray.withValues(alpha: 0.4),
                      activeToggleColor: CustomAppColor.of(context).white,
                      inactiveToggleColor: CustomAppColor.of(context).white,
                      width: 40.setWidth,
                      height: 22.setHeight,
                      toggleSize: 16.0,
                      borderRadius: 16.0,
                      padding: 2.5,
                    );
                  },
                )
              else if (item.hasToggle && item.title != Languages.of(context).txtDarkMode)
                ValueListenableBuilder<bool>(
                  valueListenable: isPregnancyLoss,
                  builder: (context, value, child) {
                    return FlutterSwitch(
                      value: value,
                      onToggle: (bool newValue) {
                        isPregnancyLoss.value = newValue;
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const PregnancyLossAlertDialog();
                          },
                        );
                      },
                      activeColor: CustomAppColor.of(context).secondary,
                      inactiveColor: CustomAppColor.of(context).txtGray.withValues(alpha: 0.4),
                      activeToggleColor: CustomAppColor.of(context).white,
                      inactiveToggleColor: CustomAppColor.of(context).white,
                      width: 40.setWidth,
                      height: 22.setHeight,
                      toggleSize: 16.0,
                      borderRadius: 16.0,
                      padding: 2.5,
                    );
                  },
                )
              else if (item.trailString.isNotEmpty)
                CommonText(
                  text: item.trailString,
                  textColor: CustomAppColor.of(context).txtRed,
                  fontFamily: Constant.fontFamilyMedium500,
                )
              else
                const Icon(Icons.arrow_forward_ios_rounded, size: 18),
            ],
          ),
        );
      },
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
