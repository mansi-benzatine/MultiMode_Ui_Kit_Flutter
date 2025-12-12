import 'package:flutter/material.dart';
import 'package:mivi_screens_app/utils/constant.dart';
import 'package:mivi_screens_app/utils/sizer_utils.dart';

class TimeLineRuler extends StatelessWidget {
  final double totalDuration;
  final double pixelsPerSecond;

  const TimeLineRuler({
    super.key,
    this.totalDuration = 20,
    this.pixelsPerSecond = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: totalDuration.toInt() + 1,
        itemBuilder: (context, index) {
          return CustomPaint(
            painter: RulerPainter(
              second: index,
              degree: "s",
              pixelsPerSecond: pixelsPerSecond,
            ),
            size: Size(pixelsPerSecond * 5, 50),
          );
        },
      ),
    );
  }
}

class RulerPainter extends CustomPainter {
  final int second;
  final double pixelsPerSecond;
  String degree = "";
  RulerPainter({required this.second, required this.pixelsPerSecond, this.degree = ""});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white24
      ..strokeWidth = 1;

    final textPainter = TextPainter(
      text: TextSpan(
        text: '${second * 5}$degree',
        style: TextStyle(
          color: Colors.white70,
          fontSize: 11.setFontSize,
          fontFamily: Constant.fontFamilyRegular400,
          package: "mivi_screens_app",
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    // Draw small ticks (5 ticks between each major mark)
    for (int i = 0; i < 5; i++) {
      final dx = i * pixelsPerSecond;
      final tickHeight = (i == 0) ? 5.0 : 2.0;
      canvas.drawLine(Offset(dx, 0), Offset(dx, tickHeight), paint);
    }

    // Draw major second label (0s, 5s, 10s...)
    textPainter.layout();
    textPainter.paint(canvas, const Offset(0, 15));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
