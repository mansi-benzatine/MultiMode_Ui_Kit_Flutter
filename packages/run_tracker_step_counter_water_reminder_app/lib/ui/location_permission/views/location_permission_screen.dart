import 'package:flutter/material.dart';
import 'package:run_tracker_step_counter_water_reminder_app/localization/language/languages.dart';
import 'package:run_tracker_step_counter_water_reminder_app/ui/start_run_tracker/views/start_run_tracker_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_app/utils/app_assets.dart';
import 'package:run_tracker_step_counter_water_reminder_app/utils/app_color.dart';
import 'package:run_tracker_step_counter_water_reminder_app/utils/sizer_utils.dart';
import 'package:run_tracker_step_counter_water_reminder_app/widgets/button/common_button.dart';
import 'package:run_tracker_step_counter_water_reminder_app/widgets/text/common_text.dart';

import '../../dashboard/views/dashboard_screen.dart';

class LocationPermissionScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => LocationPermissionScreen());
  }

  const LocationPermissionScreen({super.key});

  @override
  State<LocationPermissionScreen> createState() =>
      _LocationPermissionScreenState();
}

class _LocationPermissionScreenState extends State<LocationPermissionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: PopScope(
        canPop: false,

        onPopInvokedWithResult: (didPop, result) {
          if (!didPop) {
            Navigator.pushReplacement(context, DashboardScreen.route());
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.setWidth,
                vertical: 24.setHeight,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: CommonText(
                      text: Languages.of(context).txtSkip,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.setFontSize,
                    ),
                  ),
                  SizedBox(height: 80.setHeight),
                  Image.asset(
                    AppAssets.imgLocationPermission,
                    width: 300.setWidth,
                    height: 200.setHeight,
                  ),
                  SizedBox(height: 16.setHeight),
                  CommonText(
                    text: Languages.of(context).txtUseYourLocation,
                    fontSize: 28.setFontSize,
                    fontWeight: FontWeight.w500,
                    textColor: CustomAppColor.of(context).txtPurpleWhite,
                  ),
                  SizedBox(height: 16.setHeight),
                  CommonText(
                    text: Languages.of(context).txtLocationDesc,
                    fontSize: 18.setFontSize,
                    fontWeight: FontWeight.w400,
                    textColor: CustomAppColor.of(context).txtGrey,
                  ),
                  SizedBox(height: 18.setHeight),
                  CommonText(
                    text: Languages.of(context).txtLocationDesc1,
                    fontSize: 18.setFontSize,
                    fontWeight: FontWeight.w400,
                    textColor: CustomAppColor.of(context).txtGrey,
                  ),
                  SizedBox(height: 56.setHeight),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: 40.setWidth,
                    ),
                    child: CommonButton(
                      text: Languages.of(context).txtAllow,
                      onTap: () => Navigator.push(
                        context,
                        StartRunTrackerScreen.route(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
