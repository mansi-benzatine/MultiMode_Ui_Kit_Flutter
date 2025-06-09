import 'package:flutter/material.dart';

import '../../../../../utils/app_color.dart';

class CustomContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final Widget child;

  const CustomContainer({
    super.key,
    required this.width,
    required this.height,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScaffold,
        border: Border.all(
          color: borderColor ?? CustomAppColor.of(context).containerBorder,
          width: borderWidth ?? 1,
        ),
        borderRadius: BorderRadius.circular(borderRadius ?? 15),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
