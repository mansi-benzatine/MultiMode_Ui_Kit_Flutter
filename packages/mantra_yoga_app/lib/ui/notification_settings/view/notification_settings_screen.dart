import 'package:flutter/material.dart';
import 'package:mantra_yoga_app_package/interfaces/top_bar_click_listener.dart';
import 'package:mantra_yoga_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (context) => const NotificationSettingsScreen());
  }

  @override
  State<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> implements TopBarClickListener {
  final ValueNotifier<bool> newArrivalNotification = ValueNotifier(false);
  final ValueNotifier<bool> soundNotification = ValueNotifier(false);
  final ValueNotifier<bool> vibrationNotification = ValueNotifier(false);
  final ValueNotifier<bool> discountAndOffersNotification = ValueNotifier(false);
  final ValueNotifier<bool> paymentNotification = ValueNotifier(false);
  final ValueNotifier<bool> securityAlertsNotification = ValueNotifier(false);
  final ValueNotifier<bool> newLessonNotification = ValueNotifier(false);
  final ValueNotifier<bool> taskReminderNotification = ValueNotifier(false);
  final ValueNotifier<bool> salesAlertsNotification = ValueNotifier(false);
  final ValueNotifier<bool> appUpdatesNotification = ValueNotifier(false);
  final ValueNotifier<bool> newTipsNotification = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtNotificationSettings,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 20.setWidth,
                right: 20.setWidth,
                top: 10.setHeight,
                bottom: MediaQuery.of(context).padding.bottom + 10.setHeight,
              ),
              child: Column(
                children: [
                  _itemOfOptionsView(
                    title: Languages.of(context).txtNewArrivalNotification,
                    onTap: () {},
                    switchValue: newArrivalNotification,
                  ),
                  _itemOfOptionsView(
                    title: Languages.of(context).txtSound,
                    onTap: () {},
                    switchValue: soundNotification,
                  ),
                  _itemOfOptionsView(
                    title: Languages.of(context).txtVibrate,
                    onTap: () {},
                    switchValue: vibrationNotification,
                  ),
                  _itemOfOptionsView(
                    title: Languages.of(context).txtDiscountOffers,
                    onTap: () {},
                    switchValue: discountAndOffersNotification,
                  ),
                  _itemOfOptionsView(
                    title: Languages.of(context).txtPayment,
                    onTap: () {},
                    switchValue: paymentNotification,
                  ),
                  _itemOfOptionsView(
                    title: Languages.of(context).txtSecurityAlerts,
                    onTap: () {},
                    switchValue: securityAlertsNotification,
                  ),
                  _itemOfOptionsView(
                    title: Languages.of(context).txtNewLesson,
                    onTap: () {},
                    switchValue: newLessonNotification,
                  ),
                  _itemOfOptionsView(
                    title: Languages.of(context).txtTaskReminder,
                    onTap: () {},
                    switchValue: taskReminderNotification,
                  ),
                  _itemOfOptionsView(
                    title: Languages.of(context).txtSalesAlerts,
                    onTap: () {},
                    switchValue: salesAlertsNotification,
                  ),
                  _itemOfOptionsView(
                    title: Languages.of(context).txtAppUpdates,
                    onTap: () {},
                    switchValue: appUpdatesNotification,
                  ),
                  _itemOfOptionsView(
                    title: Languages.of(context).txtNewTips,
                    onTap: () {},
                    switchValue: newTipsNotification,
                    isShowDivider: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _itemOfOptionsView({required String title, required Function() onTap, required ValueNotifier<bool> switchValue, bool isShowDivider = true}) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Expanded(
                child: CommonText(
                  text: title,
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w500,
                  fontFamily: Constant.fontFamilyMedium500,
                  textColor: CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.start,
                ),
              ),
              ValueListenableBuilder(
                valueListenable: switchValue,
                builder: (context, value, child) {
                  return SizedBox(
                    width: 40.setWidth,
                    height: 20.setHeight,
                    child: Switch(
                      value: switchValue.value,
                      onChanged: (value) {
                        switchValue.value = value;
                      },
                      activeColor: CustomAppColor.of(context).primary,
                      inactiveThumbColor: CustomAppColor.of(context).white,
                      inactiveTrackColor: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
                      activeTrackColor: CustomAppColor.of(context).primary,
                      thumbColor: WidgetStateProperty.all(CustomAppColor.of(context).white),
                      trackOutlineWidth: WidgetStateProperty.all(0),
                      trackOutlineColor: WidgetStateProperty.all(CustomAppColor.of(context).transparent),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        if (isShowDivider)
          Divider(
            color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
            height: 30.setHeight,
          ),
      ],
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
