import 'package:flutter/material.dart';

class DottedDivider extends StatelessWidget {
  final double height;
  final Color? color;
  final double dotWidth;
  final double spacing;

  const DottedDivider({
    super.key,
    this.height = 1,
    this.color,
    this.dotWidth = 4,
    this.spacing = 4,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CustomPaint(
        painter: _DottedLinePainter(
          color: const Color(0xFFB8BBC6).withValues(alpha: 0.2),
          dotWidth: dotWidth,
          spacing: spacing,
        ),
        child: Container(),
      ),
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  final Color color;
  final double dotWidth;
  final double spacing;

  _DottedLinePainter({
    required this.color,
    required this.dotWidth,
    required this.spacing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = size.height;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dotWidth, 0), paint);
      startX += dotWidth + spacing;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
