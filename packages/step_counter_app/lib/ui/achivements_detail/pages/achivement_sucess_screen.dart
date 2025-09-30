import 'package:flutter/material.dart';
import 'package:step_counter_app_package/ui/achivements/view/achivements_screen.dart';
import 'package:step_counter_app_package/utils/app_assets.dart';
import 'package:step_counter_app_package/utils/app_color.dart';
import 'package:step_counter_app_package/utils/sizer_utils.dart';
import 'package:step_counter_app_package/utils/utils.dart';

import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../view/achivements_detail_screen.dart';

class AchivementSucessScreen extends StatefulWidget {
  const AchivementSucessScreen({super.key, required this.title, required this.color, required this.data, required this.icon});
  final String title;
  final Color color;
  final String icon;
  final AchievementData data;

  static Route<AchivementSucessScreen> route({required String title, required Color color, required AchievementData data, required String icon}) {
    return MaterialPageRoute(
      builder: (context) => AchivementSucessScreen(title: title, color: color, data: data, icon: icon),
    );
  }

  @override
  State<AchivementSucessScreen> createState() => _AchivementSucessScreenState();
}

class _AchivementSucessScreenState extends State<AchivementSucessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.imgBgAchievementSuccess),
            fit: BoxFit.cover,
          ),
        ),
        height: 0.screenHeight,
        child: Container(
          color: widget.color.withOpacityPercent(0.5),
          height: 0.screenHeight,
          child: SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    padding: EdgeInsets.only(right: 20.setWidth),
                    icon: Icon(
                      Icons.close,
                      color: CustomAppColor.of(context).white,
                      size: 24.setWidth,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(height: 10.setHeight),
                _getAchivementTextWidget(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _getAchievementCircle(),
                      SizedBox(height: 30.setHeight),
                      CommonText(
                        text: "Great!".toUpperCase(),
                        fontSize: 24.setFontSize,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.center,
                        height: 1,
                        textColor: CustomAppColor.of(context).white,
                      ),
                      SizedBox(height: 10.setHeight),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "You have achieved ",
                              style: TextStyle(
                                color: CustomAppColor.of(context).white,
                                fontSize: 18.setFontSize,
                                fontWeight: FontWeight.w500,
                                package: 'step_counter_app_package',
                                fontFamily: Constant.fontFamily,
                              ),
                            ),
                            TextSpan(
                              text: widget.data.value,
                              style: TextStyle(
                                color: CustomAppColor.of(context).white,
                                fontSize: 22.setFontSize,
                                fontWeight: FontWeight.w600,
                                package: 'step_counter_app_package',
                                fontFamily: Constant.fontFamily,
                              ),
                            ),
                            TextSpan(
                              text: (widget.data.unit == widget.data.value) ? " steps!" : "${widget.data.unit}!",
                              style: TextStyle(
                                color: CustomAppColor.of(context).white,
                                fontSize: 18.setFontSize,
                                fontWeight: FontWeight.w500,
                                package: 'step_counter_app_package',
                                fontFamily: Constant.fontFamily,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.setHeight),
                CommonText(
                  text: "Share With Social Media".toUpperCase(),
                  fontSize: 16.setFontSize,
                  fontWeight: FontWeight.w500,
                  textColor: CustomAppColor.of(context).white,
                ),
                SizedBox(height: 10.setHeight),
                Container(
                  height: 80.setHeight,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20.setWidth),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: CustomAppColor.of(context).white.withOpacityPercent(0.2),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AppAssets.icFacebook, height: 50.setHeight, width: 50.setWidth),
                      Image.asset(AppAssets.icInstagram, height: 50.setHeight, width: 50.setWidth),
                      Image.asset(AppAssets.icWhatsapp, height: 50.setHeight, width: 50.setWidth),
                      Image.asset(AppAssets.icMoreCircle, height: 50.setHeight, width: 50.setWidth),
                    ],
                  ),
                ),
                SizedBox(height: 20.setHeight),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getAchivementTextWidget() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: widget.color,
        border: Border.all(color: CustomAppColor.of(context).white, width: 2),
      ),
      padding: EdgeInsets.symmetric(horizontal: 14.setWidth, vertical: 8.setHeight),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "G",
              style: TextStyle(
                color: CustomAppColor.of(context).white,
                fontSize: 22.setFontSize,
                fontWeight: FontWeight.w700,
                letterSpacing: 5,
                package: 'step_counter_app_package',
                fontFamily: Constant.fontFamily,
              ),
            ),
            TextSpan(
              text: "et ",
              style: TextStyle(
                color: CustomAppColor.of(context).white,
                fontSize: 22.setFontSize,
                fontWeight: FontWeight.w500,
                letterSpacing: 5,
                package: 'step_counter_app_package',
                fontFamily: Constant.fontFamily,
              ),
            ),
            TextSpan(
              text: "A",
              style: TextStyle(
                color: CustomAppColor.of(context).white,
                fontSize: 22.setFontSize,
                fontWeight: FontWeight.w700,
                letterSpacing: 5,
                package: 'step_counter_app_package',
                fontFamily: Constant.fontFamily,
              ),
            ),
            TextSpan(
              text: "chievements",
              style: TextStyle(
                color: CustomAppColor.of(context).white,
                fontSize: 22.setFontSize,
                fontWeight: FontWeight.w500,
                letterSpacing: 5,
                package: 'step_counter_app_package',
                fontFamily: Constant.fontFamily,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getAchievementCircle() {
    return SizedBox(
      height: 200.setHeight,
      width: 200.setWidth,
      child: CustomPaint(
        painter: DashedCirclePainter(
          color: CustomAppColor.of(context).white,
          strokeWidth: 3,
          dashWidth: 3,
          dashSpace: 4,
        ),
        child: Container(
          margin: EdgeInsets.all(10.setWidth),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: CustomAppColor.of(context).transparent, width: 5.setWidth),
            color: CustomAppColor.of(context).bgGray.withOpacityPercent(0.2),
            boxShadow: [
              BoxShadow(color: CustomAppColor.of(context).txtGray.withOpacityPercent(0.9)),
              BoxShadow(
                color: CustomAppColor.of(context).white,
                spreadRadius: -8.0,
                blurRadius: 12.0,
              ),
            ],
          ),
          child: UnconstrainedBox(
            child: _buildAchievementCircle(
              width: 80.setWidth,
              height: 102.setHeight,
              fontSize: 28.setFontSize,
              value: widget.data.value,
              unit: widget.data.unit,
              isCompleted: true,
              color: widget.color,
              icon: widget.data.icon,
              onTap: () {},
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAchievementCircle({
    required double width,
    required double height,
    required double fontSize,
    required String value,
    required String unit,
    required bool isCompleted,
    required Color color,
    required String icon,
    required Function onTap,
  }) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(icon),
            fit: BoxFit.contain,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.27),
            CommonText(
              text: value,
              fontSize: fontSize.setFontSize,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
              height: 1,
              textColor: CustomAppColor.of(context).txtWhite,
            ),
            if (unit != value) ...[
              // Don't show unit if it's the same as value (like "5K")
              SizedBox(height: 2.setHeight),
              CommonText(
                text: unit,
                fontSize: fontSize.setFontSize / 3,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
                height: 1,
                textColor: CustomAppColor.of(context).txtWhite,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
