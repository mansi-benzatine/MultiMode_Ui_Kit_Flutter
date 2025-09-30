import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:step_counter_screens_app_package/localization/language/languages.dart';
import 'package:step_counter_screens_app_package/utils/app_assets.dart';
import 'package:step_counter_screens_app_package/utils/app_color.dart';
import 'package:step_counter_screens_app_package/utils/sizer_utils.dart';
import 'package:step_counter_screens_app_package/widgets/text/common_text.dart';

class StepResultScreen extends StatefulWidget {
  const StepResultScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (context) => const StepResultScreen());
  }

  @override
  State<StepResultScreen> createState() => _StepResultScreenState();
}

class _StepResultScreenState extends State<StepResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Stack(
        children: [
          Image.asset(AppAssets.imgBgStepsResult),
          Positioned(
            top: 120.setHeight,
            bottom: 120.setHeight,
            left: 0,
            right: 0,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 10.0),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25.setWidth, vertical: 40.setHeight),
                padding: EdgeInsets.symmetric(vertical: 20.setHeight, horizontal: 20.setWidth),
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).white.withValues(alpha: 0.30),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CommonText(
                      text: "Morning".toUpperCase(),
                      fontSize: 22.setFontSize,
                      fontWeight: FontWeight.w600,
                      textColor: CustomAppColor.of(context).white,
                    ),
                    SizedBox(height: 4.setHeight),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppAssets.icCalender,
                          width: 24.setWidth,
                          height: 24.setHeight,
                          color: CustomAppColor.of(context).white,
                        ),
                        SizedBox(width: 5.setWidth),
                        Expanded(
                          child: CommonText(
                            text: "Sep 19, 04:00 Am - 10:00 AM",
                            fontSize: 14.setFontSize,
                            fontWeight: FontWeight.w500,
                            textColor: CustomAppColor.of(context).white,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 35.setHeight),
                    Center(
                      child: Image.asset(
                        AppAssets.icFootStep,
                        width: 100.setWidth,
                        height: 100.setHeight,
                        color: CustomAppColor.of(context).white,
                      ),
                    ),
                    SizedBox(height: 35.setHeight),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CommonText(
                          text: "10",
                          fontSize: 40.setFontSize,
                          fontWeight: FontWeight.w700,
                          textColor: CustomAppColor.of(context).white,
                          textAlign: TextAlign.center,
                          height: 1,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8.setHeight),
                          child: CommonText(
                            text: "Min",
                            fontSize: 24.setFontSize,
                            fontWeight: FontWeight.w700,
                            textColor: CustomAppColor.of(context).white,
                            textAlign: TextAlign.center,
                            height: 1,
                          ),
                        ),
                        SizedBox(width: 5.setWidth),
                        CommonText(
                          text: "56",
                          fontSize: 40.setFontSize,
                          fontWeight: FontWeight.w700,
                          textColor: CustomAppColor.of(context).white,
                          textAlign: TextAlign.center,
                          height: 1,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8.setHeight),
                          child: CommonText(
                            text: "Sec",
                            fontSize: 24.setFontSize,
                            fontWeight: FontWeight.w700,
                            textColor: CustomAppColor.of(context).white,
                            textAlign: TextAlign.center,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.setHeight),
                    Center(
                      child: CommonText(
                        text: Languages.of(context).txtActiveTime,
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w500,
                        textColor: CustomAppColor.of(context).white,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 25.setHeight),
                    Center(
                      child: CommonText(
                        text: "18",
                        fontSize: 40.setFontSize,
                        fontWeight: FontWeight.w700,
                        textColor: CustomAppColor.of(context).white,
                        textAlign: TextAlign.center,
                        height: 1,
                      ),
                    ),
                    SizedBox(height: 5.setHeight),
                    Center(
                      child: CommonText(
                        text: "kilometers",
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w500,
                        textColor: CustomAppColor.of(context).white,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
