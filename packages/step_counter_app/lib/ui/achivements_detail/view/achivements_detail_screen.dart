import 'package:flutter/material.dart';
import 'package:step_counter_app_package/ui/achivements/view/achivements_screen.dart';
import 'package:step_counter_app_package/utils/app_color.dart';
import 'package:step_counter_app_package/utils/constant.dart';
import 'package:step_counter_app_package/utils/sizer_utils.dart';
import 'package:step_counter_app_package/utils/utils.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../utils/app_assets.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../pages/achivement_sucess_screen.dart';

class AchievementsDetailScreen extends StatefulWidget {
  final String title;
  final Color color;
  final String icon;
  final List<AchievementData> data;

  const AchievementsDetailScreen({super.key, required this.title, required this.color, required this.data, required this.icon});

  static Route<AchievementsDetailScreen> route({required String title, required Color color, required List<AchievementData> data, required String icon}) {
    return MaterialPageRoute(
      builder: (context) => AchievementsDetailScreen(title: title, color: color, data: data, icon: icon),
    );
  }

  @override
  State<AchievementsDetailScreen> createState() => _AchievementsDetailScreenState();
}

class _AchievementsDetailScreenState extends State<AchievementsDetailScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).white,
      body: ColoredBox(
        color: widget.color.withOpacityPercent(0.1),
        child: Column(
          children: [
            TopBar(
              this,
              title: widget.title,
              textAlign: Alignment.centerLeft,
              isShowBack: true,
              textColor: CustomAppColor.of(context).black,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 170.setHeight,
                      width: 170.setWidth,
                      child: CustomPaint(
                        painter: DashedCirclePainter(
                          color: widget.color,
                          strokeWidth: 3,
                          dashWidth: 8,
                          dashSpace: 6,
                        ),
                        child: Container(
                          margin: EdgeInsets.all(3.setWidth),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomAppColor.of(context).bgGray.withOpacityPercent(0.2),
                            border: Border.all(color: CustomAppColor.of(context).white, width: 5.setWidth),
                            boxShadow: [
                              BoxShadow(color: CustomAppColor.of(context).txtGray.withOpacityPercent(0.5)),
                              BoxShadow(
                                color: CustomAppColor.of(context).white,
                                spreadRadius: -9.0,
                                blurRadius: 10.0,
                              ),
                            ],
                          ),
                          child: UnconstrainedBox(
                            child: _buildAchievementCircle(
                              width: 80.setWidth,
                              height: 106.setHeight,
                              fontSize: 28.setFontSize,
                              value: widget.data[0].value,
                              unit: widget.data[0].unit,
                              isCompleted: true,
                              color: widget.color,
                              icon: widget.data[0].icon,
                              onTap: () {},
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25.setHeight),

                    // Progress Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          (widget.icon == AppAssets.icAchievementDailyStep) ? AppAssets.icFootStep : widget.icon,
                          width: 20.setWidth,
                          height: 18.setHeight,
                          color: widget.color,
                        ),
                        SizedBox(width: 6.setWidth),
                        CommonText(
                          text:
                              "${widget.data[0].value} More ${(widget.data[0].unit == widget.data[0].value) ? "Steps" : widget.data[0].unit} To Win The Achievement ${widget.data[0].value} ${(widget.data[0].unit == widget.data[0].value) ? "" : widget.data[0].unit}",
                          fontSize: 13.setFontSize,
                          fontWeight: FontWeight.w600,
                          textColor: widget.color,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.setHeight),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                        color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
                        // border: Border.all(color: CustomAppColor.of(context).borderColor),
                        boxShadow: [
                          BoxShadow(
                            color: CustomAppColor.of(context).black.withOpacityPercent(0.1),
                            blurRadius: 5,
                            spreadRadius: 2,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.only(bottom: 40.setHeight, top: 15.setHeight),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 15.setWidth,
                          mainAxisSpacing: 20.setHeight,
                          childAspectRatio: 1,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
                        itemCount: widget.data.length,
                        itemBuilder: (context, index) {
                          final achievement = widget.data[index];
                          return Container(
                            height: 90.setHeight,
                            width: 90.setWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
                              border: (Utils.isLightTheme() &&
                                      !(achievement.icon == AppAssets.icDailyStepMedalInactive || achievement.icon == AppAssets.icTotalDaysMedalInactive || achievement.icon == AppAssets.icTotalDistanceMedalInactive))
                                  ? null
                                  : Border.all(
                                      color: CustomAppColor.of(context).borderColor.withOpacityPercent(0.06),
                                      width: 1,
                                    ),
                              boxShadow: (achievement.icon == AppAssets.icDailyStepMedalInactive || achievement.icon == AppAssets.icTotalDaysMedalInactive || achievement.icon == AppAssets.icTotalDistanceMedalInactive)
                                  ? []
                                  : [
                                      BoxShadow(
                                        color: CustomAppColor.of(context).txtBlack.withOpacityPercent(0.2),
                                        blurRadius: 5,
                                        offset: const Offset(0, 0),
                                      ),
                                    ],
                            ),
                            child: UnconstrainedBox(
                              child: _buildAchievementCircle(
                                width: 53.setWidth,
                                height: 70.setHeight,
                                fontSize: 16.setFontSize,
                                value: achievement.value,
                                unit: achievement.unit,
                                isCompleted: true,
                                color: widget.color,
                                icon: achievement.icon,
                                onTap: () {
                                  Navigator.push(context, AchivementSucessScreen.route(title: widget.title, color: widget.color, data: achievement, icon: widget.icon));
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // All Achievements Grid
            /*Container(
              padding: EdgeInsets.all(20.setWidth),
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: CustomAppColor.of(context).borderColor),
              ),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15.setWidth,
                  mainAxisSpacing: 20.setHeight,
                  childAspectRatio: 1,
                ),
                itemCount: _getAllAchievements().length,
                itemBuilder: (context, index) {
                  final achievement = _getAllAchievements()[index];
                  return _buildGridAchievementItem(achievement);
                },
              ),
            ),*/
          ],
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
          image: isCompleted
              ? DecorationImage(
                  image: AssetImage(icon),
                  fit: BoxFit.contain,
                )
              : null,
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

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}

class GridAchievementData {
  final String value;
  final bool isCompleted;

  GridAchievementData(this.value, this.isCompleted);
}

class DashedCirclePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  DashedCirclePainter({
    required this.color,
    required this.strokeWidth,
    required this.dashWidth,
    required this.dashSpace,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Calculate the circumference and number of dashes
    final circumference = 2 * 3.14159 * radius;
    final dashCount = (circumference / (dashWidth + dashSpace)).floor();
    final adjustedDashWidth = (circumference - (dashCount * dashSpace)) / dashCount;

    for (int i = 0; i < dashCount; i++) {
      final startAngle = (i * (adjustedDashWidth + dashSpace)) / radius;
      final endAngle = startAngle + (adjustedDashWidth / radius);

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        endAngle - startAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
