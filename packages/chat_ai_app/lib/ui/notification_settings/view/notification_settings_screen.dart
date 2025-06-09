import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const NotificationSettingsScreen());
  }

  @override
  State<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> implements TopBarClickListener {
  final ValueNotifier<bool> isNewFeaturesNotification = ValueNotifier<bool>(true);
  final ValueNotifier<bool> isSound = ValueNotifier<bool>(true);
  final ValueNotifier<bool> isVibrate = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isPayment = ValueNotifier<bool>(true);
  final ValueNotifier<bool> isSecurityAlerts = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isAppUpdates = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isNewTips = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            TopBar(this, title: Languages.of(context).txtNotificationSettings),
            Expanded(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.only(
                  left: 22.setWidth,
                  right: 22.setWidth,
                  top: 20.setHeight,
                  bottom: 50.setHeight,
                ),
                child: Column(
                  children: [
                    _itemNotification(
                      value: Languages.of(context).txtNewFeaturesNotification,
                      switchValue: isNewFeaturesNotification,
                    ),
                    _itemNotification(
                      value: Languages.of(context).txtSound,
                      switchValue: isSound,
                    ),
                    _itemNotification(
                      value: Languages.of(context).txtVibrate,
                      switchValue: isVibrate,
                    ),
                    _itemNotification(
                      value: Languages.of(context).txtPayment,
                      switchValue: isPayment,
                    ),
                    _itemNotification(
                      value: Languages.of(context).txtSecurityAlerts,
                      switchValue: isSecurityAlerts,
                    ),
                    _itemNotification(
                      value: Languages.of(context).txtAppUpdates,
                      switchValue: isAppUpdates,
                    ),
                    _itemNotification(
                      value: Languages.of(context).txtNewTips,
                      switchValue: isNewTips,
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

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }

  _itemNotification({required String value, required ValueNotifier<bool> switchValue}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.setHeight),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CommonText(
                  text: value,
                  fontWeight: FontWeight.w400,
                  fontSize: 18.setFontSize,
                  textColor: CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(width: 10.setWidth),
              ValueListenableBuilder<bool>(
                valueListenable: switchValue,
                builder: (context, value, child) {
                  return FlutterSwitch(
                    value: !value,
                    onToggle: (bool newValue) {
                      switchValue.value = value;
                    },
                    activeToggleColor: CustomAppColor.of(context).black,
                    activeColor: CustomAppColor.of(context).primary,
                    inactiveToggleColor: CustomAppColor.of(context).white,
                    inactiveColor: CustomAppColor.of(context).lineColor,
                    width: 45.setWidth,
                    height: 25.setHeight,
                    toggleSize: 21.0,
                    borderRadius: 16.0,
                    padding: 2.5,
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 4.setHeight),
          Divider(
            color: CustomAppColor.of(context).lineColor,
            thickness: .5,
          )
        ],
      ),
    );
  }
}
