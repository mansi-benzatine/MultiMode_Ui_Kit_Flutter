import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:taxi_booking_driver_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:taxi_booking_driver_screens_app_package/localization/language/languages.dart';
import 'package:taxi_booking_driver_screens_app_package/utils/app_color.dart';
import 'package:taxi_booking_driver_screens_app_package/utils/constant.dart';
import 'package:taxi_booking_driver_screens_app_package/utils/sizer_utils.dart';
import 'package:taxi_booking_driver_screens_app_package/widgets/text/common_text.dart';
import 'package:taxi_booking_driver_screens_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
import '../../../utils/utils.dart';
import '../../../widgets/alert_dialog/common_alert_dialog.dart';
import '../../../widgets/button/common_button.dart';
import '../../app/my_app.dart';

class SettingsScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SettingsScreen());
  }

  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> implements TopBarClickListener {
  List<Map<String, dynamic>> settingsItems = [];
  ValueNotifier<bool> isDarkMode = ValueNotifier(false);

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
    settingsItems = [
      {
        'icon': AppAssets.icVerifyUser,
        'title': Languages.of(context).txtSecurity,
        'onTap': () {
          // Navigator.push(context, SecurityScreen.route());
        },
      },
      {
        'icon': AppAssets.icReceipt,
        'title': Languages.of(context).txtPrivacyPolicy,
        'onTap': () {
          // Navigator.push(context, PrivacyPolicyScreen.route());
        },
      },
      {
        'icon': AppAssets.icPolicy,
        'title': Languages.of(context).txtTermsAndCondition,
        'onTap': () {
          // Navigator.push(context, TermsAndConditionsScreen.route());
        },
      },
      {
        'icon': AppAssets.icDarkMode,
        'title': Languages.of(context).txtLightDarkMode,
        'isToggle': true,
      },
      {
        'icon': AppAssets.icDelete,
        'title': Languages.of(context).txtDeleteAccount,
        'onTap': () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (dialogContext) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                child: CommonDialog(
                  titleText: CommonText(
                    text: Languages.of(context).txtDeleteAccount,
                    fontWeight: FontWeight.w700,
                    fontSize: 24.setFontSize,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                  descriptionText: CommonText(
                    text: Languages.of(context).txtAreYouSureYouWantToDeleteYourAccount,
                    fontSize: 14.setFontSize,
                    fontWeight: FontWeight.w400,
                    textColor: CustomAppColor.of(context).txtGray,
                  ),
                  icon: Image.asset(
                    AppAssets.icRedLogout,
                    height: 90.setHeight,
                  ),
                  button: Row(
                    children: [
                      Expanded(
                        child: CommonButton(
                          text: Languages.of(context).txtCancel,
                          onTap: () => Navigator.pop(dialogContext),
                          buttonColor: CustomAppColor.of(context).transparent,
                          borderColor: CustomAppColor.of(context).txtGray,
                          buttonTextColor: CustomAppColor.of(context).txtGray,
                          height: 45.setHeight,
                          buttonTextSize: 16.setFontSize,
                        ),
                      ),
                      SizedBox(width: 15.setWidth),
                      Expanded(
                        child: CommonButton(
                          text: Languages.of(context).txtDelete,
                          onTap: () => Navigator.pop(dialogContext),
                          height: 45.setHeight,
                          borderColor: CustomAppColor.of(context).orange,
                          buttonColor: CustomAppColor.of(context).orange,
                          buttonTextSize: 16.setFontSize,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      },
      {
        'icon': AppAssets.icSignOut,
        'title': Languages.of(context).txtLogout,
        'onTap': () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (dialogContext) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.setWidth),
                child: CommonDialog(
                  titleText: CommonText(
                    text: Languages.of(context).txtLogout,
                    fontWeight: FontWeight.w700,
                    fontSize: 24.setFontSize,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                  descriptionText: CommonText(
                    text: Languages.of(context).txtAreYouSureYouWantToLogout,
                    fontSize: 14.setFontSize,
                    fontWeight: FontWeight.w400,
                    textColor: CustomAppColor.of(context).txtGray,
                  ),
                  icon: Image.asset(
                    AppAssets.icRedLogout,
                    height: 90.setHeight,
                  ),
                  button: Row(
                    children: [
                      Expanded(
                        child: CommonButton(
                          text: Languages.of(context).txtCancel,
                          onTap: () => Navigator.pop(dialogContext),
                          buttonColor: CustomAppColor.of(context).transparent,
                          borderColor: CustomAppColor.of(context).txtGray,
                          buttonTextColor: CustomAppColor.of(context).txtGray,
                          height: 45.setHeight,
                          buttonTextSize: 16.setFontSize,
                        ),
                      ),
                      SizedBox(width: 15.setWidth),
                      Expanded(
                        child: CommonButton(
                          text: Languages.of(context).txtLogout,
                          onTap: () => Navigator.pop(dialogContext),
                          height: 45.setHeight,
                          borderColor: CustomAppColor.of(context).orange,
                          buttonColor: CustomAppColor.of(context).orange,
                          buttonTextSize: 16.setFontSize,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      },
    ];
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(this, title: Languages.of(context).txtSettings),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: settingsItems.length,
              separatorBuilder: (_, __) => Divider(color: CustomAppColor.of(context).dividerColor.withValues(alpha: 0.1)),
              itemBuilder: (_, index) {
                final item = settingsItems[index];
                if (item['isToggle'] == true) {
                  return IgnorePointer(
                    ignoring: true,
                    child: SettingToggleItemView(
                      icon: item['icon'],
                      title: item['title'],
                      isDarkMode: isDarkMode,
                    ),
                  );
                } else {
                  return _settingsItem(
                    icon: item['icon'],
                    title: item['title'],
                    onTap: item['onTap'],
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _settingsItem({
    required String icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 22.setWidth),
      leading: Image.asset(
        icon,
        width: 22.setWidth,
        height: 22.setHeight,
        fit: BoxFit.contain,
        color: (title == Languages.of(context).txtDeleteAccount || title == Languages.of(context).txtLogout) ? CustomAppColor.of(context).red : CustomAppColor.of(context).txtBlack,
      ),
      title: CommonText(
        text: title,
        fontSize: 16.setFontSize,
        fontWeight: FontWeight.w600,
        textAlign: TextAlign.start,
        textColor: (title == Languages.of(context).txtDeleteAccount || title == Languages.of(context).txtLogout) ? CustomAppColor.of(context).red : CustomAppColor.of(context).txtBlack,
      ),
      trailing: Visibility(
        visible: !(title == Languages.of(context).txtDeleteAccount || title == Languages.of(context).txtLogout),
        child: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: CustomAppColor.of(context).txtGray,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}

class SettingToggleItemView extends StatefulWidget {
  final ValueNotifier<bool> isDarkMode;
  final String icon;
  final String title;

  const SettingToggleItemView({
    super.key,
    required this.isDarkMode,
    required this.icon,
    required this.title,
  });

  @override
  State<SettingToggleItemView> createState() => _SettingToggleItemViewState();
}

class _SettingToggleItemViewState extends State<SettingToggleItemView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 12.setHeight),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            widget.icon,
            width: 22.setWidth,
            height: 22.setHeight,
            fit: BoxFit.contain,
            color: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(width: 17.setWidth),
          Expanded(
            child: CommonText(
              text: widget.title,
              fontSize: 16.setFontSize,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.start,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: widget.isDarkMode,
            builder: (context, value, child) {
              return FlutterSwitch(
                value: value,
                onToggle: (bool newValue) {
                  widget.isDarkMode.value = newValue;
                  getIt.get<LocalStorageService>().setBool(
                        LocalStorageService.isLightTheme,
                        !newValue,
                      );
                  final newTheme = newValue ? ThemeData.dark() : ThemeData.light();
                  TaxiBookingDriverScreensApp.changeTheme(context, newTheme);
                },
                activeColor: Colors.green,
                inactiveColor: CustomAppColor.of(context).txtGray.withValues(alpha: 0.4),
                activeToggleColor: CustomAppColor.of(context).white,
                inactiveToggleColor: CustomAppColor.of(context).white,
                width: 44.setWidth,
                height: 22.setHeight,
                toggleSize: 16.0,
                borderRadius: 16.0,
                padding: 2.5,
              );
            },
          ),
        ],
      ),
    );
  }
}
