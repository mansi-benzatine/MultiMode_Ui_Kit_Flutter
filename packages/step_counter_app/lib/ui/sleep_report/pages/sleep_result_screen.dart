import 'package:flutter/material.dart';
import 'package:step_counter_app_package/utils/app_assets.dart';
import 'package:step_counter_app_package/utils/app_color.dart';
import 'package:step_counter_app_package/utils/sizer_utils.dart';
import 'package:step_counter_app_package/widgets/text/common_text.dart';

class SleepResultScreen extends StatefulWidget {
  const SleepResultScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (context) => const SleepResultScreen());
  }

  @override
  State<SleepResultScreen> createState() => _SleepResultScreenState();
}

class _SleepResultScreenState extends State<SleepResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Container(
        height: 0.screenHeight,
        width: 0.screenWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.imgBgSleepResult),
            fit: BoxFit.fill,
          ),
        ),
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 25.setWidth, vertical: 25.setHeight),
          padding: EdgeInsets.symmetric(vertical: 20.setHeight, horizontal: 20.setWidth),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).white.withValues(alpha: 0.35),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonText(
                text: "Sleep Tracker".toUpperCase(),
                fontSize: 23.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).white,
              ),
              SizedBox(height: 5.setHeight),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
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
                      fontSize: 16.setFontSize,
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
                      text: "7hrs  24mins",
                      fontSize: 24.setFontSize,
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).white,
                      textAlign: TextAlign.center,
                    ),
                    CommonText(
                      text: "11:00 PM to 07:00 AM",
                      fontSize: 12.setFontSize,
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).white,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.setHeight),
              Center(
                child: Image.asset(
                  AppAssets.icSleepResult,
                  width: 140.setWidth,
                  height: 160.setHeight,
                  color: CustomAppColor.of(context).white,
                ),
              ),
              SizedBox(height: 25.setHeight),
              Center(
                child: CommonText(
                  text: "Record your sleep to see patterns and manage your sleep",
                  fontSize: 15.setFontSize,
                  fontWeight: FontWeight.w500,
                  textColor: CustomAppColor.of(context).white,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20.setHeight),
            ],
          ),
        ),
      ),
    );
  }
}
