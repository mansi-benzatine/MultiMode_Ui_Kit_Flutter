import 'dart:async';

import 'package:flowly_app/ui/dashboard/view/dashboard_screen.dart';
import 'package:flowly_app/utils/constant.dart';
import 'package:flowly_app/utils/sizer_utils.dart';
import 'package:flowly_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../../utils/app_color.dart' show CustomAppColor;

class DownloadAlertDialog extends StatefulWidget {
  final BuildContext parentContext;

  const DownloadAlertDialog({super.key, required this.parentContext});

  @override
  State<DownloadAlertDialog> createState() => _DownloadAlertDialogState();
}

class _DownloadAlertDialogState extends State<DownloadAlertDialog> with SingleTickerProviderStateMixin {
  double progressValue = 0.0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startProgressAnimation();
  }

  void startProgressAnimation() {
    timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (progressValue >= 1.0) {
        timer.cancel();

        Navigator.pop(context);

        Future.microtask(() {
          Navigator.push(widget.parentContext, DashboardScreen.route());
        });

        return;
      }

      if (!mounted) return;
      setState(() {
        progressValue += 0.01;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 30.setWidth),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      backgroundColor: CustomAppColor.of(context).transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          gradient: LinearGradient(
            colors: [
              CustomAppColor.of(context).bgShadowDark,
              CustomAppColor.of(context).bgTextFormFieldShadow,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.symmetric(vertical: 20.setWidth, horizontal: 16.setWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 180.setHeight,
                    width: 180.setWidth,
                    child: CustomPaint(
                      painter: GradientProgressPainter(progressValue),
                      child: Center(
                        child: CommonText(
                          text: "${(progressValue * 100).toInt()}%",
                          fontFamily: Constant.fontFamilyMulishExtraBold800,
                          fontSize: 22.setFontSize,
                          textColor: CustomAppColor.of(context).white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.setHeight),
            CommonText(
              text: "Preparing your calendar...",
              fontFamily: Constant.fontFamilyMulishBold700,
              fontSize: 16.setFontSize,
              textColor: CustomAppColor.of(context).white,
            ),
            SizedBox(height: 40.setHeight),
          ],
        ),
      ),
    );
  }
}

class GradientProgressPainter extends CustomPainter {
  final double progress;

  GradientProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 16.0;
    final center = size.center(Offset.zero);
    final radius = (size.width - strokeWidth) / 2;

    final bgPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, bgPaint);

    final rect = Rect.fromCircle(center: center, radius: radius);
    const gradient = LinearGradient(
      stops: [0.1, 0.4, 0.9],
      colors: [
        Color(0xFFFEEDE1),
        Color(0xFFFFCCD5),
        Color(0xFFFEEDE1),
      ],
    );

    final progressPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    double sweepAngle = progress * 3.14 * 2;

    canvas.drawArc(
      rect,
      -3.14 / 2,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
