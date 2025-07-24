import 'package:flutter/material.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/localization/language/languages.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/app_assets.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/app_color.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/sizer_utils.dart';

import '../../../widgets/text/common_text.dart';

class RunningViewDetailsScreen extends StatelessWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const RunningViewDetailsScreen());
  }

  const RunningViewDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              AppAssets.imgShareMapView,
              height: 200.setHeight,
              alignment: Alignment.topCenter,
              width: double.infinity,
            ),

            Positioned(
              top: 50.setHeight,
              left: 24.setWidth,
              right: 24.setWidth,
              child: IgnorePointer(
                ignoring: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _circleIcon(
                      context,
                      AppAssets.icBack,
                      CustomAppColor(context).primary,
                      onTap: () => Navigator.pop(context),
                    ),
                    _circleIcon(context, AppAssets.icDustbin, Colors.red),
                    Column(
                      children: [
                        _circleIcon(
                          context,
                          AppAssets.icShare,
                          CustomAppColor(context).primary,
                        ),
                        SizedBox(height: 20.setHeight),
                        _circleIcon(
                          context,
                          AppAssets.icNetwork,
                          CustomAppColor(context).primary,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: const DetailsView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleIcon(
    BuildContext context,
    String icon,
    Color containerColor, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.setWidth),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Image.asset(
          icon,
          color: CustomAppColor.of(context).white,
          width: 22.setWidth,
          height: 22.setHeight,
        ),
      ),
    );
  }
}

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.setHeight),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).primary,
        borderRadius: BorderRadius.vertical(top: Radius.circular(39)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 4.setHeight,
            width: 30.setWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Color(0xFFD1C2FB),
            ),
          ),
          SizedBox(height: 10.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _infoColumn(
                  context,
                  "00:10:56",
                  Languages.of(context).txtTimeMin.toUpperCase(),
                ),
                _infoColumn(
                  context,
                  "0.90",
                  Languages.of(context).txtPaceMinKm.toUpperCase(),
                ),
                _infoColumn(
                  context,
                  "5.0",
                  Languages.of(context).txtKcal.toUpperCase(),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.setHeight),
          Divider(color: CustomAppColor.of(context).purpleDivider),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: "15.98",
            fontSize: 36.setFontSize,
            fontWeight: FontWeight.w400,
            textColor: Colors.white,
          ),
          CommonText(
            text: Languages.of(context).txtDistanceKm.toUpperCase(),
            fontSize: 13.setFontSize,
            textColor: CustomAppColor.of(context).txtLightPurple,
          ),
          SizedBox(height: 20.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
            child: Row(
              children: [
                CommonText(
                  text: "${Languages.of(context).txtIntensityMin}:",
                  fontSize: 13.setFontSize,
                  fontWeight: FontWeight.w500,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(height: 20.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _intensityColumn(
                  context,
                  "00:10:52",
                  Languages.of(context).txtLow.toUpperCase(),
                  AppAssets.icBlueWalk,
                ),
                _intensityColumn(
                  context,
                  "00:25:85",
                  Languages.of(context).txtModerate.toUpperCase(),
                  AppAssets.icGreenWalk,
                ),
                _intensityColumn(
                  context,
                  "00:48:98",
                  Languages.of(context).txtHigh.toUpperCase(),
                  AppAssets.icRedWalk,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoColumn(BuildContext context, String value, String label) {
    return Column(
      children: [
        CommonText(
          text: value,
          fontSize: 26.setFontSize,
          fontWeight: FontWeight.w500,
          textColor: Colors.white,
        ),
        SizedBox(height: 4.setHeight),
        CommonText(
          text: label,
          fontSize: 12.setFontSize,
          textColor: CustomAppColor.of(context).txtLightPurple,
        ),
      ],
    );
  }

  Widget _intensityColumn(
    BuildContext context,
    String time,
    String label,
    String icon,
  ) {
    return Column(
      children: [
        Image.asset(icon, height: 24.setHeight, width: 24.setWidth),
        SizedBox(height: 10.setHeight),
        CommonText(
          text: time,
          fontSize: 16.setFontSize,
          fontWeight: FontWeight.w500,
          textColor: Colors.white,
        ),
        SizedBox(height: 4.setHeight),
        CommonText(
          text: label,
          fontSize: 12.setFontSize,
          textColor: CustomAppColor.of(context).txtLightPurple,
        ),
      ],
    );
  }
}
