import 'dart:async';

import 'package:baby_bloom_app/utils/app_assets.dart';
import 'package:baby_bloom_app/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../utils/app_color.dart';

class SwipeToNavigateButton extends StatefulWidget {
  final Widget destinationPage;

  const SwipeToNavigateButton({super.key, required this.destinationPage});

  @override
  SwipeToNavigateButtonState createState() => SwipeToNavigateButtonState();
}

class SwipeToNavigateButtonState extends State<SwipeToNavigateButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  double dragPosition = 0.0;
  double maxDrag = 0.0;
  bool isDragging = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: -1.0, end: 0.01).chain(CurveTween(curve: Curves.easeInOut)).animate(_controller);
  }

  void _onSwipeComplete() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget.destinationPage),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final containerWidth = 150.setWidth;
    final lineWidth = 126.setWidth;
    final iconWidth = 30.setWidth;

    maxDrag = lineWidth - iconWidth;

    return GestureDetector(
      onHorizontalDragStart: (_) {
        isDragging = true;
        _controller.stop();
      },
      onHorizontalDragUpdate: (details) {
        setState(() {
          dragPosition += details.primaryDelta!;
          dragPosition = dragPosition.clamp(0.0, maxDrag);
        });
      },
      onHorizontalDragEnd: (_) {
        if (dragPosition > maxDrag * 0.8) {
          _onSwipeComplete();
          dragPosition = 0.0;
        } else {
          setState(() => dragPosition = 0.0);
        }

        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) {
            isDragging = false;
            _controller.repeat(reverse: true);
          }
        });
      },
      child: Container(
        width: containerWidth,
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).secondary.withValues(alpha: 0.1),
          borderRadius: const BorderRadius.all(Radius.circular(97)),
          border: Border.all(color: CustomAppColor.of(context).secondary),
        ),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            double offsetX = isDragging ? dragPosition : ((maxDrag / 3) * _animation.value) + (maxDrag / 3);

            return Stack(
              alignment: Alignment.centerLeft,
              clipBehavior: Clip.none,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: lineWidth,
                    height: 2.setHeight,
                    child: CustomPaint(
                      painter: _LineProgressPainter(
                        progress: offsetX / maxDrag,
                        secondaryColor: CustomAppColor.of(context).secondary,
                        remainingColor: CustomAppColor.of(context).white,
                      ),
                    ),
                  ),
                ),

                // --- Heart image ---
                Transform.translate(
                  offset: Offset(offsetX, 0),
                  child: Image.asset(
                    AppAssets.icHeartDrag,
                    width: iconWidth,
                    height: 32.setHeight,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// Paints the line behind the heart:
/// left portion = secondary color, right portion = white.
class _LineProgressPainter extends CustomPainter {
  final double progress; // 0.0 - 1.0
  final Color secondaryColor;
  final Color remainingColor;

  _LineProgressPainter({
    required this.progress,
    required this.secondaryColor,
    required this.remainingColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = size.height
      ..strokeCap = StrokeCap.round;

    final secondaryWidth = size.width * progress;

    // Draw secondary part (left)
    paint.color = secondaryColor;
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(secondaryWidth, size.height / 2),
      paint,
    );

    // Draw remaining white part (right)
    paint.color = remainingColor;
    canvas.drawLine(
      Offset(secondaryWidth, size.height / 2),
      Offset(size.width, size.height / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _LineProgressPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.secondaryColor != secondaryColor || oldDelegate.remainingColor != remainingColor;
  }
}
