import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../../../../interfaces/top_bar_click_listener.dart';
import '../../../../../../localization/language/languages.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/text/common_text.dart';
import '../../../../../../widgets/topbar/topbar.dart';
import '../../../utils/app_color.dart';
import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
import '../../../utils/string_constant.dart';
import '../../../utils/utils.dart';
import '../../app/my_app.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  static Route route() {
    return MaterialPageRoute(builder: (context) => const SettingsScreen());
  }

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> implements TopBarClickListener {
  ValueNotifier<bool> isDarkMode = ValueNotifier(false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bool isDarkModePref = Utils.isDarkTheme();

    isDarkMode.value = isDarkModePref;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgTopBar,
      body: Column(
        children: [
          IgnorePointer(
            ignoring: true,
            child: TopBar(
              this,
              isShowBack: true,
              title: Languages.of(context).settings,
              textColor: CustomAppColor.of(context).txtBlack,
              topBarColor: CustomAppColor.of(context).bgTopBar,
            ),
          ),
          Expanded(child: _shareSettings(context, isDarkMode))
        ],
      ),
    );
  }

  _shareSettings(BuildContext context, ValueNotifier<bool> switchValue) {
    return IgnorePointer(
      ignoring: true,
      child: Container(
        height: AppSizes.setHeight(100),
        color: CustomAppColor.of(context).bgScaffold,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(12), horizontal: AppSizes.setWidth(12)),
              child: CommonText(
                text: Languages.of(context).shareSettings.toUpperCase(),
                fontSize: AppSizes.setFontSize(18),
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(14), horizontal: AppSizes.setWidth(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: Languages.of(context).includeTextAsImage,
                    fontSize: AppSizes.setFontSize(16),
                    fontWeight: FontWeight.w500,
                  ),
                  FlutterSwitch(
                    value: true,
                    onToggle: (bool newValue) {},
                    activeColor: CustomAppColor.of(context).icPurple.withOpacityPercent(0.2),
                    inactiveColor: CustomAppColor.of(context).txtGrey,
                    activeToggleColor: CustomAppColor.of(context).icPurple,
                    inactiveToggleColor: CustomAppColor.of(context).white,
                    width: AppSizes.setWidth(38),
                    height: AppSizes.setHeight(20),
                    toggleSize: 22.0,
                    borderRadius: 16.0,
                    padding: 0,
                  )
                ],
              ),
            ),
            Divider(
              color: CustomAppColor.of(context).bgTopBar,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(10), horizontal: AppSizes.setWidth(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: Languages.of(context).includeLogoInImages,
                    fontSize: AppSizes.setFontSize(16),
                    fontWeight: FontWeight.w500,
                  ),
                  FlutterSwitch(
                    value: true,
                    onToggle: (bool newValue) {},
                    activeColor: CustomAppColor.of(context).icPurple.withOpacityPercent(0.2),
                    inactiveColor: CustomAppColor.of(context).txtGrey,
                    activeToggleColor: CustomAppColor.of(context).icPurple,
                    inactiveToggleColor: CustomAppColor.of(context).white,
                    width: AppSizes.setWidth(38),
                    height: AppSizes.setHeight(20),
                    toggleSize: 22.0,
                    borderRadius: 16.0,
                    padding: 0,
                  )
                ],
              ),
            ),
            Divider(
              color: CustomAppColor.of(context).bgTopBar,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(10), horizontal: AppSizes.setWidth(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: Languages.of(context).darkMode,
                    fontSize: AppSizes.setFontSize(16),
                    fontWeight: FontWeight.w500,
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: isDarkMode,
                    builder: (context, value, child) {
                      return FlutterSwitch(
                        value: !value,
                        onToggle: (bool newValue) {
                          isDarkMode.value = !newValue;
                          getIt.get<LocalStorageService>().setBool(
                                LocalStorageService.isLightTheme,
                                !newValue,
                              );
                        },
                        activeColor: CustomAppColor.of(context).icPurple.withOpacityPercent(0.2),
                        inactiveColor: CustomAppColor.of(context).txtGrey,
                        activeToggleColor: CustomAppColor.of(context).icPurple,
                        inactiveToggleColor: CustomAppColor.of(context).white,
                        width: AppSizes.setWidth(38),
                        height: AppSizes.setHeight(20),
                        toggleSize: 22.0,
                        borderRadius: 16.0,
                        padding: 0,
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {String value = ""}) {
    if (name == AppStrings.back) {
      Navigator.pop(GoozzyECommerceScreensMyApp.navigatorKey.currentState!.context);
    }
  }
}
