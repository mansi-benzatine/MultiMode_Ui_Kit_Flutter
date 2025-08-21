import 'package:flutter/material.dart';
import 'package:mantra_yoga_screens_app_package/ui/app/my_app.dart';

import '../../utils/app_color.dart';

class BottomBarWithCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Calculate scaling factors based on original SVG dimensions (428x100)
    final double scaleX = size.width / 428.0;
    final double scaleY = size.height / 100.0;

    // Create the main path from the SVG
    Path path = Path();

    // Move to starting point and create the complex curved shape
    // This recreates the path from the SVG: M417.199 35.4147C423.331 36.0308...
    path.moveTo(417.199 * scaleX, 35.4147 * scaleY);

    // Curve to top right
    path.cubicTo(
      423.331 * scaleX,
      36.0308 * scaleY,
      428 * scaleX,
      41.1923 * scaleY,
      428 * scaleX,
      47.3552 * scaleY,
    );

    // Line to bottom right corner
    path.lineTo(428 * scaleX, 86.9997 * scaleY);

    // Curve for bottom right corner (rounded corner)
    path.cubicTo(
      428 * scaleX,
      94.7317 * scaleY,
      421.732 * scaleX,
      101 * scaleY,
      414 * scaleX,
      101 * scaleY,
    );

    // Line to bottom left
    path.lineTo(14 * scaleX, 101 * scaleY);

    // Curve for bottom left corner (rounded corner)
    path.cubicTo(
      6.268 * scaleX,
      101 * scaleY,
      0 * scaleX,
      94.7317 * scaleY,
      0 * scaleX,
      86.9997 * scaleY,
    );

    // Line to top left
    path.lineTo(0 * scaleX, 47.3552 * scaleY);

    // Curve from top left
    path.cubicTo(
      0 * scaleX,
      41.1923 * scaleY,
      4.66876 * scaleX,
      36.0308 * scaleY,
      10.8008 * scaleX,
      35.4147 * scaleY,
    );

    // Curve to the left dip
    path.lineTo(164.142 * scaleX, 20.0093 * scaleY);

    // Complex curve for the left side of the center circle cutout
    path.cubicTo(
      171.926 * scaleX,
      19.2273 * scaleY,
      178 * scaleX,
      28.1777 * scaleY,
      178 * scaleX,
      36.0007 * scaleY,
    );

    // Curve around the circle (left side)
    path.cubicTo(
      178 * scaleX,
      55.8828 * scaleY,
      194.118 * scaleX,
      72.0007 * scaleY,
      214 * scaleX,
      72.0007 * scaleY,
    );

    // Curve around the circle (right side)
    path.cubicTo(
      233.882 * scaleX,
      72.0007 * scaleY,
      250 * scaleX,
      55.8828 * scaleY,
      250 * scaleX,
      36.0007 * scaleY,
    );

    // Complex curve for the right side of the center circle cutout
    path.cubicTo(
      250 * scaleX,
      28.1776 * scaleY,
      256.074 * scaleX,
      19.2273 * scaleY,
      263.857 * scaleX,
      20.0093 * scaleY,
    );

    // Final curve back to start
    path.lineTo(417.199 * scaleX, 35.4147 * scaleY);

    path.close();

    // Create the white fill paint
    Paint fillPaint = Paint()
      ..color = CustomAppColor.of(MantraYogaScreensApp.navigatorKey.currentContext!).bottomBarBgColor
      ..style = PaintingStyle.fill;

    // Draw the filled path
    canvas.drawPath(path, fillPaint);

    // Create the gradient stroke paint
    Paint strokePaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          CustomAppColor.of(MantraYogaScreensApp.navigatorKey.currentContext!).bottomBarBgColor,
          CustomAppColor.of(MantraYogaScreensApp.navigatorKey.currentContext!).primary,
          CustomAppColor.of(MantraYogaScreensApp.navigatorKey.currentContext!).bottomBarBgColor,
        ],
        stops: const [0.0, 0.503332, 1.0], // From the SVG gradient stops
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    // Draw the stroke path
    canvas.drawPath(path, strokePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class SvgCustomWidget extends StatelessWidget {
  final double width;
  final double height;

  const SvgCustomWidget({
    super.key,
    this.width = 428,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: BottomBarWithCustomPainter(),
    );
  }
}
