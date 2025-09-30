import 'package:flutter/material.dart';
import 'package:step_counter_screens_app_package/utils/sizer_utils.dart';
import 'package:step_counter_screens_app_package/utils/utils.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../widgets/text/common_text.dart';

class ClockProgressWidget extends StatelessWidget {
  final int startHour;
  final int startMinute;
  final String startUnit;
  final int endHour;
  final int endMinute;
  final String endUnit;
  final double? width;
  final double? height;
  final bool showIndicators;
  final bool showClockNumbers;
  final bool showCenterTime;
  final String? centerMainText;
  final String? centerSubText;

  const ClockProgressWidget({
    super.key,
    required this.startHour,
    required this.startMinute,
    required this.startUnit,
    required this.endHour,
    required this.endMinute,
    required this.endUnit,
    this.width,
    this.height,
    this.showIndicators = true,
    this.showClockNumbers = true,
    this.showCenterTime = true,
    this.centerMainText,
    this.centerSubText,
  });

  // Calculate start time angle on clock (12 o'clock = 270°, clockwise)
  double get startAngle {
    int startHour24 = startHour;
    if (startUnit == 'PM' && startHour != 12) {
      startHour24 += 12;
    } else if (startUnit == 'AM' && startHour == 12) {
      startHour24 = 0;
    }

    // Convert to 12-hour format for clock display
    int clockHour = startHour24 % 12;
    double hourAngle = (clockHour * 30.0); // 30 degrees per hour
    double minuteAngle = (startMinute * 0.5); // 0.5 degrees per minute
    double totalAngle = hourAngle + minuteAngle;

    // Convert to gauge coordinate system (12 o'clock = 270°)
    return (270 + totalAngle) % 360;
  }

  // Calculate end time angle on clock
  double get endAngle {
    int endHour24 = endHour;
    if (endUnit == 'PM' && endHour != 12) {
      endHour24 += 12;
    } else if (endUnit == 'AM' && endHour == 12) {
      endHour24 = 0;
    }

    // Convert to 12-hour format for clock display
    int clockHour = endHour24 % 12;
    double hourAngle = (clockHour * 30.0); // 30 degrees per hour
    double minuteAngle = (endMinute * 0.5); // 0.5 degrees per minute
    double totalAngle = hourAngle + minuteAngle;

    // Convert to gauge coordinate system (12 o'clock = 270°)
    return (270 + totalAngle) % 360;
  }

  // Calculate the sweep angle for the progress arc
  double get sweepAngle {
    double start = startAngle;
    double end = endAngle;

    // Handle overnight case where end angle is less than start angle
    if (end <= start) {
      return (360 - start) + end;
    } else {
      return end - start;
    }
  }

  // Calculate duration between start and end times
  Duration get duration {
    // Convert start time to 24-hour format
    int startHour24 = startHour;
    if (startUnit == 'PM' && startHour != 12) {
      startHour24 += 12;
    } else if (startUnit == 'AM' && startHour == 12) {
      startHour24 = 0;
    }

    // Convert end time to 24-hour format
    int endHour24 = endHour;
    if (endUnit == 'PM' && endHour != 12) {
      endHour24 += 12;
    } else if (endUnit == 'AM' && endHour == 12) {
      endHour24 = 0;
    }

    // Calculate total minutes for start and end times
    int startMinutes = startHour24 * 60 + startMinute;
    int endMinutes = endHour24 * 60 + endMinute;

    // Handle overnight case (end time next day)
    if (endMinutes <= startMinutes) {
      endMinutes += 24 * 60; // Add 24 hours
    }

    // Calculate duration in minutes
    int durationMinutes = endMinutes - startMinutes;
    return Duration(minutes: durationMinutes);
  }

  String get durationText {
    int hours = duration.inHours;
    return "${hours}hr";
  }

  String get durationMinutesText {
    int minutes = duration.inMinutes % 60;
    return "${minutes.toString().padLeft(2, '0')}min";
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 300.setWidth,
      height: height ?? 300.setHeight,
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            minimum: 0,
            maximum: 360,
            startAngle: startAngle - 8,
            endAngle: startAngle - 8,
            showLabels: false,
            showTicks: false,
            radiusFactor: 0.95,
            axisLineStyle: AxisLineStyle(
              thickness: 0.23,
              cornerStyle: CornerStyle.bothFlat,
              color: Utils.isLightTheme() ? const Color(0xffF8F8F8) : const Color(0xff1F222A),
              thicknessUnit: GaugeSizeUnit.factor,
            ),
            pointers: <GaugePointer>[
              RangePointer(
                value: sweepAngle + 16,
                width: 0.23,
                sizeUnit: GaugeSizeUnit.factor,
                cornerStyle: CornerStyle.bothCurve,
                enableAnimation: false,
                gradient: SweepGradient(
                  colors: <Color>[CustomAppColor.of(context).colorTimes],
                ),
              ),
            ],
            annotations: <GaugeAnnotation>[
              // Clock numbers
              if (showClockNumbers) ...[
                GaugeAnnotation(
                  widget: CommonText(
                    text: '12',
                    fontSize: 16.setFontSize,
                    fontWeight: FontWeight.w500,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                  angle: 270,
                  positionFactor: 0.65,
                ),
                GaugeAnnotation(
                  widget: CommonText(
                    text: '3',
                    fontSize: 16.setFontSize,
                    fontWeight: FontWeight.w500,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                  angle: 0,
                  positionFactor: 0.65,
                ),
                GaugeAnnotation(
                  widget: CommonText(
                    text: '6',
                    fontSize: 16.setFontSize,
                    fontWeight: FontWeight.w500,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                  angle: 90,
                  positionFactor: 0.65,
                ),
                GaugeAnnotation(
                  widget: CommonText(
                    text: '9',
                    fontSize: 16.setFontSize,
                    fontWeight: FontWeight.w500,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                  angle: 180,
                  positionFactor: 0.65,
                ),
              ],

              // Center time display
              if (showCenterTime)
                GaugeAnnotation(
                  widget: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CommonText(
                        text: centerMainText ?? durationText,
                        fontSize: 36.setFontSize,
                        fontWeight: FontWeight.bold,
                        textColor: CustomAppColor.of(context).colorTimes,
                      ),
                      CommonText(
                        text: centerSubText ?? durationMinutesText,
                        fontSize: 14.setFontSize,
                        textColor: CustomAppColor.of(context).txtGray,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  angle: 90,
                  positionFactor: 0.1,
                ),

              // Start time indicator
              if (showIndicators)
                GaugeAnnotation(
                  widget: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).white,
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(5.setWidth),
                    child: Image.asset(
                      AppAssets.icBedTime,
                      color: CustomAppColor.of(context).colorTimes,
                    ),
                  ),
                  angle: startAngle,
                  positionFactor: 0.88,
                ),

              // End time indicator
              if (showIndicators)
                GaugeAnnotation(
                  widget: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).white,
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(5.setWidth),
                    child: Image.asset(
                      AppAssets.icWakeUp,
                      color: CustomAppColor.of(context).colorTimes,
                      fit: BoxFit.contain,
                    ),
                  ),
                  angle: endAngle,
                  positionFactor: 0.87,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
