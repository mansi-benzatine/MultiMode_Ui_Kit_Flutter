import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:step_counter_screens_app_package/utils/app_assets.dart';
import 'package:step_counter_screens_app_package/utils/app_color.dart';
import 'package:step_counter_screens_app_package/utils/sizer_utils.dart';
import 'package:step_counter_screens_app_package/widgets/text/common_text.dart';

class WaterResultScreen extends StatefulWidget {
  const WaterResultScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (context) => const WaterResultScreen());
  }

  @override
  State<WaterResultScreen> createState() => _WaterResultScreenState();
}

class _WaterResultScreenState extends State<WaterResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Container(
        height: 0.screenHeight,
        width: 0.screenWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.imgBgWaterResult),
            fit: BoxFit.fill,
          ),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 25.setWidth, vertical: 25.setHeight),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.setHeight, horizontal: 20.setWidth),
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: CustomAppColor.of(context).white.withValues(alpha: 0.1),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonText(
                    text: "Water Tracker".toUpperCase(),
                    fontSize: 23.setFontSize,
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).white,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        AppAssets.icCalender,
                        width: 22.setWidth,
                        height: 22.setHeight,
                        color: CustomAppColor.of(context).white,
                      ),
                      SizedBox(width: 5.setWidth),
                      Expanded(
                        child: CommonText(
                          text: "29-June-2022",
                          fontSize: 15.setFontSize,
                          fontWeight: FontWeight.w500,
                          textColor: CustomAppColor.of(context).white,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 35.setHeight),
                  Center(
                    child: Column(
                      children: [
                        CommonText(
                          text: "Water Intake target was a 10 Glasses.",
                          fontSize: 18.setFontSize,
                          fontWeight: FontWeight.w400,
                          textColor: CustomAppColor.of(context).white,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25.setHeight),
                  Center(
                    child: Image.asset(
                      AppAssets.icWaterResult,
                      width: 160.setWidth,
                      height: 160.setHeight,
                      color: CustomAppColor.of(context).white,
                    ),
                  ),
                  SizedBox(height: 35.setHeight),
                  Center(
                    child: CommonText(
                      text: "8 Glasses",
                      fontSize: 24.setFontSize,
                      fontWeight: FontWeight.w600,
                      textColor: CustomAppColor.of(context).white,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Center(
                    child: CommonText(
                      text: "(2,000 ml)",
                      fontSize: 16.setFontSize,
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).white,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 25.setHeight),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
