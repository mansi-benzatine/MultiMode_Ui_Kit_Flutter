import 'dart:async';

import 'package:baby_bloom_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_app/localization/language/languages.dart';
import 'package:baby_bloom_app/ui/3d_model/view/3d_model_screen.dart';
import 'package:baby_bloom_app/ui/contractions/datamodel/contraction_data.dart';
import 'package:baby_bloom_app/utils/app_assets.dart';
import 'package:baby_bloom_app/utils/app_color.dart';
import 'package:baby_bloom_app/utils/constant.dart';
import 'package:baby_bloom_app/utils/sizer_utils.dart';
import 'package:baby_bloom_app/widgets/button/common_button.dart';
import 'package:baby_bloom_app/widgets/text/common_text.dart';
import 'package:baby_bloom_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ContractionScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ContractionScreen());
  }

  const ContractionScreen({super.key});

  @override
  State<ContractionScreen> createState() => _ContractionScreenState();
}

class _ContractionScreenState extends State<ContractionScreen> implements TopBarClickListener {
  Timer? _timer;
  Duration _elapsed = Duration.zero;
  bool _isRunning = false;
  List<Contraction> contractions = [];

  void _startTimer() {
    setState(() {
      _isRunning = true;
      _elapsed = Duration.zero;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => _elapsed += const Duration(seconds: 1));
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      final now = DateTime.now();

      String interval = "N/A";
      if (contractions.isNotEmpty) {
        final lastEnd = contractions.last.time;
        final diff = now.difference(lastEnd);
        interval = _formatInterval(diff);
      }

      contractions.insert(
        0,
        Contraction(
          time: now,
          duration: _elapsed,
          interval: interval,
        ),
      );
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _elapsed = Duration.zero;
      contractions.clear();
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(duration.inMinutes.remainder(60))}:${twoDigits(duration.inSeconds.remainder(60))}";
  }

  String _formatInterval(Duration diff) {
    if (diff.inSeconds < 60) {
      return "${diff.inSeconds} sec";
    } else {
      return "${diff.inMinutes} min ${diff.inSeconds.remainder(60)} sec";
    }
  }

  double get _progress {
    if (_elapsed.inSeconds == 0) return 0;
    return (_elapsed.inSeconds % 60) / 60;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.imgProfileSetupBackground,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              TopBar(
                this,
                appBarColor: CustomAppColor.of(context).transparent,
                isShowBack: true,
                title: Languages.of(context).txtContractions,
              ),
              Expanded(
                child: Column(
                  children: [
                    SfCircularChart(
                      palette: [CustomAppColor.of(context).secondary],
                      series: <RadialBarSeries<ChartData, String>>[
                        RadialBarSeries<ChartData, String>(
                          trackColor: CustomAppColor.of(context).white,
                          trackBorderColor: CustomAppColor.of(context).secondary,
                          strokeColor: CustomAppColor.of(context).secondary,
                          dataSource: [ChartData('Progress', _progress)],
                          xValueMapper: (ChartData data, _) => data.category,
                          yValueMapper: (ChartData data, _) => data.value,
                          cornerStyle: CornerStyle.bothCurve,
                          trackOpacity: 0.6,
                          radius: "142",
                          gap: "8",
                          innerRadius: "128",
                          maximumValue: 10,
                        ),
                      ],
                      annotations: <CircularChartAnnotation>[
                        CircularChartAnnotation(
                          widget: Container(
                            decoration: BoxDecoration(
                              color: CustomAppColor.of(context).white.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: CustomAppColor.of(context).white,
                              ),
                            ),
                            child: Image.asset(
                              AppAssets.icContraction,
                              width: 200.setWidth,
                              height: 200.setHeight,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    CommonText(
                      text: _formatDuration(_elapsed),
                      fontSize: 34.setFontSize,
                      fontFamily: Constant.fontFamilyMedium500,
                    ),
                    CommonText(
                      text: Languages.of(context).txtPressStartWhenAContractionBeginsStopWhenItEnds,
                      fontSize: 12.setFontSize,
                      fontFamily: Constant.fontFamilyMedium500,
                      textColor: CustomAppColor.of(context).txtLightGrey,
                    ),
                    SizedBox(height: 15.setHeight),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                      child: Row(
                        children: [
                          Expanded(
                            child: CommonButton(
                              text: _isRunning ? Languages.of(context).txtStop : Languages.of(context).txtStart,
                              onTap: _isRunning ? _stopTimer : _startTimer,
                              buttonColor: _isRunning ? const Color(0xffFF584E) : const Color(0xffFF6B81),
                            ),
                          ),
                          SizedBox(width: 15.setWidth),
                          Expanded(
                            child: CommonButton(
                              onTap: _resetTimer,
                              text: Languages.of(context).txtReset,
                              buttonTextColor: CustomAppColor.of(context).txtLightGrey,
                              borderColor: CustomAppColor.of(context).btnGrey,
                              buttonColor: CustomAppColor.of(context).btnGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.setHeight),
                    if (contractions.isNotEmpty)
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                              child: CommonText(
                                text: Languages.of(context).txtRecentContractions,
                                fontSize: 16.setFontSize,
                                fontFamily: Constant.fontFamilySemiBold600,
                              ),
                            ),
                            SizedBox(height: 15.setHeight),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 20.setWidth),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: CustomAppColor.of(context).border,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: ListView.separated(
                                  padding: const EdgeInsets.all(16),
                                  shrinkWrap: true,
                                  itemCount: contractions.length,
                                  separatorBuilder: (_, __) => Divider(
                                    height: 20.setHeight,
                                    color: CustomAppColor.of(context).border,
                                  ),
                                  itemBuilder: (context, index) {
                                    final c = contractions[index];
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CommonText(
                                              text: DateFormat('hh:mm a').format(c.time),
                                              fontSize: 14.setFontSize,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            SizedBox(height: 2.setHeight),
                                            CommonText(
                                              text: "Duration: ${_formatDuration(c.duration)}",
                                              textColor: CustomAppColor.of(context).txtLightGrey,
                                              fontSize: 12.setFontSize,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            CommonText(
                                              text: "Interval",
                                              textAlign: TextAlign.right,
                                              fontSize: 12.setFontSize,
                                              textColor: CustomAppColor.of(context).txtLightGrey,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            CommonText(
                                              text: c.interval,
                                              textAlign: TextAlign.right,
                                              fontSize: 13.setFontSize,
                                              textColor: CustomAppColor.of(context).secondary,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              )
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
}
