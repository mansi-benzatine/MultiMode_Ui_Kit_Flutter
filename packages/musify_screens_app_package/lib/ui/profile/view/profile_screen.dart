import 'package:flutter/material.dart';
import 'package:musify_screens_app_package/dialogs/bottom_sheet/logout_bottom_sheet.dart';
import 'package:musify_screens_app_package/ui/app/my_app.dart';
import 'package:musify_screens_app_package/ui/edit_profile/view/edit_profile_screen.dart';
import 'package:musify_screens_app_package/ui/faq/view/faq_screen.dart';
import 'package:musify_screens_app_package/ui/notification_setting/view/notification_setting_screen.dart';
import 'package:musify_screens_app_package/ui/payment_method/view/payment_method_screen.dart';
import 'package:musify_screens_app_package/ui/privacy_policy/view/privacy_policy_screen.dart';
import 'package:musify_screens_app_package/utils/sizer_utils.dart';
import 'package:musify_screens_app_package/utils/utils.dart';

import '../../../dialogs/bottom_sheet/delete_account_bottom_sheet.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/debug.dart';
import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../home/view/home_all_page.dart';
import '../../language_setting/view/language_setting_screen.dart';
import '../../premium_plan_list/view/premium_plan_list_screen.dart';

class ProfileScreen extends StatefulWidget {
  final bool isForDeleteDialog;
  final bool isForLogoutDialog;
  const ProfileScreen({super.key, this.isForLogoutDialog = false, this.isForDeleteDialog = false});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> implements TopBarClickListener {
  final ValueNotifier<bool> isDarkMode = ValueNotifier(false);
  _fillData() {
    bool isDarkModePref = !Utils.isLightTheme();
    isDarkMode.value = isDarkModePref;
  }

  @override
  void initState() {
    super.initState();
    _fillData();
    if (widget.isForLogoutDialog) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showModalBottomSheet(
          isDismissible: false,
          context: context,
          builder: (dialogContext) => PopScope(
              canPop: false,
              onPopInvokedWithResult: (didPop, result) {
                if (!didPop) {
                  Navigator.pop(dialogContext);
                  Navigator.pop(context);
                }
              },
              child: const LogoutBottomSheet()),
        );
      });
    }

    if (widget.isForDeleteDialog) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showModalBottomSheet(
          isDismissible: false,
          context: context,
          builder: (dialogContext) => PopScope(
              canPop: false,
              onPopInvokedWithResult: (didPop, result) {
                if (!didPop) {
                  Navigator.pop(dialogContext);
                  Navigator.pop(context);
                }
              },
              child: const DeleteAccountBottomSheet()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.imgCommonBackgroundPlain),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.setWidth),
              child: TopBar(
                this,
                title: Languages.of(context).txtProfile,
                alignment: Alignment.topLeft,
                isShowBack: false,
              ),
            ),
            ValueListenableBuilder<MusicItemData?>(
                valueListenable: MusifyScreensApp.playingMusicNotifier,
                builder: (context, playingMusic, child) {
                  final isMiniPlayerVisible = playingMusic != null;

                  return Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                        bottom: isMiniPlayerVisible ? 110.setHeight : 60.setHeight,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 5.setHeight),

                          // Profile Section
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.setWidth),
                            child: Row(
                              children: [
                                // Profile Image
                                Stack(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(5.setWidth),
                                      child: ClipOval(
                                        child: Image.asset(
                                          AppAssets.imgDummyGirl,
                                          width: 50.setWidth,
                                          height: 50.setHeight,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Container(
                                              width: 50.setWidth,
                                              height: 50.setHeight,
                                              decoration: BoxDecoration(
                                                color: CustomAppColor.of(context).primary.withOpacityPercent(0.1),
                                                borderRadius: BorderRadius.circular(25.setWidth),
                                              ),
                                              child: Icon(
                                                Icons.person,
                                                color: CustomAppColor.of(context).primary,
                                                size: 24.setWidth,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 5.setHeight,
                                      right: 5.setWidth,
                                      child: Container(
                                        width: 16.setWidth,
                                        height: 16.setHeight,
                                        decoration: BoxDecoration(
                                          color: CustomAppColor.of(context).primary,
                                          shape: BoxShape.circle,
                                        ),
                                        padding: EdgeInsets.all(4.setWidth),
                                        child: Image.asset(
                                          AppAssets.icEdit,
                                          width: 12.setWidth,
                                          height: 12.setHeight,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(width: 10.setWidth),

                                // Profile Info
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonText(
                                      text: "Stilva Larsen",
                                      fontSize: 18.setFontSize,
                                      fontWeight: FontWeight.w700,
                                      textColor: CustomAppColor.of(context).txtBlack,
                                      fontFamily: Constant.fontFamily,
                                      height: 0,
                                    ),
                                    CommonText(
                                      text: "@stilvalarsern",
                                      fontSize: 14.setFontSize,
                                      fontWeight: FontWeight.w400,
                                      textColor: CustomAppColor.of(context).txtBlack,
                                      fontFamily: Constant.fontFamily,
                                      height: 0,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20.setHeight),

                          // Premium Card
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.setWidth),
                            padding: EdgeInsets.all(20.setWidth),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.setWidth),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  CustomAppColor.of(context).primary.withOpacityPercent(0.3),
                                  CustomAppColor.of(context).txtWhite,
                                ],
                                stops: const [0, 0.6],
                              ),
                              border: Border.all(
                                color: CustomAppColor.of(context).primary.withOpacityPercent(0.2),
                                width: 1.5,
                              ),
                            ),
                            child: Column(
                              children: [
                                // Crown Icon
                                Container(
                                  width: 80.setWidth,
                                  height: 80.setHeight,
                                  padding: EdgeInsets.all(10.setWidth),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CustomAppColor.of(context).primary,
                                  ),
                                  child: Image.asset(
                                    AppAssets.icPremiumProfile,
                                    width: 60.setWidth,
                                    height: 60.setHeight,
                                    fit: BoxFit.contain,
                                  ),
                                ),

                                SizedBox(height: 16.setHeight),

                                CommonText(
                                  text: Languages.of(context).txtAppName,
                                  fontSize: 20.setFontSize,
                                  fontWeight: FontWeight.w700,
                                  textColor: CustomAppColor.of(context).txtBlack,
                                  fontFamily: Constant.fontFamily,
                                ),

                                SizedBox(height: 6.setHeight),

                                CommonText(
                                  text: Languages.of(context).txtUpgradePlanToUnlockMoreFeatures,
                                  fontSize: 14.setFontSize,
                                  fontWeight: FontWeight.w600,
                                  textColor: CustomAppColor.of(context).txtBlack,
                                  fontFamily: Constant.fontFamily,
                                  textAlign: TextAlign.center,
                                ),

                                SizedBox(height: 20.setHeight),

                                IgnorePointer(
                                  ignoring: true,
                                  child: CommonButton(
                                    text: Languages.of(context).txtGetPremium,
                                    onTap: () {
                                      // Handle premium upgrade
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PremiumPlanListScreen()));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 15.setHeight),

                          // Settings List
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 22.setWidth),
                            child: Column(
                              children: [
                                _buildSettingsItem(
                                  icon: AppAssets.icEditProfile,
                                  title: Languages.of(context).txtEditProfile,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const EditProfileScreen(),
                                      ),
                                    );
                                  },
                                ),
                                _buildSettingsItem(
                                  icon: AppAssets.icNotification,
                                  title: Languages.of(context).txtNotification,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const NotificationSettingScreen(),
                                      ),
                                    );
                                  },
                                ),
                                _buildSettingsItem(
                                  icon: AppAssets.icPayment,
                                  title: Languages.of(context).txtPaymentMethod,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const PaymentMethodScreen(),
                                      ),
                                    );
                                  },
                                ),
                                _buildSettingsItem(
                                  icon: AppAssets.icLanguage,
                                  title: Languages.of(context).txtLanguages,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const LanguageSettingScreen(),
                                      ),
                                    );
                                  },
                                ),
                                _buildSettingsItem(
                                  icon: AppAssets.icTheme,
                                  title: Languages.of(context).txtDarkMode,
                                  onTap: () {},
                                  hasSwitch: true,
                                ),
                                _buildSettingsItem(
                                  icon: AppAssets.icPrivacy,
                                  title: Languages.of(context).txtPrivacyPolicy,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const PrivacyPolicyScreen(),
                                      ),
                                    );
                                  },
                                ),
                                _buildSettingsItem(
                                  icon: AppAssets.icFaq,
                                  title: Languages.of(context).txtFaq,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const FaqScreen(),
                                      ),
                                    );
                                  },
                                ),
                                _buildSettingsItem(
                                  icon: AppAssets.icDeleteAccount,
                                  title: Languages.of(context).txtDeleteAccount,
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) => const DeleteAccountBottomSheet(),
                                    );
                                  },
                                  isDestructive: true,
                                ),
                                _buildSettingsItem(
                                  icon: AppAssets.icLogout,
                                  title: Languages.of(context).txtLogout,
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) => const LogoutBottomSheet(),
                                    );
                                  },
                                  isDestructive: true,
                                  isLastItem: true,
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 50.setHeight),
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required String icon,
    required String title,
    required VoidCallback onTap,
    bool hasSwitch = false,
    bool isDestructive = false,
    bool isLastItem = false,
  }) {
    return IgnorePointer(
      ignoring: true,
      child: InkWell(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 15.setHeight),
            decoration: BoxDecoration(
              border: (isLastItem)
                  ? null
                  : Border(
                      bottom: BorderSide(
                        color: CustomAppColor.of(context).containerBorder,
                      ),
                    ),
            ),
            child: Row(
              children: [
                Image.asset(
                  icon,
                  color: isDestructive ? CustomAppColor.of(context).red : CustomAppColor.of(context).txtBlack,
                  width: 22.setWidth,
                  height: 22.setHeight,
                ),
                SizedBox(width: 10.setWidth),
                Expanded(
                  child: CommonText(
                    text: title,
                    fontSize: 16.setFontSize,
                    fontWeight: FontWeight.w600,
                    textColor: isDestructive ? CustomAppColor.of(context).red : CustomAppColor.of(context).txtBlack,
                    fontFamily: Constant.fontFamily,
                    textAlign: TextAlign.start,
                  ),
                ),
                if (!isDestructive)
                  hasSwitch
                      ? ValueListenableBuilder(
                          valueListenable: isDarkMode,
                          builder: (context, value, child) {
                            return SizedBox(
                              width: 45.setWidth,
                              height: 18.setHeight,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Switch(
                                  value: isDarkMode.value,
                                  onChanged: (value) {
                                    isDarkMode.value = value;
                                    getIt.get<LocalStorageService>().setBool(LocalStorageService.isLightTheme, !value);
                                    Debug.printLoge("isDarkMode.value", "${isDarkMode.value} ${getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: false)} ");
                                    final newTheme = value ? ThemeData.dark() : ThemeData.light();
                                    MusifyScreensApp.changeTheme(context, newTheme);
                                  },
                                  activeColor: CustomAppColor.of(context).primary,
                                  inactiveThumbColor: CustomAppColor.of(context).white,
                                  inactiveTrackColor: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                                  activeTrackColor: CustomAppColor.of(context).primary,
                                  thumbColor: WidgetStateProperty.all(CustomAppColor.of(context).white),
                                  trackOutlineWidth: WidgetStateProperty.all(0),
                                  trackOutlineColor: WidgetStateProperty.all(CustomAppColor.of(context).transparent),
                                ),
                              ),
                            );
                          },
                        )
                      : Icon(
                          Icons.arrow_forward_ios,
                          color: CustomAppColor.of(context).txtBlack,
                          size: 16.setWidth,
                        ),
              ],
            )),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {}
}
