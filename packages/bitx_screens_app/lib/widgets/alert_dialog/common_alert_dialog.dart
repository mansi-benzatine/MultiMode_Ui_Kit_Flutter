import 'package:bitx_screens_app/utils/sizer_utils.dart';
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
        padding: EdgeInsets.symmetric(vertical: 30.setWidth, horizontal: 16.setWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            SizedBox(height: 20.setHeight),
            titleText ?? const CommonText(text: ""),
            SizedBox(height: 10.setHeight),
            descriptionText ?? const CommonText(text: ""),
            SizedBox(height: 20.setHeight),
            button ?? const SizedBox(),
            if (showLoader)
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [CustomAppColor.of(context).primary, CustomAppColor.of(context).primary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: const SpinKitCircle(
                  color: Colors.white,
                  size: 60.0,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
