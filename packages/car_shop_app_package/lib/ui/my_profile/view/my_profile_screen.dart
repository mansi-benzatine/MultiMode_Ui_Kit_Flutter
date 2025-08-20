import 'package:car_shop_app_package/utils/sizer_utils.dart';
import 'package:car_shop_app_package/utils/utils.dart';
import 'package:car_shop_app_package/widgets/view/dotted_divider_view.dart';
import 'package:flutter/material.dart';

import '../../../dialogs/alerts/logout_dialog.dart';
import '../../../edit_profile/view/edit_profile_screen.dart';
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
import '../../app/my_app.dart';
import '../../help_center/view/help_center_screen.dart';
import '../../language_setting/view/language_setting_screen.dart';
import '../../my_vehicle/view/my_vehicle_screen.dart';
import '../../notification_setting/view/notification_setting.dart';
import '../../privacy_policy/view/privacy_policy_screen.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> implements TopBarClickListener {
  final ValueNotifier<bool> isDarkMode = ValueNotifier(false);
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
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtMyProfile,
              isShowBack: false,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, bottom: 100.setHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10.setHeight),
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100.setWidth),
                          child: Image.asset(
                            AppAssets.imgDummyGirl,
                            height: 100.setHeight,
                            width: 100.setWidth,
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: Container(
                            height: 20.setHeight,
                            width: 20.setWidth,
                            decoration: BoxDecoration(
                              border: Border.all(color: CustomAppColor.of(context).txtWhite, width: 1.5.setWidth),
                              borderRadius: BorderRadius.circular(5.setWidth),
                              gradient: CustomAppColor.of(context).primaryGradient,
                            ),
                            padding: EdgeInsets.all(3.setWidth),
                            child: Image.asset(
                              AppAssets.icProfileEdit,
                              height: 16.setHeight,
                              width: 16.setWidth,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.setHeight),
                    CommonText(
                      text: "Mona Lisa",
                      fontSize: 18.setFontSize,
                      fontWeight: FontWeight.w600,
                      textColor: CustomAppColor.of(context).txtBlack,
                      textAlign: TextAlign.center,
                    ),
                    CommonText(
                      text: "+1 12345 67890",
                      fontSize: 12.setFontSize,
                      fontWeight: FontWeight.w400,
                      textColor: CustomAppColor.of(context).txtGray,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30.setHeight),
                    _settingItem(
                      title: Languages.of(context).txtEditName,
                      icon: AppAssets.icProfile,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const EditProfileScreen()),
                        );
                      },
                    ),
                    _settingItem(
                      title: Languages.of(context).txtNotification,
                      icon: AppAssets.icNotificationProfile,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const NotificationSetting()),
                        );
                      },
                    ),
                    _settingItem(
                      title: Languages.of(context).txtMyVehicle,
                      icon: AppAssets.icMyVehicleProfile,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MyVehicleScreen()),
                        );
                      },
                    ),
                    _settingItem(
                      title: Languages.of(context).txtDarkMode,
                      icon: AppAssets.icDarkModeProfile,
                      onTap: () {},
                      iconWidget: ValueListenableBuilder(
                        valueListenable: isDarkMode,
                        builder: (context, value, child) {
                          return SizedBox(
                            width: 40.setWidth,
                            height: 20.setHeight,
                            child: Switch(
                              value: isDarkMode.value,
                              onChanged: (value) {
                                isDarkMode.value = value;
                                getIt.get<LocalStorageService>().setBool(LocalStorageService.isLightTheme, !value);
                                Debug.printLoge("isDarkMode.value", "${isDarkMode.value} ${getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: false)} ");
                                final newTheme = value ? ThemeData.dark() : ThemeData.light();
                                CarShopApp.changeTheme(context, newTheme);
                              },
                              activeColor: CustomAppColor.of(context).primary,
                              inactiveThumbColor: CustomAppColor.of(context).white,
                              inactiveTrackColor: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                              activeTrackColor: CustomAppColor.of(context).primary,
                              thumbColor: WidgetStateProperty.all(CustomAppColor.of(context).white),
                              trackOutlineWidth: WidgetStateProperty.all(0),
                              trackOutlineColor: WidgetStateProperty.all(CustomAppColor.of(context).transparent),
                            ),
                          );
                        },
                      ),
                    ),
                    _settingItem(
                      title: Languages.of(context).txtPrivacyPolicy,
                      icon: AppAssets.icPrivacyProfile,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen()),
                        );
                      },
                    ),
                    _settingItem(
                      title: Languages.of(context).txtLanguage,
                      icon: AppAssets.icLangProfile,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LanguageSettingScreen()),
                        );
                      },
                    ),
                    _settingItem(
                      title: Languages.of(context).txtHelpCenter,
                      icon: AppAssets.icHelpProfile,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HelpCenterScreen()),
                        );
                      },
                    ),
                    _settingItem(
                      title: Languages.of(context).txtLogout,
                      icon: AppAssets.icLogout,
                      textColor: CustomAppColor.of(context).txtRed,
                      isLast: true,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (dialogContext) => LogoutDialog(
                                  dialogContext: dialogContext,
                                ));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _settingItem({
    required String title,
    required String icon,
    required Function() onTap,
    Widget? iconWidget,
    Color? textColor,
    bool isLast = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                icon,
                height: 20.setHeight,
                width: 20.setWidth,
                color: textColor ?? CustomAppColor.of(context).txtBlack,
              ),
              SizedBox(width: 15.setWidth),
              Expanded(
                child: CommonText(
                  text: title,
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w400,
                  textColor: textColor ?? CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.start,
                ),
              ),
              (iconWidget != null)
                  ? iconWidget
                  : Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: CustomAppColor.of(context).txtBlack,
                      size: 16.setHeight,
                    ),
            ],
          ),
          if (!isLast) ...[
            SizedBox(height: 15.setHeight),
            DottedDividerView(
              color: CustomAppColor.of(context).txtBlack.withOpacityPercent(0.20),
              height: 0.5.setHeight,
            ),
            SizedBox(height: 15.setHeight),
          ],
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
