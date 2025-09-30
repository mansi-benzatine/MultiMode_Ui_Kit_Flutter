import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:stoxy_app_package/localization/language/languages.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({super.key});

  @override
  State<NotificationSettingScreen> createState() => _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> implements TopBarClickListener {
  bool newMusicEnabled = true;
  bool soundEnabled = true;
  bool vibrateEnabled = false;
  bool playlistUpdateEnabled = true;
  bool paymentEnabled = true;
  bool newFeaturesEnabled = false;
  bool securityAlertsEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Container(
        decoration: BoxDecoration(
          image: getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: true)
              ? null
              : DecorationImage(
                  image: AssetImage(AppAssets.imgCommonBackground),
                  fit: BoxFit.fill,
                ),
        ),
        child: SafeArea(
            child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtNotification,
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                child: Column(
                  children: [
                    _buildNotificationItem(
                      title: "My Stocks Goes Up",
                      value: newMusicEnabled,
                      onChanged: (value) {
                        setState(() {
                          newMusicEnabled = value;
                        });
                      },
                    ),
                    _buildNotificationItem(
                      title: "My Stock Is Down",
                      value: newMusicEnabled,
                      onChanged: (value) {
                        setState(() {
                          newMusicEnabled = value;
                        });
                      },
                    ),
                    _buildNotificationItem(
                      title: "Top Movers Updates",
                      value: newMusicEnabled,
                      onChanged: (value) {
                        setState(() {
                          newMusicEnabled = value;
                        });
                      },
                    ),
                    _buildNotificationItem(
                      title: "I Bought Stock",
                      value: soundEnabled,
                      onChanged: (value) {
                        setState(() {
                          soundEnabled = value;
                        });
                      },
                    ),
                    _buildNotificationItem(
                      title: "I Exchange Stock",
                      value: vibrateEnabled,
                      onChanged: (value) {
                        setState(() {
                          vibrateEnabled = value;
                        });
                      },
                    ),
                    _buildNotificationItem(
                      title: "Announcement",
                      value: playlistUpdateEnabled,
                      onChanged: (value) {
                        setState(() {
                          playlistUpdateEnabled = value;
                        });
                      },
                    ),
                    _buildNotificationItem(
                      title: "App Updates",
                      value: paymentEnabled,
                      onChanged: (value) {
                        setState(() {
                          paymentEnabled = value;
                        });
                      },
                    ),
                    _buildNotificationItem(
                      title: "New Service Availbale",
                      value: newFeaturesEnabled,
                      onChanged: (value) {
                        setState(() {
                          newFeaturesEnabled = value;
                        });
                      },
                    ),
                    _buildNotificationItem(
                      title: "New Tips",
                      value: securityAlertsEnabled,
                      onChanged: (value) {
                        setState(() {
                          securityAlertsEnabled = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }

  Widget _buildNotificationItem({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.setHeight),
      padding: EdgeInsets.symmetric(vertical: 16.setHeight, horizontal: 15.setWidth),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).profileContainerBg,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        children: [
          Expanded(
            child: CommonText(
              text: title,
              fontSize: 14.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).txtBlack,
              fontFamily: Constant.fontFamily,
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            width: 38.setWidth,
            height: 22.setHeight,
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
              onToggle: onChanged,
            ),
          ),
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
