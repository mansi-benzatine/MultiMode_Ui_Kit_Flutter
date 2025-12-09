import 'dart:math' as math;

import 'package:flowly_screens_app/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';

class WeightScalePainter extends CustomPainter {
  final double offset;
  final double tickSpacing;
  final int minWeight;
  final int maxWeight;
  final Color primaryColor;
  final Color blackColor;
  final Color greyColor;

  WeightScalePainter({
    required this.offset,
    required this.tickSpacing,
    required this.minWeight,
    required this.maxWeight,
    required this.primaryColor,
    required this.blackColor,
    required this.greyColor,
  });

  double getCurveY(double xRel, double yBase, double amp) {
    xRel = xRel.clamp(-2.0, 2.0);
    final double factor = (math.cos(math.pi * xRel) + 2.5) / 1.5;
    return yBase - amp * factor;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double labelY = size.height - 6.setHeight;
    final double yBottomBase = labelY - 2.setHeight;
    final double yTopBase = yBottomBase - 30.setHeight;
    final double ampTop = 50.setHeight;
    final double ampBottom = 25.setHeight;

    for (int w = minWeight; w <= maxWeight; w++) {
      final double tickX = (w - minWeight) * tickSpacing - offset;
      if (tickX < -tickSpacing * 2 || tickX > size.width + tickSpacing * 2) continue;

      final bool isMajor = w % 10 == 0;
      final bool isMinor = (w % 5 == 0) && !isMajor;

      final Color tickColor = isMajor
          ? primaryColor
          : isMinor
              ? blackColor
              : greyColor;

      final double xRel = (tickX - centerX) / (size.width / 3);
      final double yTop = getCurveY(xRel, yTopBase, ampTop);
      final double yBottom = getCurveY(xRel, yBottomBase, ampBottom);

      final Paint linePaint = Paint()
        ..color = tickColor
        ..strokeWidth = 2.setWidth;

      canvas.drawLine(
        Offset(tickX, yTop),
        Offset(tickX, yBottom),
        linePaint,
      );

      if (isMajor) {
        final double labelYCurved = getCurveY(xRel, labelY, ampBottom * 0.9);
        final TextPainter textPainter = TextPainter(
          textDirection: TextDirection.ltr,
          text: TextSpan(
            text: w.toString(),
            style: TextStyle(
              color: blackColor,
              fontSize: 12.setFontSize,
              fontWeight: FontWeight.w600,
              height: 1.0,
            ),
          ),
        );
        textPainter.layout();
        final double textX = tickX - textPainter.width / 2;
        textPainter.paint(canvas, Offset(textX, labelYCurved));
      }
    }
  }

  @override
  bool shouldRepaint(covariant WeightScalePainter oldDelegate) {
    return oldDelegate.offset != offset;
  }
}

class YourWeightPage extends StatefulWidget {
  const YourWeightPage({super.key});

  @override
  State<YourWeightPage> createState() => _YourWeightPageState();
}

class _YourWeightPageState extends State<YourWeightPage> {
  final GlobalKey _scaleKey = GlobalKey();
  ValueNotifier<int> selectedWeight = ValueNotifier(75);
  final int minWeight = 30;
  final int maxWeight = 200;
  final double tickSpacing = 12.setWidth;
  double currentOffset = 0.0;
  late double centerX;

  @override
  void initState() {
    super.initState();
    selectedWeight.addListener(_onWeightChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _onWeightChanged();
    });
  }

  @override
  void dispose() {
    selectedWeight.removeListener(_onWeightChanged);
    super.dispose();
  }

  void _onWeightChanged() {
    if (_scaleKey.currentContext == null) return;
    final RenderBox? renderBox = _scaleKey.currentContext!.findRenderObject() as RenderBox?;
    if (renderBox == null) return;
    centerX = renderBox.size.width / 2;
    setState(() {
      currentOffset = (selectedWeight.value - minWeight) * tickSpacing - centerX;
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
            text: Languages.of(context).txtWhatsYourWeight,
            fontFamily: Constant.fontFamilyMulishExtraBold800,
            fontSize: 24.setFontSize,
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: Languages.of(context).txtTellUsYourWeightToMakePedictionsAndHealthTipsMoreAccurate,
            textColor: CustomAppColor.of(context).txtGray,
          ),
          const Spacer(),
          SizedBox(
            height: 190.setHeight,
            child: LayoutBuilder(
              builder: (context, constraints) {
                centerX = constraints.maxWidth / 2;
                return GestureDetector(
                  onPanUpdate: (details) {
                    setState(() {
                      currentOffset -= details.delta.dx;
                    });
                  },
                  onPanEnd: (details) {
                    final double weightAtCenter = minWeight + (currentOffset + centerX) / tickSpacing;
                    final int newWeight = weightAtCenter.round().clamp(minWeight, maxWeight);
                    selectedWeight.value = newWeight;
                  },
                  child: Stack(
                    key: _scaleKey,
                    children: [
                      CustomPaint(
                        size: constraints.biggest,
                        painter: WeightScalePainter(
                          offset: currentOffset,
                          tickSpacing: tickSpacing,
                          minWeight: minWeight,
                          maxWeight: maxWeight,
                          primaryColor: CustomAppColor.of(context).primary,
                          blackColor: const Color(0xFF939393),
                          greyColor: CustomAppColor.of(context).grey,
                        ),
                      ),
                      Positioned(
                        left: centerX - 2.5.setWidth,
                        bottom: 0,
                        child: Container(
                          height: 90.setHeight,
                          width: 5.setWidth,
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
          Expanded(
            child: ValueListenableBuilder<int>(
              valueListenable: selectedWeight,
              builder: (context, weight, child) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CommonText(
                      text: weight.toString(),
                      fontSize: 40.setFontSize,
                      fontWeight: FontWeight.w700,
                      fontFamily: Constant.fontFamilyMulishBold700,
                      textAlign: TextAlign.center,
                      textColor: CustomAppColor.of(context).primary,
                      height: 1,
                    ),
                    SizedBox(width: 3.setWidth),
                    Container(
                      margin: EdgeInsets.only(bottom: 5.setHeight),
                      child: CommonText(
                        text: "kg",
                        fontSize: 26.setFontSize,
                        fontWeight: FontWeight.w400,
                        fontFamily: Constant.fontFamilyMulishRegular400,
                        textAlign: TextAlign.center,
                        textColor: CustomAppColor.of(context).primary,
                        height: 1,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
