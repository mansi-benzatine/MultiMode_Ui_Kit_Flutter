import 'dart:math' as math;

import 'package:flowly_screens_app/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';

class TrianglePainter extends CustomPainter {
  final Color color;

  TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class HeightScalePainter extends CustomPainter {
  final double offset;
  final double tickSpacing;
  final int minHeight;
  final int maxHeight;
  final Color primaryColor;
  final Color blackColor;
  final Color greyColor;

  HeightScalePainter({
    required this.offset,
    required this.tickSpacing,
    required this.minHeight,
    required this.maxHeight,
    required this.primaryColor,
    required this.blackColor,
    required this.greyColor,
  });

  double getCurveX(double y, double xBase, double halfHeight, double amp) {
    y = y.clamp(-halfHeight, halfHeight);
    if (amp <= 0) return xBase;
    final double h = halfHeight;
    final double r = (h * h + amp * amp) / (2 * amp);
    final double xc = xBase - (r - amp);
    final double discriminant = r * r - y * y;
    final double sqrtDisc = discriminant > 0 ? math.sqrt(discriminant) : 0;
    return xc + sqrtDisc;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final double centerY = size.height / 2;
    final double halfHeight = size.height / 4;
    final double labelXBase = 60.setWidth;
    final double xLeftBase = labelXBase + 8.setWidth;
    final double xRightBase = size.width - xLeftBase;
    final double ampLeft = 30.setWidth;
    final double ampRight = -30.setWidth;
    final double ampLabel = 5.setWidth;

    for (int h = minHeight; h <= maxHeight; h++) {
      final double tickY = (h - minHeight) * tickSpacing - offset;
      if (tickY < -tickSpacing * 2 || tickY > size.height + tickSpacing * 2) continue;

      final bool isMajor = h % 10 == 0;
      final bool isMinor = (h % 5 == 0) && !isMajor;

      final Color tickColor = isMajor
          ? primaryColor
          : isMinor
              ? blackColor
              : greyColor;

      final double yRel = tickY - centerY;
      final double xLeft = getCurveX(yRel, xLeftBase, halfHeight, ampLeft);
      final double xRight = getCurveX(yRel, xRightBase, halfHeight, -ampRight);

      final Paint linePaint = Paint()
        ..color = tickColor
        ..strokeWidth = 2.setWidth;

      canvas.drawLine(
        Offset(xLeft, tickY),
        Offset(xRight, tickY),
        linePaint,
      );

      if (isMajor) {
        final double labelXCurved = getCurveX(yRel, labelXBase, halfHeight, ampLabel);
        final TextPainter textPainter = TextPainter(
          textDirection: TextDirection.ltr,
          text: TextSpan(
            text: h.toString(),
            style: TextStyle(
              color: blackColor,
              fontSize: 12.setFontSize,
              fontWeight: FontWeight.w600,
              height: 1.0,
            ),
          ),
        );
        textPainter.layout();
        final double textY = tickY - textPainter.height / 2;
        final double textX = labelXCurved - textPainter.width;
        textPainter.paint(canvas, Offset(textX, textY));
      }
    }
  }

  @override
  bool shouldRepaint(covariant HeightScalePainter oldDelegate) {
    return oldDelegate.offset != offset;
  }
}

class YourHeightPage extends StatefulWidget {
  const YourHeightPage({super.key});

  @override
  State<YourHeightPage> createState() => _YourHeightPageState();
}

class _YourHeightPageState extends State<YourHeightPage> {
  final GlobalKey _scaleKey = GlobalKey();
  ValueNotifier<int> selectedHeight = ValueNotifier(155);
  final int minHeight = 115;
  final int maxHeight = 300;
  final double tickSpacing = 12.setHeight;
  double currentOffset = 0.0;
  late double centerY;

  @override
  void initState() {
    super.initState();
    selectedHeight.addListener(_onHeightChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _onHeightChanged();
    });
  }

  @override
  void dispose() {
    selectedHeight.removeListener(_onHeightChanged);
    super.dispose();
  }

  void _onHeightChanged() {
    if (_scaleKey.currentContext == null) return;
    final RenderBox? renderBox = _scaleKey.currentContext!.findRenderObject() as RenderBox?;
    if (renderBox == null) return;
    centerY = renderBox.size.height / 2;
    setState(() {
      currentOffset = (selectedHeight.value - minHeight) * tickSpacing - centerY;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 25.setWidth,
        right: 25.setWidth,
        top: 30.setHeight,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        children: [
          SizedBox(height: 20.setHeight),
          CommonText(
            text: Languages.of(context).txtWhatsYourHeight,
            fontFamily: Constant.fontFamilyMulishExtraBold800,
            fontSize: 24.setFontSize,
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: Languages.of(context).txtTellUsYourHeightToMakePredicationsAndhealthTipsMoreAccurate,
            textColor: CustomAppColor.of(context).txtGray,
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 250.setHeight,
                  width: double.infinity,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      centerY = constraints.maxHeight / 2;
                      return GestureDetector(
                        onPanUpdate: (details) {
                          setState(() {
                            currentOffset -= details.delta.dy;
                          });
                        },
                        onPanEnd: (details) {
                          final double heightAtCenter = minHeight + (currentOffset + centerY) / tickSpacing;
                          final int newHeight = heightAtCenter.round().clamp(minHeight, maxHeight);
                          selectedHeight.value = newHeight;
                        },
                        child: Stack(
                          key: _scaleKey,
                          children: [
                            CustomPaint(
                              size: constraints.biggest,
                              painter: HeightScalePainter(
                                offset: currentOffset,
                                tickSpacing: tickSpacing,
                                minHeight: minHeight,
                                maxHeight: maxHeight,
                                primaryColor: CustomAppColor.of(context).primary,
                                blackColor: const Color(0xFF939393),
                                greyColor: CustomAppColor.of(context).grey,
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: centerY - 2.5.setWidth,
                              child: Container(
                                height: 5.setWidth,
                                width: 90.setHeight,
                                decoration: BoxDecoration(
                                  color: CustomAppColor.of(context).primary,
                                  borderRadius: BorderRadius.circular(1000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              ValueListenableBuilder<int>(
                valueListenable: selectedHeight,
                builder: (context, height, child) {
                  return Padding(
                    padding: EdgeInsets.only(top: 20.setHeight),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CommonText(
                          text: height.toString(),
                          fontSize: 40.setFontSize,
                          fontWeight: FontWeight.w700,
                          fontFamily: Constant.fontFamilyMulishBold700,
                          textAlign: TextAlign.center,
                          textColor: CustomAppColor.of(context).txtPrimary,
                          height: 1,
                        ),
                        SizedBox(width: 3.setWidth),
                        Container(
                          margin: EdgeInsets.only(bottom: 5.setHeight),
                          child: CommonText(
                            text: "cm",
                            fontSize: 26.setFontSize,
                            fontWeight: FontWeight.w400,
                            fontFamily: Constant.fontFamilyMulishRegular400,
                            textAlign: TextAlign.center,
                            textColor: CustomAppColor.of(context).txtPrimary,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
