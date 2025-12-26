import 'dart:math' as math;

import 'package:bitx_screens_app/dialogs/alerts/delete_account_dialog.dart';
import 'package:bitx_screens_app/dialogs/alerts/logout_dialog.dart';
import 'package:bitx_screens_app/ui/app/my_app.dart';
import 'package:bitx_screens_app/ui/edit_profile/view/edit_profile_screen.dart';
import 'package:bitx_screens_app/ui/help_center/view/help_center_screen.dart';
import 'package:bitx_screens_app/ui/notification_setting/view/notification_setting_screen.dart';
import 'package:bitx_screens_app/ui/security/view/security_screen.dart';
import 'package:bitx_screens_app/utils/sizer_utils.dart';
import 'package:bitx_screens_app/utils/utils.dart';
import 'package:bitx_screens_app/widgets/view/dotted_divider_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/debug.dart';
import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../language_setting/view/language_setting_screen.dart';
import '../../payment_method/view/payment_method_screen.dart';

class ProfileScreen extends StatefulWidget {
  final bool forDeleteAccountDialog;
  final bool forLogoutDialog;

  const ProfileScreen({
    super.key,
    this.forLogoutDialog = false,
    this.forDeleteAccountDialog = false,
  });

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

    if (widget.forDeleteAccountDialog) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          showDialog(
            context: context,
            barrierColor: CustomAppColor.of(context).black.withOpacityPercent(0.3),
            builder: (dialogContext) {
              return PopScope(
                canPop: false,
                onPopInvokedWithResult: (didPop, result) {
                  if (!didPop) {
                    Navigator.pop(dialogContext);
                    Navigator.pop(context);
                  }
                },
                child: const DeleteAccountDialog(),
              );
            },
          );
        },
      );
    }
    if (widget.forLogoutDialog) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          showDialog(
            context: context,
            barrierColor: CustomAppColor.of(context).black.withOpacityPercent(0.3),
            builder: (dialogContext) {
              return PopScope(
                canPop: false,
                onPopInvokedWithResult: (didPop, result) {
                  if (!didPop) {
                    Navigator.pop(dialogContext);
                    Navigator.pop(context);
                  }
                },
                child: const LogoutDialog(),
              );
            },
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 140.setHeight,
            decoration: BoxDecoration(
              gradient: RadialGradient(colors: [
                const Color(0xFFD5AEF8),
                const Color(0xFF6A5BC2).withValues(alpha: 0.25),
              ], center: Alignment.center, radius: 25),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          /*CustomPaint(
            painter: MyPainter(),
            size: Size(428, 200),
          ),*/
          Column(
            children: [
              TopBar(
                this,
                title: Languages.of(context).txtProfile,
                textColor: CustomAppColor.of(context).black,
                isShowBack: false,
              ),
              SizedBox(height: 5.setHeight),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20.setWidth),
                padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 10.setHeight),
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).profileContainer,
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  border: const Border.fromBorderSide(BorderSide(color: Colors.black12)),
                  boxShadow: [
                    BoxShadow(
                      color: CustomAppColor.of(context).profileContainer.withValues(alpha: 0.4),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    ClipOval(
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
                    SizedBox(width: 8.setWidth),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: "Andrew Oliver",
                            fontSize: 15.setFontSize,
                            fontWeight: FontWeight.w600,
                            textColor: CustomAppColor.of(context).txtBlack,
                          ),
                          SizedBox(height: 2.setHeight),
                          CommonText(
                            text: "+204 87452 95091",
                            fontSize: 12.setFontSize,
                            fontWeight: FontWeight.w400,
                            textColor: CustomAppColor.of(context).txtBlack,
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      AppAssets.icEdit,
                      width: 20.setWidth,
                      height: 20.setHeight,
                      color: CustomAppColor.of(context).icBlack,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20.setHeight),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.setWidth),
                        child: Column(
                          children: [
                            _buildSettingsItem(
                              icon: AppAssets.icBottomProfile,
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
                              icon: AppAssets.icTheme,
                              title: Languages.of(context).txtDarkMode,
                              onTap: () {},
                              hasSwitch: true,
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
                            SizedBox(height: 60.setHeight)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
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
          padding: EdgeInsets.symmetric(vertical: 3.setHeight),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: CustomAppColor.of(context).icRoundBg,
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
                                    BitXScreensApp.changeTheme(context, newTheme);
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
              SizedBox(height: 10.setHeight),
              DottedDividerView(color: CustomAppColor.of(context).border)
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {}
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xFFD5AEF8);
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      math.pi,
      -math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
