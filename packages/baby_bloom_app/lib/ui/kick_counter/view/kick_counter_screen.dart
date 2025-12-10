import 'dart:async';

import 'package:baby_bloom_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_app/localization/language/languages.dart';
import 'package:baby_bloom_app/ui/3d_model/view/3d_model_screen.dart';
import 'package:baby_bloom_app/ui/history/view/history_screen.dart';
import 'package:baby_bloom_app/ui/kick_counter/datamodel/kick_counter_data.dart';
import 'package:baby_bloom_app/utils/app_assets.dart';
import 'package:baby_bloom_app/utils/app_color.dart';
import 'package:baby_bloom_app/utils/constant.dart';
import 'package:baby_bloom_app/utils/sizer_utils.dart';
import 'package:baby_bloom_app/widgets/text/common_text.dart';
import 'package:baby_bloom_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../widgets/button/common_button.dart';

class KickCounterScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const KickCounterScreen());
  }

  const KickCounterScreen({super.key});

  @override
  State<KickCounterScreen> createState() => _KickCounterScreenState();
}

class _KickCounterScreenState extends State<KickCounterScreen> implements TopBarClickListener {
  List<KickCounterData> kickCountList = [];
  int currentKickCount = 0;
  DateTime? startTime;
  Duration sessionDuration = const Duration(hours: 2);
  Duration remainingTime = const Duration(hours: 2);
  Timer? timer;

  _fillData() {
    kickCountList = [
      KickCounterData(
        date: DateTime.now(),
        time: DateTime.timestamp(),
        duration: "00:00:08",
        kicks: 08,
      ),
      KickCounterData(
        date: DateTime.now().subtract(const Duration(days: 1)),
        time: DateTime.timestamp(),
        duration: "00:00:08",
        kicks: 08,
      ),
      KickCounterData(
        date: DateTime.now().subtract(const Duration(days: 2)),
        time: DateTime.timestamp(),
        duration: "00:00:08",
        kicks: 08,
      ),
      KickCounterData(
        date: DateTime.now().subtract(const Duration(days: 3)),
        time: DateTime.timestamp(),
        duration: "00:00:08",
        kicks: 08,
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    _fillData();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  double _chartProgress() {
    if (sessionDuration.inSeconds == 0) return 0;
    final elapsedSeconds = startTime != null ? DateTime.now().difference(startTime!).inSeconds : 0;
    final progress = (elapsedSeconds / sessionDuration.inSeconds) * 2400;
    return progress.clamp(0, 100);
  }

  void _startTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        final elapsed = DateTime.now().difference(startTime!);
        remainingTime = sessionDuration - elapsed;
        if (remainingTime.isNegative) {
          remainingTime = Duration.zero;
          t.cancel();
        }
      });
    });
  }

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    return "${twoDigits(d.inHours)}:${twoDigits(d.inMinutes.remainder(60))}:${twoDigits(d.inSeconds.remainder(60))}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Stack(
        children: [
          Image.asset(AppAssets.imgProfileSetupBackground),
          Column(
            children: [
              TopBar(
                appBarColor: CustomAppColor.of(context).transparent,
                this,
                title: Languages.of(context).txtKickCounter,
                isShowBack: true,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SfCircularChart(
                        palette: [CustomAppColor.of(context).secondary],
                        series: <RadialBarSeries<ChartData, String>>[
                          RadialBarSeries<ChartData, String>(
                            trackColor: CustomAppColor.of(context).white,
                            trackBorderColor: CustomAppColor.of(context).secondary,
                            strokeColor: CustomAppColor.of(context).secondary,
                            dataSource: [ChartData('Progress', _chartProgress())],
                            xValueMapper: (ChartData data, _) => data.category,
                            yValueMapper: (ChartData data, _) => data.value,
                            cornerStyle: CornerStyle.bothCurve,
                            trackOpacity: 0.6,
                            radius: "142",
                            gap: "8",
                            innerRadius: "128",
                            maximumValue: 100,
                          ),
                        ],
                        annotations: <CircularChartAnnotation>[
                          CircularChartAnnotation(
                            widget: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (startTime == null) {
                                    startTime = DateTime.now();
                                    _startTimer();
                                  }
                                  currentKickCount++;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: CustomAppColor.of(context).secondary.withValues(alpha: 0.1),
                                  shape: BoxShape.circle,
                                  border: Border.all(color: CustomAppColor.of(context).white, width: 0.2),
                                ),
                                padding: const EdgeInsets.all(40),
                                child: Image.asset(
                                  AppAssets.imgKickCount,
                                  width: 140.setWidth,
                                  height: 140.setHeight,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      CommonText(
                        text: "Today's Total",
                        fontFamily: Constant.fontFamilySemiBold600,
                        textColor: CustomAppColor.of(context).txtLightGrey,
                        fontSize: 16.setFontSize,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                CommonText(
                                  text: startTime != null ? TimeOfDay.fromDateTime(startTime!).format(context) : "--:--",
                                  fontFamily: Constant.fontFamilySemiBold600,
                                  fontSize: 20.setFontSize,
                                ),
                                SizedBox(height: 2.setHeight),
                                CommonText(
                                  text: "Start of counting",
                                  fontSize: 13.setFontSize,
                                  textColor: CustomAppColor.of(context).txtLightGrey,
                                ),
                              ],
                            ),
                            CommonText(
                              text: currentKickCount.toString().padLeft(2, '0'),
                              fontFamily: Constant.fontFamilySemiBold600,
                              textColor: CustomAppColor.of(context).secondary,
                              fontSize: 54.setFontSize,
                            ),
                            Column(
                              children: [
                                CommonText(
                                  text: _formatDuration(remainingTime),
                                  fontFamily: Constant.fontFamilySemiBold600,
                                  fontSize: 20.setFontSize,
                                ),
                                SizedBox(height: 2.setHeight),
                                CommonText(
                                  text: "Time Remaining",
                                  fontSize: 13.setFontSize,
                                  textColor: CustomAppColor.of(context).txtLightGrey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.setHeight),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CommonButton(
                                height: 44.setHeight,
                                text: Languages.of(context).txtSave,
                                onTap: () {
                                  if (currentKickCount > 0 && startTime != null) {
                                    final endTime = DateTime.now();
                                    final duration = endTime.difference(startTime!);
                                    final formattedDuration = "${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}";

                                    setState(() {
                                      kickCountList.insert(
                                        0,
                                        KickCounterData(
                                          date: DateTime.now(),
                                          time: startTime!,
                                          duration: formattedDuration,
                                          kicks: currentKickCount,
                                        ),
                                      );
                                      currentKickCount = 0;
                                      startTime = null;
                                    });
                                  }
                                },
                              ),
                            ),
                            SizedBox(width: 15.setWidth),
                            Expanded(
                              child: CommonButton(
                                text: Languages.of(context).txtReset,
                                buttonTextColor: CustomAppColor.of(context).txtLightGrey,
                                borderColor: CustomAppColor.of(context).btnGrey,
                                buttonColor: CustomAppColor.of(context).btnGrey,
                                onTap: () => Navigator.pop(context),
                                height: 44.setHeight,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.setHeight),
                      historyList(),
                      SizedBox(height: 45.setHeight),
                    ],
                  ),
                ),
              ),
            ],
          )
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

  Widget historyList() {
    return Padding(
      padding: EdgeInsets.only(right: 20.setWidth, left: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtHistory,
                fontSize: 18.setFontSize,
                fontFamily: Constant.fontFamilySemiBold600,
              ),
              GestureDetector(
                onTap: () => Navigator.push(context, HistoryScreen.route()),
                child: CommonText(
                  text: "View all",
                  textColor: CustomAppColor.of(context).secondary,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.setHeight),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 1,
                    child: CommonText(
                      text: "Date",
                      fontFamily: Constant.fontFamilySemiBold600,
                    ),
                  ),
                  SizedBox(width: 30.setWidth),
                  const Expanded(
                    flex: 2,
                    child: CommonText(
                      text: "Start",
                      fontFamily: Constant.fontFamilySemiBold600,
                    ),
                  ),
                  const Expanded(
                    flex: 4,
                    child: CommonText(
                      text: "Duration",
                      fontFamily: Constant.fontFamilySemiBold600,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: CommonText(
                      text: "Kicks",
                      fontFamily: Constant.fontFamilySemiBold600,
                      textColor: CustomAppColor.of(context).secondary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.setHeight),
              ...kickCountList.map((item) {
                String formattedDate = _formatDate(item.date);
                String formattedTime = _formatTime(item.time);

                return Padding(
                  padding: EdgeInsets.only(bottom: 10.setHeight),
                  child: Container(
                    padding: EdgeInsets.only(top: 8.setHeight, right: 8.setWidth, bottom: 8.setHeight, left: 2.setWidth),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      border: Border.all(color: CustomAppColor.of(context).border),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: CommonText(
                            text: formattedDate,
                            fontFamily: Constant.fontFamilyMedium500,
                            textColor: CustomAppColor.of(context).txtLightGrey,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: CommonText(
                            text: formattedTime,
                            fontFamily: Constant.fontFamilyMedium500,
                            textColor: CustomAppColor.of(context).txtLightGrey,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: CommonText(
                            text: item.duration,
                            fontFamily: Constant.fontFamilyMedium500,
                            textColor: CustomAppColor.of(context).txtLightGrey,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: CommonText(
                            text: item.kicks.toString().padLeft(2, '0'),
                            fontFamily: Constant.fontFamilySemiBold600,
                            textColor: CustomAppColor.of(context).secondary,
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    DateTime today = DateTime.now();
    if (date.year == today.year && date.month == today.month && date.day == today.day) {
      return "Today";
    } else {
      return "${date.day.toString().padLeft(2, '0')} "
          "${_monthName(date.month)}";
    }
  }

  String _monthName(int month) {
    const months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    return months[month - 1];
  }

  String _formatTime(DateTime date) {
    return TimeOfDay.fromDateTime(date).format(context);
  }
}
