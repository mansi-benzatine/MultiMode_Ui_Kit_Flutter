import 'package:flutter/material.dart';

import '../../../../../utils/app_color.dart';

class DottedDividerView extends StatelessWidget {
  final double height;
  final Color? color;
  final double dashWidth;
  final double dashSpace;

  const DottedDividerView({
    super.key,
    this.height = 1,
    this.color,
    this.dashWidth = 5,
    this.dashSpace = 3,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashCount = (boxWidth / (dashWidth + dashSpace)).floor();

        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: height,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: color ?? CustomAppColor.of(context).lineColor,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
