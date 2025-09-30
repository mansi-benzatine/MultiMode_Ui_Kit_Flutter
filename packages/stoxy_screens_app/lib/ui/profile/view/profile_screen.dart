import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:stoxy_screens_app_package/dialogs/alerts/delete_account_dialog.dart';
import 'package:stoxy_screens_app_package/dialogs/alerts/logout_dialog.dart';
import 'package:stoxy_screens_app_package/ui/app/my_app.dart';
import 'package:stoxy_screens_app_package/ui/edit_profile/view/edit_profile_screen.dart';
import 'package:stoxy_screens_app_package/ui/help_center/view/help_center_screen.dart';
import 'package:stoxy_screens_app_package/ui/notification_setting/view/notification_setting_screen.dart';
import 'package:stoxy_screens_app_package/ui/privacy_policy/view/privacy_policy_screen.dart';
import 'package:stoxy_screens_app_package/ui/security/view/security_screen.dart';
import 'package:stoxy_screens_app_package/utils/sizer_utils.dart';
import 'package:stoxy_screens_app_package/utils/utils.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/debug.dart';
import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../language_setting/view/language_setting_screen.dart';
import '../../payment_method/view/payment_method_screen.dart';

class ProfileScreen extends StatefulWidget {
  final bool isForLogoutDialog;
  final bool isForDeleteAccount;

  static Route<void> route({bool isForLogoutDialog = false, bool isForDeleteAccountDialog = false}) {
    return MaterialPageRoute(
        builder: (_) => ProfileScreen(
              isForLogoutDialog: isForLogoutDialog,
              isForDeleteAccount: isForDeleteAccountDialog,
            ));
  }

  const ProfileScreen({super.key, this.isForDeleteAccount = false, this.isForLogoutDialog = false});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> implements TopBarClickListener {
  ValueNotifier<bool> isDarkMode = ValueNotifier(false);
  _fillData() {
    bool isDarkModePref = !Utils.isLightTheme();
    isDarkMode.value = isDarkModePref;
  }

  @override
  void initState() {
    super.initState();
    _fillData();

    if (widget.isForDeleteAccount) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          barrierDismissible: false,
          context: context,
          barrierColor: CustomAppColor.of(context).black.withOpacityPercent(0.3),
          builder: (dialogContext) => PopScope(
              canPop: false,
              onPopInvokedWithResult: (didPop, result) {
                if (!didPop) {
                  Navigator.pop(dialogContext);
                  Navigator.pop(context);
                }
              },
              child: const DeleteAccountDialog()),
        );
      });
    }
    if (widget.isForLogoutDialog) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          barrierDismissible: false,
          context: context,
          barrierColor: CustomAppColor.of(context).black.withOpacityPercent(0.3),
          builder: (dialogContext) => PopScope(
              canPop: false,
              onPopInvokedWithResult: (didPop, result) {
                if (!didPop) {
                  Navigator.pop(dialogContext);
                  Navigator.pop(context);
                }
              },
              child: const LogoutDialog()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        top: false,
        child: Container(
          decoration: BoxDecoration(
            image: getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: true)
                ? null
                : DecorationImage(
                    image: AssetImage(AppAssets.imgCommonBackground),
                    fit: BoxFit.fill,
                  ),
          ),
          child: Column(
            children: [
              TopBar(
                this,
                title: Languages.of(context).txtProfile,
                isShowBack: false,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 30.setHeight),
                  child: Column(
                    children: [
                      SizedBox(height: 5.setHeight),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.setWidth),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(5.setWidth),
                              child: ClipOval(
                                child: Image.asset(
                                  AppAssets.imgDummyGirl,
                                  width: 55.setWidth,
                                  height: 55.setHeight,
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
                            SizedBox(width: 8.setWidth),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text: "Andrew Oliver",
                                    fontSize: 16.setFontSize,
                                    fontWeight: FontWeight.w600,
                                    textColor: CustomAppColor.of(context).txtBlack,
                                    fontFamily: Constant.fontFamily,
                                  ),
                                  SizedBox(height: 5.setHeight),
                                  CommonText(
                                    text: "+204 87452 95091",
                                    fontSize: 12.setFontSize,
                                    fontWeight: FontWeight.w400,
                                    textColor: CustomAppColor.of(context).txtBlack,
                                    fontFamily: Constant.fontFamily,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: CustomAppColor.of(context).primary,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(8.setWidth),
                              child: Image.asset(
                                AppAssets.icProfileEdit,
                                width: 16.setWidth,
                                height: 16.setHeight,
                                fit: BoxFit.contain,
                                color: CustomAppColor.of(context).white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.setHeight),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.setWidth),
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
                              icon: AppAssets.icSecuritySafe,
                              title: Languages.of(context).txtSecurity,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SecurityScreen(),
                                  ),
                                );
                              },
                            ),
                            _buildSettingsItem(
                              icon: AppAssets.icWallet,
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
                              title: Languages.of(context).txtHelpCenter,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HelpCenterScreen(),
                                  ),
                                );
                              },
                            ),
                            _buildSettingsItem(
                              icon: AppAssets.icDeleteAccount,
                              title: Languages.of(context).txtDeleteAccount,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  barrierColor: CustomAppColor.of(context).black.withOpacityPercent(0.3),
                                  builder: (context) => const DeleteAccountDialog(),
                                );
                              },
                              isDestructive: true,
                            ),
                            _buildSettingsItem(
                              icon: AppAssets.icLogout,
                              title: Languages.of(context).txtLogout,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  barrierColor: CustomAppColor.of(context).black.withOpacityPercent(0.3),
                                  builder: (context) => const LogoutDialog(),
                                );
                              },
                              isDestructive: true,
                              isLastItem: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
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
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(bottom: 10.setHeight),
          padding: EdgeInsets.symmetric(vertical: 6.setHeight, horizontal: 14.setWidth),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).profileContainerBg,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomAppColor.of(context).txtWhite,
                ),
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  icon,
                  color: isDestructive ? CustomAppColor.of(context).red : CustomAppColor.of(context).txtBlack,
                  width: 18.setWidth,
                  height: 18.setHeight,
                ),
              ),
              SizedBox(width: 10.setWidth),
              Expanded(
                child: CommonText(
                  text: title,
                  fontSize: 15.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: isDestructive ? CustomAppColor.of(context).red : CustomAppColor.of(context).txtBlack,
                  fontFamily: Constant.fontFamily,
                  textAlign: TextAlign.start,
                ),
              ),
              if (!isDestructive)
                hasSwitch
                    ? ValueListenableBuilder<bool>(
                        valueListenable: isDarkMode,
                        builder: (context, value, child) {
                          return SizedBox(
                            width: 38.setWidth,
                            height: 20.setHeight,
                            child: FlutterSwitch(
                              activeColor: CustomAppColor.of(context).primary,
                              inactiveColor: CustomAppColor.of(context).txtGray.withValues(alpha: 0.4),
                              activeToggleColor: CustomAppColor.of(context).white,
                              inactiveToggleColor: CustomAppColor.of(context).white,
                              width: 44.setWidth,
                              height: 22.setHeight,
                              toggleSize: 16.0,
                              borderRadius: 16.0,
                              padding: 2.5,
                              value: value,
                              onToggle: (bool newValue) {
                                isDarkMode.value = newValue;
                                getIt.get<LocalStorageService>().setBool(LocalStorageService.isLightTheme, !newValue);
                                Debug.printLoge("isDarkMode.value", "${isDarkMode.value} ${getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: false)} ");
                                final newTheme = newValue ? ThemeData.dark() : ThemeData.light();
                                StoxyScreensApp.changeTheme(context, newTheme);
                              },
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
          ),
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {}
}
