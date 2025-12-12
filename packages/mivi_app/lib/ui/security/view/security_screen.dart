import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:mivi_app/interfaces/top_bar_click_listener.dart';
import 'package:mivi_app/utils/app_color.dart';
import 'package:mivi_app/utils/constant.dart';
import 'package:mivi_app/utils/sizer_utils.dart';
import 'package:mivi_app/widgets/text/common_text.dart';
import 'package:mivi_app/widgets/top_bar/topbar.dart';

import '../../../localization/language/languages.dart';

class SecurityScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SecurityScreen());
  }

  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> implements TopBarClickListener {
  bool rememberMe = true;
  bool faceId = false;
  bool biometricId = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            isShowBack: true,
            title: Languages.of(context).txtSecurity,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: Column(
              children: [
                _buildSwitchRow(
                  title: 'Remember Me',
                  value: rememberMe,
                  onChanged: (v) => setState(() => rememberMe = v),
                ),
                const Divider(height: 1, thickness: 1),
                _buildSwitchRow(
                  title: 'Face Id',
                  value: faceId,
                  onChanged: (v) => setState(() => faceId = v),
                ),
                const Divider(height: 1, thickness: 1),
                _buildSwitchRow(
                  title: 'Biometric Id',
                  value: biometricId,
                  onChanged: (v) => setState(() => biometricId = v),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchRow({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 8.setHeight),
      title: CommonText(
        text: title,
        fontSize: 14.setFontSize,
        textAlign: TextAlign.start,
        fontFamily: Constant.fontFamilyMedium500,
      ),
      trailing: SizedBox(
        width: 40.setWidth,
        height: 22.setHeight,
        child: FlutterSwitch(
          value: value,
          onToggle: (bool newValue) {
            onChanged(newValue);
          },
          activeColor: CustomAppColor.of(context).secondary,
          inactiveColor: CustomAppColor.of(context).txtGray.withValues(alpha: 0.4),
          activeToggleColor: CustomAppColor.of(context).white,
          inactiveToggleColor: CustomAppColor.of(context).white,
          width: 40.setWidth,
          height: 22.setHeight,
          toggleSize: 16.0,
          borderRadius: 16.0,
          padding: 2.5,
        ),
      ),
      onTap: () => onChanged(!value),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
