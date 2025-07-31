import 'package:flutter/material.dart';
import 'package:run_tracker_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:run_tracker_screens_app/localization/language/languages.dart';
import 'package:run_tracker_screens_app/ui/start_running/views/start_running_screen.dart';
import 'package:run_tracker_screens_app/utils/app_assets.dart';
import 'package:run_tracker_screens_app/utils/app_color.dart';
import 'package:run_tracker_screens_app/utils/sizer_utils.dart';
import 'package:run_tracker_screens_app/widgets/button/common_button.dart';
import 'package:run_tracker_screens_app/widgets/text/common_text.dart';
import 'package:run_tracker_screens_app/widgets/top_bar/topbar.dart';

class AllowLocationsPermissionScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => AllowLocationsPermissionScreen());
  }

  const AllowLocationsPermissionScreen({super.key});

  @override
  State<AllowLocationsPermissionScreen> createState() =>
      _AllowLocationsPermissionScreenState();
}

class _AllowLocationsPermissionScreenState
    extends State<AllowLocationsPermissionScreen>
    implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: Column(
        children: [
          TopBar(
            this,
            simpleTitle: Languages.of(context).txtAllowLocations.toUpperCase(),
            isShowSimpleTitle: true,
          ),
          SizedBox(height: 70.setHeight),
          Image.asset(
            AppAssets.imgMapPermission,
            height: 188.setHeight,
            width: 284.setWidth,
          ),
          SizedBox(height: 35.setHeight),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 20.setHeight,
                horizontal: 24.setWidth,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  CommonText(
                    text: Languages.of(
                      context,
                    ).txtUseYourLocation.toUpperCase(),
                    textColor: CustomAppColor.of(context).txtWhite,
                    fontSize: 24.setFontSize,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: 15.setHeight),
                  CommonText(
                    text: Languages.of(context).txtUseYourLocationDesc1,
                    textColor: CustomAppColor.of(context).txtWhite,
                    fontSize: 16.setFontSize,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 15.setHeight),
                  CommonText(
                    text: Languages.of(context).txtUseYourLocationDesc2,
                    textColor: CustomAppColor.of(context).txtWhite,
                    fontSize: 16.setFontSize,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 25.setHeight),

                  CommonText(
                    text: Languages.of(context).txtNotNow.toUpperCase(),
                    textColor: CustomAppColor.of(context).txtWhite,
                    fontSize: 18.setFontSize,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: 25.setHeight),
                  IgnorePointer(
                    ignoring: true,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.setWidth),
                      child: CommonButton(
                        onTap: () =>
                            Navigator.push(context, StartRunningScreen.route()),
                        text: Languages.of(context).txtAllow,
                        radius: 30,
                        buttonTextColor: CustomAppColor.of(context).black,
                        buttonTextWeight: FontWeight.w900,
                        buttonTextSize: 18.setFontSize,
                      ),
                    ),
                  ),
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
    // TODO: implement onTopBarClick
  }
}
