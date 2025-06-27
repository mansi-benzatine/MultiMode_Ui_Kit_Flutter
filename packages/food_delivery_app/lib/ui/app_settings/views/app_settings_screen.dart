import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:food_delivery_app_package/interfaces/top_bar_click_listener.dart';
import 'package:food_delivery_app_package/localization/language/languages.dart';
import 'package:food_delivery_app_package/ui/app/my_app.dart';
import 'package:food_delivery_app_package/utils/app_color.dart';
import 'package:food_delivery_app_package/utils/constant.dart';
import 'package:food_delivery_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
import '../../../utils/utils.dart';
import '../../../widgets/text/common_text.dart';

class AppSettingsScreen extends StatefulWidget {
  const AppSettingsScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const AppSettingsScreen());
  }

  @override
  State<AppSettingsScreen> createState() => _AppSettingsScreenState();
}

class _AppSettingsScreenState extends State<AppSettingsScreen> implements TopBarClickListener {
  final ValueNotifier<bool> isAllowPictureInPicture = ValueNotifier<bool>(true);
  ValueNotifier<bool> isDarkMode = ValueNotifier(false);
  _fillData() {
    bool isDarkModePref = !Utils.isLightTheme();

    isDarkMode.value = isDarkModePref;
  }

  @override
  void initState() {
    super.initState();
    _fillData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtAppSettings,
              isShowBack: true,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 14.setHeight, horizontal: 24.setWidth),
              alignment: Alignment.topLeft,
              color: CustomAppColor.of(context).detailScreenBg,
              child: CommonText(
                text: Languages.of(context).txtPictureInPictureMode.toUpperCase(),
                fontSize: 15.setFontSize,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.setHeight, horizontal: 24.setWidth),
              color: CustomAppColor.of(context).bgScaffold,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.setHeight),
                    child: const Icon(Icons.picture_in_picture_alt),
                  ),
                  SizedBox(width: 10.setWidth),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: Languages.of(context).txtAllowPictureInPictureMode,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.setFontSize,
                          letterSpacing: -0.3,
                        ),
                        CommonText(
                          text: Languages.of(context).txtAllowPictureInPictureModeDesc,
                          fontWeight: FontWeight.w400,
                          fontSize: 13.setFontSize,
                          maxLines: 6,
                          height: 1.2,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: isAllowPictureInPicture,
                    builder: (context, value, child) {
                      return FlutterSwitch(
                        value: isAllowPictureInPicture.value,
                        onToggle: (bool newValue) {
                          isAllowPictureInPicture.value = newValue;
                        },
                        activeColor: CustomAppColor.of(context).primary.withValues(alpha: 0.3),
                        inactiveColor: CustomAppColor.of(context).inActiveSwitch,
                        activeToggleColor: CustomAppColor.of(context).primary,
                        inactiveToggleColor: CustomAppColor.of(context).white,
                        width: 38.setWidth,
                        height: 20.setHeight,
                        toggleSize: 18.0,
                        borderRadius: 20.0,
                        padding: 2,
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 14.setHeight, horizontal: 24.setWidth),
              alignment: Alignment.topLeft,
              color: CustomAppColor.of(context).detailScreenBg,
              child: CommonText(
                text: Languages.of(context).txtAppAppearance.toUpperCase(),
                fontSize: 15.setFontSize,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.setHeight, horizontal: 24.setWidth),
              color: CustomAppColor.of(context).bgScaffold,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppAssets.icDarkMode,
                        color: CustomAppColor.of(context).icBlack,
                        width: 20.setWidth,
                        height: 20.setHeight,
                      ),
                      SizedBox(width: 10.setWidth),
                      CommonText(
                        text: Languages.of(context).txtDarkMode,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.setFontSize,
                        letterSpacing: -0.3,
                      ),
                    ],
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: isDarkMode,
                    builder: (context, value, child) {
                      return FlutterSwitch(
                        value: value,
                        onToggle: (bool newValue) {
                          isDarkMode.value = newValue;

                          getIt.get<LocalStorageService>().setBool(
                                LocalStorageService.isLightTheme,
                                !newValue,
                              );
                          final newTheme = newValue ? ThemeData.dark() : ThemeData.light();
                          FoodDeliveryApp.changeTheme(context, newTheme);
                        },
                        activeColor: CustomAppColor.of(context).primary.withValues(alpha: 0.3),
                        inactiveColor: CustomAppColor.of(context).inActiveSwitch,
                        activeToggleColor: CustomAppColor.of(context).primary,
                        inactiveToggleColor: CustomAppColor.of(context).white,
                        width: 38.setWidth,
                        height: 20.setHeight,
                        toggleSize: 18.0,
                        borderRadius: 20.0,
                        padding: 2,
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(color: CustomAppColor.of(context).detailScreenBg),
            )
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
}
