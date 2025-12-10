import 'package:baby_bloom_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_screens_app/localization/language/languages.dart';
import 'package:baby_bloom_screens_app/ui/3d_model/view/3d_model_screen.dart';
import 'package:baby_bloom_screens_app/utils/app_assets.dart';
import 'package:baby_bloom_screens_app/utils/app_color.dart';
import 'package:baby_bloom_screens_app/utils/constant.dart';
import 'package:baby_bloom_screens_app/utils/sizer_utils.dart';
import 'package:baby_bloom_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../widgets/text/common_text.dart';

class SizeScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SizeScreen());
  }

  const SizeScreen({super.key});

  @override
  State<SizeScreen> createState() => _SizeScreenState();
}

class _SizeScreenState extends State<SizeScreen> implements TopBarClickListener {
  int currentIndex = 0;

  final List<Map<String, String>> weekData = [
    {
      "week": "1 Weeks Pregnant",
      "fruit": "Raspberry",
      "image": AppAssets.imgRaspberry,
      "weight": "0.20 kg",
      "length": "0.20 in",
    },
    {
      "week": "2 Weeks Pregnant",
      "fruit": "Grape",
      "image": AppAssets.imgGrapes,
      "weight": "0.30 kg",
      "length": "0.30 in",
    },
    {
      "week": "3 Weeks Pregnant",
      "fruit": "Blueberry",
      "image": AppAssets.imgBlueBerries,
      "weight": "0.50 kg",
      "length": "0.50 in",
    },
    {
      "week": "4 Weeks Pregnant",
      "fruit": "Raspberry",
      "image": AppAssets.imgRaspberry,
      "weight": "0.60 kg",
      "length": "0.60 in",
    },
    {
      "week": "5 Weeks Pregnant",
      "fruit": "Grape",
      "image": AppAssets.imgGrapes,
      "weight": "0.65 kg",
      "length": "0.65 in",
    },
    {
      "week": "6 Weeks Pregnant",
      "fruit": "Blueberry",
      "image": AppAssets.imgBlueBerries,
      "weight": "0.73 kg",
      "length": "0.73 in",
    },
    {
      "week": "7 Weeks Pregnant",
      "fruit": "Grape",
      "image": AppAssets.imgGrapes,
      "weight": "1.05 kg",
      "length": "1.05 in",
    },
    {
      "week": "8 Weeks Pregnant",
      "fruit": "Blueberry",
      "image": AppAssets.imgBlueBerries,
      "weight": "1.25 kg",
      "length": "1.25 in",
    },
    {
      "week": "9 Weeks Pregnant",
      "fruit": "Blueberry",
      "image": AppAssets.imgBlueBerries,
      "weight": "2.00 kg",
      "length": "2.00 in",
    },
  ];

  void _next() {
    setState(() {
      if (currentIndex < weekData.length - 1) currentIndex++;
    });
  }

  void _prev() {
    setState(() {
      if (currentIndex > 0) currentIndex--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final current = weekData[currentIndex];
    final isFirst = currentIndex == 0;
    final isLast = currentIndex == weekData.length - 1;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.imgHomeBackground,
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            children: [
              TopBar(
                this,
                appBarColor: CustomAppColor.of(context).transparent,
                isShowBack: true,
                title: Languages.of(context).txtSize,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SfCircularChart(
                        palette: [CustomAppColor.of(context).secondary],
                        series: <RadialBarSeries<ChartData, String>>[
                          RadialBarSeries<ChartData, String>(
                            trackColor: CustomAppColor.of(context).white,
                            trackBorderColor: CustomAppColor.of(context).secondary,
                            strokeColor: CustomAppColor.of(context).secondary,
                            dataSource: [ChartData('Progress', currentIndex * 2)],
                            xValueMapper: (ChartData data, _) => data.category,
                            yValueMapper: (ChartData data, _) => data.value,
                            cornerStyle: CornerStyle.bothCurve,
                            trackOpacity: 0.6,
                            radius: "120",
                            gap: "0",
                            innerRadius: "110",
                            maximumValue: 16,
                          ),
                        ],
                        annotations: <CircularChartAnnotation>[
                          CircularChartAnnotation(
                            widget: Container(
                              decoration: BoxDecoration(
                                color: CustomAppColor.of(context).white.withValues(alpha: 0.05),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: CustomAppColor.of(context).white,
                                ),
                              ),
                              child: Image.asset(
                                AppAssets.imgModelBaby,
                                width: 180.setWidth,
                                height: 180.setHeight,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CustomAppColor.of(context).btnGrey,
                                  ),
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(8),
                                  child: GestureDetector(
                                    onTap: isFirst ? null : _prev,
                                    child: Icon(
                                      Icons.arrow_back_ios_rounded,
                                      size: 16.setHeight,
                                    ),
                                  ),
                                ),
                                CommonText(
                                  text: current["week"]!,
                                  fontSize: 18.setFontSize,
                                  fontFamily: Constant.fontFamilySemiBold600,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CustomAppColor.of(context).btnGrey,
                                  ),
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(8),
                                  child: GestureDetector(
                                    onTap: isLast ? null : _next,
                                    child: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 16.setHeight,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16.setHeight),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 400),
                                transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child),
                                child: Column(
                                  key: ValueKey<String>(current["fruit"]!),
                                  children: [
                                    SizedBox(height: 30.setHeight),
                                    Image.asset(
                                      current["image"]!,
                                      height: 120.setHeight,
                                      width: 140.setWidth,
                                      fit: BoxFit.fill,
                                    ),
                                    Stack(
                                      alignment: Alignment.center,
                                      clipBehavior: Clip.none,
                                      children: [
                                        Image.asset(
                                          AppAssets.imgRotator,
                                          width: 375.setWidth,
                                          fit: BoxFit.fill,
                                          height: 80.setHeight,
                                        ),
                                        Positioned(
                                          bottom: -10.setHeight,
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              color: CustomAppColor.of(context).bgScreen,
                                              padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth),
                                              child: CommonText(
                                                text: current["fruit"]!,
                                                fontSize: 16.setFontSize,
                                                fontFamily: Constant.fontFamilySemiBold600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.setHeight),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFFD5A5F4),
                                          Color(0xFFF8EEFF),
                                        ],
                                        tileMode: TileMode.clamp,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 12.setHeight),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFF8EEFF)),
                                              padding: EdgeInsets.symmetric(vertical: 11.setHeight, horizontal: 11.setHeight),
                                              child: Image.asset(
                                                AppAssets.icWeight,
                                                height: 22.setHeight,
                                                width: 22.setWidth,
                                                color: const Color(0xFFA95DDA),
                                              ),
                                            ),
                                            SizedBox(width: 10.setWidth),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                CommonText(
                                                  text: Languages.of(context).txtWeight,
                                                  textColor: CustomAppColor.of(context).black,
                                                ),
                                                CommonText(
                                                  text: current["weight"]!,
                                                  fontFamily: Constant.fontFamilySemiBold600,
                                                  fontSize: 18.setFontSize,
                                                  textColor: CustomAppColor.of(context).black,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.setWidth),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      gradient: const LinearGradient(
                                        colors: [Color(0xFFB2F67F), Color(0xFFE3FFCE)],
                                        tileMode: TileMode.clamp,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 12.setHeight),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFE3FFCE)),
                                              padding: EdgeInsets.symmetric(vertical: 11.setHeight, horizontal: 11.setHeight),
                                              child: Image.asset(
                                                AppAssets.icLength,
                                                height: 22.setHeight,
                                                width: 22.setWidth,
                                              ),
                                            ),
                                            SizedBox(width: 8.setWidth),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                CommonText(
                                                  text: Languages.of(context).txtLength,
                                                  textColor: CustomAppColor.of(context).black,
                                                ),
                                                CommonText(
                                                  text: current["length"]!,
                                                  fontFamily: Constant.fontFamilySemiBold600,
                                                  fontSize: 18.setFontSize,
                                                  textColor: CustomAppColor.of(context).black,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 55.setHeight),
                    ],
                  ),
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
