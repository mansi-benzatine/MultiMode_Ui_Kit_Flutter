import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';

class CommonDialog extends StatelessWidget {
  final Widget icon;
  final bool showLoader;
  final Widget? titleText;
  final Widget? descriptionText;
  final Widget? button;
  const CommonDialog({
    super.key,
    required this.icon,
    required this.titleText,
    required this.descriptionText,
    this.showLoader = false,
    this.button,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(height: 20),
            titleText ?? const CommonText(text: ""),
            const SizedBox(height: 10),
            descriptionText ?? const CommonText(text: ""),
            const SizedBox(height: 20),
            button ?? const SizedBox(),
            if (showLoader)
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [AppColor.btnGradiant1, AppColor.btnGradiant2],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: const SpinKitCircle(
                  color: Colors.white,
                  size: 70.0,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
