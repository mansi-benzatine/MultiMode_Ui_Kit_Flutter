import 'package:car_shop_app_package/utils/sizer_utils.dart';
import 'package:car_shop_app_package/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../../widgets/view/dotted_divider_view.dart';

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({super.key});

  @override
  State<NotificationSetting> createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> implements TopBarClickListener {
  final ValueNotifier<bool> isTextEnabled = ValueNotifier(true);
  final ValueNotifier<bool> isSoundEnabled = ValueNotifier(false);
  final ValueNotifier<bool> isVibrationEnabled = ValueNotifier(false);
  final ValueNotifier<bool> isDiscountPromoEnabled = ValueNotifier(true);
  final ValueNotifier<bool> isPaymentEnabled = ValueNotifier(true);
  final ValueNotifier<bool> isAppUpdateEnabled = ValueNotifier(false);
  final ValueNotifier<bool> isCashBackEnabled = ValueNotifier(false);
  final ValueNotifier<bool> isNewTipsEnabled = ValueNotifier(false);
  final ValueNotifier<bool> isNewServiceEnabled = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(this, title: Languages.of(context).txtNotification, isShowBack: true),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
                child: Column(
                  children: [
                    _settingItem(
                      title: Languages.of(context).txtText,
                      isEnabled: isTextEnabled,
                      onChanged: (value) {},
                    ),
                    _settingItem(
                      title: Languages.of(context).txtSound,
                      isEnabled: isSoundEnabled,
                      onChanged: (value) {},
                    ),
                    _settingItem(
                      title: Languages.of(context).txtVibration,
                      isEnabled: isVibrationEnabled,
                      onChanged: (value) {},
                    ),
                    _settingItem(
                      title: Languages.of(context).txtDiscountPromo,
                      isEnabled: isDiscountPromoEnabled,
                      onChanged: (value) {},
                    ),
                    _settingItem(
                      title: Languages.of(context).txtPayment,
                      isEnabled: isPaymentEnabled,
                      onChanged: (value) {},
                    ),
                    _settingItem(
                      title: Languages.of(context).txtAppUpdate,
                      isEnabled: isAppUpdateEnabled,
                      onChanged: (value) {},
                    ),
                    _settingItem(
                      title: Languages.of(context).txtCashBack,
                      isEnabled: isCashBackEnabled,
                      onChanged: (value) {},
                    ),
                    _settingItem(
                      title: Languages.of(context).txtNewTips,
                      isEnabled: isNewTipsEnabled,
                      onChanged: (value) {},
                    ),
                    _settingItem(
                      title: Languages.of(context).txtNewService,
                      isEnabled: isNewServiceEnabled,
                      isLast: true,
                      onChanged: (value) {},
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
    required ValueNotifier<bool> isEnabled,
    required Function(bool) onChanged,
    bool isLast = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: CommonText(
                text: title,
                fontSize: 14.setFontSize,
                fontWeight: FontWeight.w400,
                textColor: CustomAppColor.of(context).txtBlack,
                textAlign: TextAlign.start,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: isEnabled,
              builder: (context, value, child) {
                return SizedBox(
                  width: 40.setWidth,
                  height: 20.setHeight,
                  child: Switch(
                    value: isEnabled.value,
                    onChanged: (value) async {
                      isEnabled.value = value;
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
        if (!isLast) ...[
          SizedBox(height: 15.setHeight),
          DottedDividerView(
            color: CustomAppColor.of(context).txtBlack.withOpacityPercent(0.20),
            height: 0.5.setHeight,
          ),
          SizedBox(height: 15.setHeight),
        ],
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
