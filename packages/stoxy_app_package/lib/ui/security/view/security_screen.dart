import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:stoxy_app_package/interfaces/top_bar_click_listener.dart';
import 'package:stoxy_app_package/localization/language/languages.dart';
import 'package:stoxy_app_package/utils/app_color.dart';
import 'package:stoxy_app_package/utils/constant.dart';
import 'package:stoxy_app_package/utils/sizer_utils.dart';
import 'package:stoxy_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
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
  bool newMusicEnabled = true;
  bool soundEnabled = true;
  bool vibrateEnabled = false;
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
        child: Column(
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
                      title: "Remember Me",
                      value: newMusicEnabled,
                      onChanged: (value) {
                        setState(() {
                          newMusicEnabled = value;
                        });
                      },
                    ),
                    _buildNotificationItem(
                      title: "Biometric Id",
                      value: newMusicEnabled,
                      onChanged: (value) {
                        setState(() {
                          newMusicEnabled = value;
                        });
                      },
                    ),
                    _buildNotificationItem(
                      title: "Face Id",
                      value: newMusicEnabled,
                      onChanged: (value) {
                        setState(() {
                          newMusicEnabled = value;
                        });
                      },
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

  Widget _buildNotificationItem({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.setHeight),
      padding: EdgeInsets.symmetric(vertical: 16.setHeight, horizontal: 15.setWidth),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgCard,
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
}
