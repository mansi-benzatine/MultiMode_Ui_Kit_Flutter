import 'package:flowly_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:flowly_screens_app/localization/language/languages.dart';
import 'package:flowly_screens_app/ui/app/my_app.dart';
import 'package:flowly_screens_app/ui/edit_profile/view/edit_profile_screen.dart';
import 'package:flowly_screens_app/ui/help_center/view/help_center_screen.dart';
import 'package:flowly_screens_app/ui/languages/view/languages_screen.dart';
import 'package:flowly_screens_app/ui/privacy_policy/view/privacy_policy_screen.dart';
import 'package:flowly_screens_app/ui/reminder/view/reminder_screen.dart';
import 'package:flowly_screens_app/ui/terms_and_condition/view/terms_and_condition_screen.dart';
import 'package:flowly_screens_app/ui/unlock_premium/view/unlock_premium_screen.dart';
import 'package:flowly_screens_app/utils/app_assets.dart';
import 'package:flowly_screens_app/utils/app_color.dart';
import 'package:flowly_screens_app/utils/constant.dart';
import 'package:flowly_screens_app/utils/preference.dart';
import 'package:flowly_screens_app/utils/sizer_utils.dart';
import 'package:flowly_screens_app/widgets/bottom_sheet/logout_bs.dart';
import 'package:flowly_screens_app/widgets/text/common_text.dart';
import 'package:flowly_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../utils/service_locator.dart';
import '../../../utils/utils.dart';
import '../datamodel/my_profile_data.dart';

class MyProfileScreen extends StatefulWidget {
  final bool isShowDeleteAccountBs;
  static Route<void> route({bool isShowDeleteAccount = false}) {
    return MaterialPageRoute(
      builder: (_) => MyProfileScreen(isShowDeleteAccountBs: isShowDeleteAccount),
    );
  }

  const MyProfileScreen({super.key, this.isShowDeleteAccountBs = false});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> implements TopBarClickListener {
  List<ProfileOption> myInformationList(BuildContext context) {
    return [
      ProfileOption(
        title: Languages.of(context).txtPersonalInformation,
        icon: AppAssets.icProfile,
        onTap: () {
          Navigator.push(context, EditProfileScreen.route());
        },
      ),
      ProfileOption(
        title: Languages.of(context).txtReminders,
        icon: AppAssets.icNotification,
        onTap: () {
          Navigator.push(context, ReminderScreen.route());
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
      ProfileOption(
        title: Languages.of(context).txtRateUs,
        icon: AppAssets.icStar,
        onTap: () {},
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
        icon: AppAssets.icHelpCenter,
        onTap: () {
          Navigator.push(context, HelpCenterScreen.route());
        },
      ),
      ProfileOption(
        title: Languages.of(context).txtLogout,
        icon: AppAssets.icDelete,
        onTap: () {
          Utils.showBottomSheetDialog(
            context,
            widgets: const LogoutBs(),
          );
        },
      ),
    ];
  }

  ValueNotifier<bool> isDarkMode = ValueNotifier(false);
  bool _isBottomSheetOpen = false;
  _fillData() {
    bool isDarkModePref = !Utils.isLightTheme();
    isDarkMode.value = isDarkModePref;
  }

  @override
  void initState() {
    super.initState();
    _fillData();

    if (widget.isShowDeleteAccountBs) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _isBottomSheetOpen = true;
        });
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          enableDrag: false,
          isDismissible: false,
          backgroundColor: Colors.transparent,
          builder: (_) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(
                child: Wrap(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).bgScreen,
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [LogoutBs()],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ).whenComplete(
          () {
            if (_isBottomSheetOpen) {
              setState(() {
                _isBottomSheetOpen = false;
              });
              Navigator.pop(context);
            }
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !_isBottomSheetOpen,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && _isBottomSheetOpen) {
          Navigator.pop(context);
          setState(() {
            _isBottomSheetOpen = false;
          });
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtMyProfile,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      profileInformationView(),
                      SizedBox(height: 15.setHeight),
                      IgnorePointer(
                        ignoring: true,
                        child: GestureDetector(
                          onTap: () => Navigator.push(context, UnlockPremiumScreen.route()),
                          child: unlockPremiumView(),
                        ),
                      ),
                      SizedBox(height: 15.setHeight),
                      Align(
                        alignment: Alignment.topLeft,
                        child: CommonText(
                          fontSize: 16.setFontSize,
                          text: Languages.of(context).txtSetting,
                          textColor: CustomAppColor.of(context).txtLightGrey,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(height: 15.setHeight),
                      myProfileSettingsView(myInformationList(context)),
                      SizedBox(height: 100.setHeight),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget profileInformationView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: 55,
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
                  width: 14.setWidth,
                  height: 14.setHeight,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 10.setHeight),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonText(
              text: "Lissa",
              fontFamily: Constant.fontFamilyMulishExtraBold800,
              fontSize: 16.setFontSize,
            ),
            CommonText(
              text: "lissa10@yourdomain.com",
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
        return IgnorePointer(
          ignoring: true,
          child: InkWell(
            onTap: item.onTap,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomAppColor.of(context).profileIconBg,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    item.icon,
                    width: 17.setWidth,
                    height: 17.setHeight,
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
                    fontFamily: Constant.fontFamilyMulishSemiBold600,
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
                          FlowlyScreensApp.changeTheme(context, newTheme);
                        },
                        activeColor: CustomAppColor.of(context).roundBg,
                        inactiveColor: CustomAppColor.of(context).txtGray.withValues(alpha: 0.4),
                        activeToggleColor: CustomAppColor.of(context).white,
                        inactiveToggleColor: CustomAppColor.of(context).white,
                        width: 40.setWidth,
                        height: 22.setHeight,
                        toggleSize: 20.0,
                        borderRadius: 16.0,
                        padding: 2.5,
                      );
                    },
                  )
                else if (item.trailString.isNotEmpty)
                  CommonText(
                    text: item.trailString,
                    textColor: CustomAppColor.of(context).txtRed,
                    fontFamily: Constant.fontFamilyMulishMedium500,
                  )
                else
                  const Icon(Icons.arrow_forward_ios_rounded, size: 18),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget unlockPremiumView() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFB0F1FF),
            Color(0xFFEECDF7),
            Color(0xFFFCD7C3),
          ],
          stops: [0.15, 0.6, 0.8],
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            AppAssets.icUpgradePlan,
            width: 50.setWidth,
            height: 50.setHeight,
          ),
          SizedBox(width: 12.setWidth),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: Languages.of(context).txtUnlockPremium,
                  fontFamily: Constant.fontFamilyMulishExtraBold800,
                  fontSize: 16.setFontSize,
                  textColor: CustomAppColor.of(context).black,
                ),
                CommonText(
                  text: Languages.of(context).txtUnlockPremiumDesc,
                  textAlign: TextAlign.start,
                  fontSize: 11.setFontSize,
                  textColor: CustomAppColor.of(context).txtGray,
                ),
              ],
            ),
          )
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
