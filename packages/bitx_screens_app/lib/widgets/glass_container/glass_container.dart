import 'dart:ui';

import 'package:bitx_screens_app/utils/app_color.dart';
import 'package:bitx_screens_app/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;

  const GlassContainer({
    super.key,
    required this.width,
    required this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.symmetric(horizontal: 18.setWidth, vertical: 18.setHeight),
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).glassContainerColor,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: CustomAppColor.of(context).glassContainerBorder,
              width: 1,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
