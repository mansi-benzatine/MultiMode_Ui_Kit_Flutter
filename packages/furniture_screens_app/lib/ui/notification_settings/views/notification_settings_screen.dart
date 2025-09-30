import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:furniture_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:furniture_screens_app_package/localization/language/languages.dart';
import 'package:furniture_screens_app_package/utils/app_color.dart';
import 'package:furniture_screens_app_package/utils/constant.dart';
import 'package:furniture_screens_app_package/utils/sizer_utils.dart';
import 'package:furniture_screens_app_package/widgets/text/common_text.dart';
import 'package:furniture_screens_app_package/widgets/top_bar/topbar.dart';

import '../datamodel/notifications_options_data.dart';

class NotificationSettingsScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const NotificationSettingsScreen());
  }

  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> implements TopBarClickListener {
  List<NotificationOption> notificationOptions = [];
  _fillData() {
    notificationOptions = [
      NotificationOption(title: Languages.of(context).txtNewArrialNotification, isEnabled: true),
      NotificationOption(title: Languages.of(context).txtSound, isEnabled: true),
      NotificationOption(title: Languages.of(context).txtVibrate),
      NotificationOption(title: Languages.of(context).txtDiscountAndOffers, isEnabled: true),
      NotificationOption(title: Languages.of(context).txtPayment, isEnabled: true),
      NotificationOption(title: Languages.of(context).txtSecurityAlerts),
      NotificationOption(title: Languages.of(context).txtCashback),
      NotificationOption(title: Languages.of(context).txtOrderStatusUpdates, isEnabled: true),
      NotificationOption(title: Languages.of(context).txtNewService),
      NotificationOption(title: Languages.of(context).txtAppUpdates),
      NotificationOption(title: Languages.of(context).txtNewTips, isEnabled: true),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtNotificationSettings,
            isShowBack: true,
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 12.setHeight),
              itemCount: notificationOptions.length,
              separatorBuilder: (_, __) => Divider(
                height: 1,
                color: CustomAppColor.of(context).dividerColor,
              ),
              itemBuilder: (context, index) {
                final item = notificationOptions[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.setHeight),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        text: item.title,
                        fontSize: 16.setFontSize,
                        fontFamily: Constant.fontFamilyMedium500,
                      ),
                      FlutterSwitch(
                        activeColor: CustomAppColor.of(context).primary,
                        inactiveColor: CustomAppColor.of(context).txtGray.withValues(alpha: 0.4),
                        activeToggleColor: CustomAppColor.of(context).white,
                        inactiveToggleColor: CustomAppColor.of(context).white,
                        width: 44.setWidth,
                        height: 22.setHeight,
                        toggleSize: 16.0,
                        borderRadius: 16.0,
                        padding: 2.5,
                        value: item.isEnabled,
                        onToggle: (value) {
                          setState(() {
                            item.isEnabled = value;
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
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
