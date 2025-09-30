import 'package:flutter/material.dart';
import 'package:step_counter_app_package/localization/language/languages.dart';
import 'package:step_counter_app_package/utils/app_assets.dart';
import 'package:step_counter_app_package/utils/app_color.dart';
import 'package:step_counter_app_package/utils/constant.dart';
import 'package:step_counter_app_package/utils/sizer_utils.dart';
import 'package:step_counter_app_package/utils/utils.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class SetWaterTrackerScreen extends StatefulWidget {
  const SetWaterTrackerScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (context) => const SetWaterTrackerScreen());
  }

  @override
  State<SetWaterTrackerScreen> createState() => _SetWaterTrackerScreenState();
}

class _SetWaterTrackerScreenState extends State<SetWaterTrackerScreen> implements TopBarClickListener {
  int currentGlasses = 4;
  final int targetGlasses = 8;

  void _incrementGlasses() {
    if (currentGlasses < targetGlasses) {
      setState(() {
        currentGlasses++;
      });
    }
  }

  void _decrementGlasses() {
    if (currentGlasses > 0) {
      setState(() {
        currentGlasses--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtSetTarget,
            textAlign: Alignment.centerLeft,
            isShowBack: true,
          ),
          SizedBox(height: 20.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.imgWaterGlasses,
                width: 18.setWidth,
                height: 28.setHeight,
              ),
              SizedBox(width: 10.setWidth),
              CommonText(
                text: "Daily Water Intake (Glass)",
                fontSize: 18.setFontSize,
                textColor: CustomAppColor.of(context).txtBlack,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          SizedBox(height: 20.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: Row(
              children: [
                GestureDetector(
                  onTap: _decrementGlasses,
                  child: Container(
                    width: 36.setWidth,
                    height: 36.setHeight,
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).bgContainerGrayAndBlack,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.remove,
                      color: CustomAppColor.of(context).white,
                      size: 30.setWidth,
                    ),
                  ),
                ),
                Expanded(
                  child: WaterProgressWidget(
                    currentGlasses: currentGlasses,
                    targetGlasses: targetGlasses,
                  ),
                ),
                GestureDetector(
                  onTap: _incrementGlasses,
                  child: Container(
                    width: 36.setWidth,
                    height: 36.setHeight,
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).colorWater,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.add,
                      color: CustomAppColor.of(context).white,
                      size: 30.setWidth,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: Languages.of(context).txtGoodHealthStartsWithStayingHydrated,
                    style: TextStyle(
                      fontSize: 13.setFontSize,
                      color: CustomAppColor.of(context).txtGray,
                      fontWeight: FontWeight.w400,
                      fontFamily: Constant.fontFamily,
                      package: 'step_counter_app_package',
                    ),
                  ),
                  TextSpan(
                    text: Languages.of(context).txtGlassIs250Ml,
                    style: TextStyle(
                      fontSize: 13.setFontSize,
                      color: CustomAppColor.of(context).txtDarkGray,
                      fontWeight: FontWeight.w500,
                      fontFamily: Constant.fontFamily,
                      package: 'step_counter_app_package',
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
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}

class WaterProgressWidget extends StatelessWidget {
  final int currentGlasses;
  final int targetGlasses;

  const WaterProgressWidget({
    super.key,
    required this.currentGlasses,
    required this.targetGlasses,
  });

  @override
  Widget build(BuildContext context) {
    double progressValue = (currentGlasses / targetGlasses) * 100;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        children: [
          SizedBox(height: 40.setHeight),
          // Circular Progress using SfRadialGauge
          SizedBox(
            width: 200.setWidth,
            height: 200.setHeight,
            child: SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 100,
                  showLabels: false,
                  showTicks: false,
                  startAngle: 270,
                  endAngle: 270,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.1,
                    cornerStyle: CornerStyle.bothCurve,
                    color: CustomAppColor.of(context).bgGray.withOpacityPercent(0.8),
                    thicknessUnit: GaugeSizeUnit.factor,
                  ),
                  pointers: <GaugePointer>[
                    RangePointer(
                      value: progressValue,
                      cornerStyle: CornerStyle.bothCurve,
                      width: 0.25,
                      sizeUnit: GaugeSizeUnit.factor,
                      color: CustomAppColor.of(context).colorWater,
                      pointerOffset: -0.1,
                    ),
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      positionFactor: 0.1,
                      angle: 90,
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonText(
                            text: currentGlasses.toString(),
                            fontSize: 48.setFontSize,
                            textColor: CustomAppColor.of(context).txtBlack,
                            fontWeight: FontWeight.bold,
                            height: 0.8,
                          ),
                          CommonText(
                            text: "Glasses",
                            fontSize: 16.setFontSize,
                            textColor: CustomAppColor.of(context).txtGray,
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 60.setHeight),
          // Bottom text
        ],
      ),
    );
  }
}
