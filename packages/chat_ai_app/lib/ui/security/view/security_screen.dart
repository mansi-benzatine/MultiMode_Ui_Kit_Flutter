import 'package:chat_ai_app_package/interfaces/top_bar_click_listener.dart';
import 'package:chat_ai_app_package/utils/app_assets.dart';
import 'package:chat_ai_app_package/utils/sizer_utils.dart';
import 'package:chat_ai_app_package/widgets/button/common_button.dart';
import 'package:chat_ai_app_package/widgets/text/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/top_bar/topbar.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SecurityScreen());
  }

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> implements TopBarClickListener {
  final ValueNotifier<bool> isNewFeaturesNotification = ValueNotifier<bool>(true);
  final ValueNotifier<bool> isSound = ValueNotifier<bool>(true);
  final ValueNotifier<bool> isVibrate = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isPayment = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            TopBar(this, title: Languages.of(context).txtSecurity),
            Expanded(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.only(
                  left: 20.setWidth,
                  right: 20.setWidth,
                  top: 20.setHeight,
                  bottom: 50.setHeight,
                ),
                child: Column(
                  children: [
                    _itemNotification(
                      value: Languages.of(context).txtRememberMe,
                      switchValue: isNewFeaturesNotification,
                    ),
                    _itemNotification(
                      value: Languages.of(context).txtFaceId,
                      switchValue: isSound,
                    ),
                    _itemNotification(
                      value: Languages.of(context).txtBioMetricId,
                      switchValue: isVibrate,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                          text: Languages.of(context).txtDeviceManagement,
                          fontWeight: FontWeight.w400,
                          fontSize: 18.setFontSize,
                          textColor: CustomAppColor.of(context).txtBlack,
                          textAlign: TextAlign.start,
                        ),
                        Image.asset(
                          AppAssets.icArrowRight,
                          width: 20.setWidth,
                          height: 20.setHeight,
                        )
                      ],
                    ),
                    SizedBox(height: 25.setHeight),
                    CommonButton(text: Languages.of(context).txtChangePin)
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
      padding: EdgeInsets.symmetric(vertical: 6.setHeight),
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
          SizedBox(height: 2.setHeight),
          Divider(
            color: CustomAppColor.of(context).lineColor,
            thickness: .5,
          )
        ],
      ),
    );
  }
}
