import 'package:flutter/material.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/localization/language/languages.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/ui/last_seven_days_report/views/last_seven_days_report_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/ui/report/views/report_screen.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/app_assets.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/app_color.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/constant.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/utils/sizer_utils.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/widgets/text/common_text.dart';
import 'package:run_tracker_step_counter_water_reminder_screens_app/widgets/top_bar/topbar.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../widgets/button/common_button.dart';

class StepCounterScreen extends StatefulWidget {
  const StepCounterScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => StepCounterScreen());
  }

  @override
  State<StepCounterScreen> createState() => _StepCounterScreenState();
}

class _StepCounterScreenState extends State<StepCounterScreen>
    implements TopBarClickListener {
  double stepValue = 149;
  double maxSteps = 6000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              simpleTitle: Languages.of(context).txtStepCounter,
              isShowSimpleTitle: true,
              isShowBack: true,
              isShowMore: true,
            ),
            SizedBox(height: 20.setHeight),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: CustomAppColor.of(context).black,
                        child: Icon(
                          Icons.pause,
                          color: CustomAppColor.of(context).white,
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 150.setHeight,
                          width: 150.setWidth,
                          child: SfRadialGauge(
                            axes: <RadialAxis>[
                              RadialAxis(
                                canScaleToFit: true,
                                showTicks: false,
                                showLabels: false,
                                minimum: 0,
                                maximum: 100,
                                radiusFactor: 1.3,
                                axisLineStyle: AxisLineStyle(
                                  thickness: 0.18,
                                  cornerStyle: CornerStyle.bothCurve,
                                  color: CustomAppColor.of(
                                    context,
                                  ).lime.withValues(alpha: 0.2),
                                  thicknessUnit: GaugeSizeUnit.factor,
                                ),
                                pointers: <GaugePointer>[
                                  RangePointer(
                                    value: 75,
                                    width: 0.20,
                                    gradient: SweepGradient(
                                      colors: [
                                        CustomAppColor.of(context).lime,
                                        CustomAppColor.of(context).lime,
                                      ],
                                      startAngle: 23,
                                      endAngle: 50,
                                    ),
                                    cornerStyle: CornerStyle.bothCurve,
                                    sizeUnit: GaugeSizeUnit.factor,
                                  ),
                                ],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                    positionFactor: 0.04,
                                    angle: 100,
                                    widget: FittedBox(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,

                                        children: [
                                          CommonText(
                                            text: "${stepValue.toInt()}",
                                            fontSize: 48.setFontSize,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          CommonText(
                                            text: "/${maxSteps.toInt()}",
                                            fontSize: 16.setFontSize,
                                            fontWeight: FontWeight.w400,
                                            textColor: CustomAppColor.of(
                                              context,
                                            ).txtGrey,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      IgnorePointer(
                        ignoring: true,
                        child: GestureDetector(
                          onTap: () =>
                              Navigator.push(context, ReportScreen.route()),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: CustomAppColor.of(context).black,
                            child: Image.asset(
                              AppAssets.icGraph,
                              height: 20.setHeight,
                              width: 20.setWidth,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.setHeight),
                  CommonText(
                    text: Languages.of(context).txtSteps,
                    fontSize: 14.setFontSize,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 30.setHeight),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: buildMiniGaugesRow(context),
                  ),
                  SizedBox(height: 40.setHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _statColumn("00h 6m", Languages.of(context).txtDuration),
                      _statColumn("12", "Kcal"),
                      _statColumn("0.10", "Km"),
                    ],
                  ),
                  SizedBox(height: 40.setHeight),
                  IgnorePointer(
                    ignoring: true,
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        LastSevenDaysReportScreen.route(),
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.setWidth,
                          vertical: 15.setHeight,
                        ),
                        decoration: BoxDecoration(
                          color: CustomAppColor.of(context).containerBlack,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text:
                                  "${Languages.of(context).txtLastSevenDaysSteps}:",
                              fontSize: 17.setFontSize,
                              textColor: CustomAppColor.of(context).white,
                              fontWeight: FontWeight.w700,
                            ),
                            SizedBox(height: 2.setHeight),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonText(
                                  text: "1125",
                                  fontSize: 48.setFontSize,
                                  textColor: CustomAppColor.of(context).lime,
                                  fontWeight: FontWeight.bold,
                                ),
                                Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CustomAppColor.of(context).lime,
                                  ),
                                  child: Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: CustomAppColor.of(context).black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statColumn(String value, String label) {
    return Column(
      children: [
        CommonText(
          text: value,
          fontSize: 30.setFontSize,
          fontWeight: FontWeight.w600,
        ),
        CommonText(
          text: label,
          fontSize: 14.setFontSize,
          textColor: CustomAppColor.of(context).txtGrey,
        ),
      ],
    );
  }

  Widget buildMiniGaugesRow(BuildContext context) {
    final List<String> days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    final List<double> progress = [10, 40, 70, 50, 90, 30, 0];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(days.length, (index) {
        return Column(
          children: [
            SizedBox(
              width: 28.setWidth,
              height: 28.setHeight,
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    showLabels: false,
                    startAngle: 270,
                    endAngle: 270 + 360,
                    showTicks: false,
                    axisLineStyle: AxisLineStyle(
                      thickness: 0.25,
                      thicknessUnit: GaugeSizeUnit.factor,
                      color: CustomAppColor.of(
                        context,
                      ).lime.withValues(alpha: 0.2),
                    ),
                    pointers: <GaugePointer>[
                      RangePointer(
                        value: progress[index],
                        width: 0.25,
                        sizeUnit: GaugeSizeUnit.factor,
                        cornerStyle: CornerStyle.bothCurve,
                        color: CustomAppColor.of(context).lime,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 4.setHeight),
            CommonText(
              text: days[index],
              fontSize: 12,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).txtBlack,
            ),
          ],
        );
      }),
    );
  }

  void showEditTargetStepsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,

      builder: (context) {
        return SafeArea(
          bottom: true,
          child: StatefulBuilder(
            builder: (context, setState) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),

                child: Container(
                  padding: EdgeInsets.all(24.setWidth),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).bgScaffold,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonText(
                                text: Languages.of(context).txtEditTargetSteps,
                                fontSize: 24.setFontSize,
                                fontWeight: FontWeight.w500,
                              ),
                              IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                          CommonText(
                            text: Languages.of(context).txtEditTargetStepsDesc,
                            fontSize: 15.setFontSize,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.start,
                            textColor: CustomAppColor.of(context).txtGrey,
                          ),
                        ],
                      ),
                      SizedBox(height: 50.setHeight),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonText(
                            text: Languages.of(context).txtSteps.toUpperCase(),
                            fontSize: 20.setFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(width: 90.setWidth),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.setWidth,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: CustomAppColor.of(
                                  context,
                                ).containerBgPurple,
                              ),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 25.setFontSize,
                                  fontWeight: FontWeight.w600,
                                ),
                                controller: TextEditingController(text: "6000"),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50.setHeight),
                      Row(
                        children: [
                          Expanded(
                            child: CommonButton(
                              text: Languages.of(context).txtCancel,
                              buttonColor: CustomAppColor.of(
                                context,
                              ).containerBgPurple,
                              buttonTextColor: CustomAppColor.of(
                                context,
                              ).txtPurpleWhite,
                              onTap: () => Navigator.pop(context),
                            ),
                          ),
                          SizedBox(width: 15.setWidth),
                          Expanded(
                            child: CommonButton(
                              text: Languages.of(context).txtSet,
                              buttonColor: CustomAppColor.of(context).primary,
                              buttonTextColor: Colors.white,
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strEditTarget) {
      showEditTargetStepsBottomSheet(context);
    }
  }
}
