import 'package:flutter/material.dart';

import '../../utils/app_color.dart';

class GradientText extends StatelessWidget {
  final List<Color>? gradientColors;

  final Widget? child;

  const GradientText({
    super.key,
    this.gradientColors,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (bounds) {
          return const LinearGradient(
            colors: [AppColor.btnGradiant1, AppColor.btnGradiant2],
          ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
        },
        blendMode: BlendMode.srcIn,
        child: child);
  }
}
