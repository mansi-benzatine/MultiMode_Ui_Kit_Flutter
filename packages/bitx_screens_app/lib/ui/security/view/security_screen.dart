import 'package:bitx_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:bitx_screens_app/localization/language/languages.dart';
import 'package:bitx_screens_app/ui/change_pin/view/change_pin_screen.dart';
import 'package:bitx_screens_app/utils/app_color.dart';
import 'package:bitx_screens_app/utils/constant.dart';
import 'package:bitx_screens_app/utils/sizer_utils.dart';
import 'package:bitx_screens_app/widgets/button/common_button.dart';
import 'package:bitx_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../widgets/text/common_text.dart';

class SecurityScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SecurityScreen());
  }

  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> implements TopBarClickListener {
  bool rememberMeEnabled = true;
  bool biometricIdEnabled = true;
  bool faceIdEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtSecurity,
            isShowBack: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: Column(
                children: [
                  _buildNotificationItem(
                    title: Languages.of(context).txtRememberMe,
                    value: rememberMeEnabled,
                    onChanged: (value) {
                      setState(() {
                        rememberMeEnabled = value;
                      });
                    },
                  ),
                  Divider(color: CustomAppColor.of(context).border),
                  _buildNotificationItem(
                    title: Languages.of(context).txtBiometricId,
                    value: biometricIdEnabled,
                    onChanged: (value) {
                      setState(() {
                        biometricIdEnabled = value;
                      });
                    },
                  ),
                  Divider(color: CustomAppColor.of(context).border),
                  _buildNotificationItem(
                    title: Languages.of(context).txtFaceID,
                    value: faceIdEnabled,
                    onChanged: (value) {
                      setState(() {
                        faceIdEnabled = value;
                      });
                    },
                  ),
                  Divider(color: CustomAppColor.of(context).border),
                  SizedBox(height: 6.setHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        text: Languages.of(context).txtTwoFactorAuthentication,
                        fontSize: 15.setFontSize,
                        fontWeight: FontWeight.w600,
                      ),
                      Icon(
                        Icons.navigate_next_rounded,
                        color: CustomAppColor.of(context).txtDarkGray,
                      )
                    ],
                  ),
                  SizedBox(height: 25.setHeight),
                  IgnorePointer(
                    ignoring: true,
                    child: CommonButton(
                      text: Languages.of(context).txtChangePin,
                      onTap: () => Navigator.push(context, ChangePinScreen.route()),
                    ),
                  )
                ],
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

  Widget _buildNotificationItem({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.setHeight),
      child: Row(
        children: [
          Expanded(
            child: CommonText(
              text: title,
              fontSize: 15.setFontSize,
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
}
