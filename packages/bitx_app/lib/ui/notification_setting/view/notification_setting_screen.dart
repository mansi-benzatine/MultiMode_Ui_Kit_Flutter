import 'package:bitx_app/localization/language/languages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../interfaces/top_bar_click_listener.dart';
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
  bool myPortfolioGoesUpEnabled = true;
  bool myPortfolioDownEnabled = true;
  bool iBuyCryptoCoinEnabled = false;
  bool iSellCryptoCoinEnabled = true;
  bool iDepositCryptoCoinEnabled = true;
  bool iTransferCryptoCoinEnabled = false;
  bool iExchangeCryptoCoinEnabled = true;
  bool iWithdrawCryptoCoinEnabled = true;
  bool newServiceUpdateEnabled = false;
  bool appUpdatesEnabled = false;
  bool newTipsEnabled = false;

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
              padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
              child: Column(
                children: [
                  _buildNotificationItem(
                    title: Languages.of(context).txtMyPortfolioGoesUp,
                    value: myPortfolioGoesUpEnabled,
                    onChanged: (value) {
                      setState(() {
                        myPortfolioGoesUpEnabled = value;
                      });
                    },
                  ),
                  Divider(color: CustomAppColor.of(context).border),
                  _buildNotificationItem(
                    title: Languages.of(context).txtMyPortfolioGoesDown,
                    value: myPortfolioDownEnabled,
                    onChanged: (value) {
                      setState(() {
                        myPortfolioDownEnabled = value;
                      });
                    },
                  ),
                  Divider(color: CustomAppColor(context).border),
                  _buildNotificationItem(
                    title: Languages.of(context).txtIBuyCryptoCoin,
                    value: iBuyCryptoCoinEnabled,
                    onChanged: (value) {
                      setState(() {
                        iBuyCryptoCoinEnabled = value;
                      });
                    },
                  ),
                  Divider(color: CustomAppColor.of(context).border),
                  _buildNotificationItem(
                    title: Languages.of(context).txtISellCryptoCoin,
                    value: iSellCryptoCoinEnabled,
                    onChanged: (value) {
                      setState(() {
                        iSellCryptoCoinEnabled = value;
                      });
                    },
                  ),
                  Divider(color: CustomAppColor.of(context).border),
                  _buildNotificationItem(
                    title: Languages.of(context).txtIDepositCryptoCoin,
                    value: iDepositCryptoCoinEnabled,
                    onChanged: (value) {
                      setState(() {
                        iDepositCryptoCoinEnabled = value;
                      });
                    },
                  ),
                  Divider(color: CustomAppColor.of(context).border),
                  _buildNotificationItem(
                    title: Languages.of(context).txtITransferCryptoCoin,
                    value: iTransferCryptoCoinEnabled,
                    onChanged: (value) {
                      setState(() {
                        iTransferCryptoCoinEnabled = value;
                      });
                    },
                  ),
                  Divider(color: CustomAppColor.of(context).border),
                  _buildNotificationItem(
                    title: Languages.of(context).txtIExchangeCryptoCoin,
                    value: iExchangeCryptoCoinEnabled,
                    onChanged: (value) {
                      setState(() {
                        iExchangeCryptoCoinEnabled = value;
                      });
                    },
                  ),
                  Divider(color: CustomAppColor.of(context).border),
                  _buildNotificationItem(
                    title: Languages.of(context).txtIWithdrawCryptoCoin,
                    value: iWithdrawCryptoCoinEnabled,
                    onChanged: (value) {
                      setState(() {
                        iWithdrawCryptoCoinEnabled = value;
                      });
                    },
                  ),
                  Divider(color: CustomAppColor.of(context).border),
                  _buildNotificationItem(
                    title: Languages.of(context).txtNewServiceUpdates,
                    value: newServiceUpdateEnabled,
                    onChanged: (value) {
                      setState(() {
                        newServiceUpdateEnabled = value;
                      });
                    },
                  ),
                  Divider(color: CustomAppColor.of(context).border),
                  _buildNotificationItem(
                    title: Languages.of(context).txtAppUpdates,
                    value: appUpdatesEnabled,
                    onChanged: (value) {
                      setState(() {
                        appUpdatesEnabled = value;
                      });
                    },
                  ),
                   Divider(color: CustomAppColor.of(context).border),
                  _buildNotificationItem(
                    title: Languages.of(context).txtNewTips,
                    value: newTipsEnabled,
                    onChanged: (value) {
                      setState(() {
                        newTipsEnabled = value;
                      });
                    },
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
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.setHeight),
      padding: EdgeInsets.symmetric(vertical: 5.setHeight, horizontal: 0.setWidth),
      child: Row(
        children: [
          Expanded(
            child: CommonText(
              text: title,
              fontSize: 14.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).txtBlack,
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
