import 'package:flutter/material.dart';
import 'package:run_tracker_screens_app/utils/app_assets.dart';
import 'package:run_tracker_screens_app/utils/app_color.dart';
import 'package:run_tracker_screens_app/utils/sizer_utils.dart';
import 'package:run_tracker_screens_app/widgets/text/common_text.dart';

class ResultShareScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => ResultShareScreen());
  }

  const ResultShareScreen({super.key});

  @override
  State<ResultShareScreen> createState() => _ResultShareScreenState();
}

class _ResultShareScreenState extends State<ResultShareScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(AppAssets.imgMap, fit: BoxFit.fill),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: CustomAppColor.of(
                        context,
                      ).black.withValues(alpha: 0.1),
                      spreadRadius: 4,
                      blurRadius: 15,
                    ),
                  ],
                  color: CustomAppColor.of(context).bgScaffold,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(22),
                    bottomRight: Radius.circular(22),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 50.setHeight,
                    left: 22.setWidth,
                    right: 22.setWidth,
                    bottom: 20.setHeight,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Image.asset(
                          AppAssets.imgGrid,
                          width: 300.setWidth,
                          height: 220.setHeight,
                          // optional transparency
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IgnorePointer(
                                ignoring: true,
                                child: GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: Icon(Icons.arrow_back),
                                ),
                              ),
                              Icon(Icons.share),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  _buildMetric(
                                    '150.00',
                                    'km',
                                    'DISTANCE',
                                    AppAssets.icDistance,
                                    CustomAppColor.of(context).primary,
                                  ),
                                  SizedBox(height: 15.setHeight),
                                  _buildMetric(
                                    '855.00',
                                    'kcal',
                                    'CALORIES',
                                    AppAssets.icTime,
                                    CustomAppColor.of(context).lime,
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  _buildMetric(
                                    '120.00',
                                    'min/km',
                                    'SPEED',
                                    AppAssets.icAverageSpeed,
                                    Colors.red,
                                  ),
                                  SizedBox(height: 15.setHeight),
                                  _buildMetric(
                                    '58:76:03',
                                    '',
                                    'TIME',
                                    AppAssets.icCalories,
                                    Color(0xFFE3A337),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          SizedBox(height: 10.setHeight),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppAssets.icRunShoes,
                                width: 25.setWidth,
                                height: 22.setHeight,
                                color: CustomAppColor.of(context).primary,
                              ),
                              SizedBox(width: 8.setWidth),
                              CommonText(
                                text: "09 JUNE 2022, 07:00 AM",
                                fontWeight: FontWeight.w400,
                              ),
                            ],
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
    );
  }

  Widget _buildMetric(
    String value,
    String unit,
    String label,
    String icon,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            color: color,
            height: 36.setHeight,
            width: 36.setWidth,
          ),
          SizedBox(height: 8.setHeight),
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: CustomAppColor.of(context).txtBlack,
                fontSize: 20.setFontSize,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(text: value),
                TextSpan(
                  text: unit,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.setFontSize,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.setHeight),
          CommonText(text: label, fontSize: 12.setFontSize, textColor: color),
        ],
      ),
    );
  }
}
