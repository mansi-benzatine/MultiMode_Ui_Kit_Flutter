import 'package:baby_bloom_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_screens_app/utils/app_assets.dart';
import 'package:baby_bloom_screens_app/utils/app_color.dart';
import 'package:baby_bloom_screens_app/utils/constant.dart';
import 'package:baby_bloom_screens_app/utils/sizer_utils.dart';
import 'package:baby_bloom_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../localization/language/languages.dart';
import '../../../widgets/text/common_text.dart';

class ChartData {
  final String category;
  final double value;

  ChartData(this.category, this.value);
}

class ThreeDModelScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ThreeDModelScreen());
  }

  const ThreeDModelScreen({super.key});

  @override
  State<ThreeDModelScreen> createState() => _ThreeDModelScreenState();
}

class _ThreeDModelScreenState extends State<ThreeDModelScreen> implements TopBarClickListener {
  final List<Tab> tabs = [
    const Tab(text: '1 Week'),
    const Tab(text: '2 Week'),
    const Tab(text: '3 Week'),
    const Tab(text: '4 Week'),
    const Tab(text: '5 Week'),
    const Tab(text: '6 Week'),
    const Tab(text: '7 Week'),
    const Tab(text: '8 Week'),
    const Tab(text: '9 Week'),
    const Tab(text: '10 Week'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              AppAssets.imgProfileSetupBackground,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                TopBar(
                  this,
                  title: "3D Model",
                  isShowBack: true,
                  appBarColor: CustomAppColor.of(context).transparent,
                ),
                TabBar(
                  tabs: tabs,
                  labelColor: CustomAppColor.of(context).secondary,
                  unselectedLabelColor: CustomAppColor.of(context).txtLightGrey,
                  indicatorColor: CustomAppColor.of(context).secondary,
                  indicatorWeight: 4.0,
                  labelStyle: TextStyle(
                    color: CustomAppColor.of(context).txtBlack,
                    package: "baby_bloom_screens_app",
                  ),
                  padding: EdgeInsets.zero,
                  physics: const AlwaysScrollableScrollPhysics(),
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      _buildTabContent(week: 1, value: 10),
                      _buildTabContent(week: 2, value: 20),
                      _buildTabContent(week: 3, value: 30),
                      _buildTabContent(week: 4, value: 40),
                      _buildTabContent(week: 5, value: 50),
                      _buildTabContent(week: 6, value: 60),
                      _buildTabContent(week: 7, value: 70),
                      _buildTabContent(week: 8, value: 80),
                      _buildTabContent(week: 9, value: 90),
                      _buildTabContent(week: 10, value: 100),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent({required int week, required double value}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 100.setHeight),
        SizedBox(
          child: SfCircularChart(
            palette: [CustomAppColor.of(context).secondary],
            series: <RadialBarSeries<ChartData, String>>[
              RadialBarSeries<ChartData, String>(
                trackColor: CustomAppColor.of(context).white,
                trackBorderColor: CustomAppColor.of(context).secondary,
                strokeColor: CustomAppColor.of(context).secondary,
                dataSource: [ChartData('Progress', value)],
                xValueMapper: (ChartData data, _) => data.category,
                yValueMapper: (ChartData data, _) => data.value,
                cornerStyle: CornerStyle.bothCurve,
                trackOpacity: 0.6,
                radius: "140",
                gap: "10",
                innerRadius: "120",
                maximumValue: 100,
              ),
            ],
            annotations: <CircularChartAnnotation>[
              CircularChartAnnotation(
                widget: Container(
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).secondary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                    border: Border.all(color: CustomAppColor.of(context).white, width: 0.2),
                  ),
                  child: Image.asset(
                    AppAssets.imgModelBaby,
                    width: 200.setWidth,
                    height: 200.setHeight,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.setHeight),
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
                  padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 8.setHeight),
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
                                text: "${(1.20 + (week - 6) * 0.05).toStringAsFixed(2)} kg",
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
                  padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 8.setHeight),
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
                                text: "${(1.22 + (week - 6) * 0.02).toStringAsFixed(2)} in",
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
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
