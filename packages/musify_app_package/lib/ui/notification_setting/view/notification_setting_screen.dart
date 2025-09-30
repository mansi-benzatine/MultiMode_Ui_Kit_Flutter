import 'package:flutter/material.dart';
import 'package:musify_app_package/localization/language/languages.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({super.key});

  @override
  State<NotificationSettingScreen> createState() => _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> implements TopBarClickListener {
  // Notification settings state
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
      body: SafeArea(
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
                    icon: AppAssets.icMusic,
                    title: Languages.of(context).txtNewMusic,
                    value: newMusicEnabled,
                    onChanged: (value) {
                      setState(() {
                        newMusicEnabled = value;
                      });
                    },
                  ),
                  _buildNotificationItem(
                    icon: AppAssets.icSound,
                    title: Languages.of(context).txtSound,
                    value: soundEnabled,
                    onChanged: (value) {
                      setState(() {
                        soundEnabled = value;
                      });
                    },
                  ),
                  _buildNotificationItem(
                    icon: AppAssets.icVibrate,
                    title: Languages.of(context).txtVibrate,
                    value: vibrateEnabled,
                    onChanged: (value) {
                      setState(() {
                        vibrateEnabled = value;
                      });
                    },
                  ),
                  _buildNotificationItem(
                    icon: AppAssets.icPlaylist,
                    title: Languages.of(context).txtPlaylistUpdate,
                    value: playlistUpdateEnabled,
                    onChanged: (value) {
                      setState(() {
                        playlistUpdateEnabled = value;
                      });
                    },
                  ),
                  _buildNotificationItem(
                    icon: AppAssets.icWallet,
                    title: Languages.of(context).txtPayment,
                    value: paymentEnabled,
                    onChanged: (value) {
                      setState(() {
                        paymentEnabled = value;
                      });
                    },
                  ),
                  _buildNotificationItem(
                    icon: AppAssets.icNewFeatures,
                    title: Languages.of(context).txtNewFeatures,
                    value: newFeaturesEnabled,
                    onChanged: (value) {
                      setState(() {
                        newFeaturesEnabled = value;
                      });
                    },
                  ),
                  _buildNotificationItem(
                    icon: AppAssets.icSecuritySafe,
                    title: Languages.of(context).txtSecurityAlerts,
                    value: securityAlertsEnabled,
                    onChanged: (value) {
                      setState(() {
                        securityAlertsEnabled = value;
                      });
                    },
                    isLast: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  Widget _buildNotificationItem({
    required String icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
    bool isLast = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.setHeight),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : Border(
                bottom: BorderSide(
                  color: CustomAppColor.of(context).containerBorder,
                  width: 1,
                ),
              ),
      ),
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 22.setWidth,
            height: 22.setHeight,
            color: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(width: 14.setWidth),
          Expanded(
            child: CommonText(
              text: title,
              fontSize: 17.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).txtBlack,
              fontFamily: Constant.fontFamily,
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            width: 45.setWidth,
            height: 16.setHeight,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Switch(
                value: value,
                onChanged: onChanged,
                activeColor: CustomAppColor.of(context).primary,
                inactiveThumbColor: CustomAppColor.of(context).white,
                inactiveTrackColor: CustomAppColor.of(context).txtGray.withValues(alpha: 0.3),
                activeTrackColor: CustomAppColor.of(context).primary,
                thumbColor: WidgetStateProperty.all(CustomAppColor.of(context).white),
                trackOutlineWidth: WidgetStateProperty.all(0),
                trackOutlineColor: WidgetStateProperty.all(CustomAppColor.of(context).transparent),
              ),
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
