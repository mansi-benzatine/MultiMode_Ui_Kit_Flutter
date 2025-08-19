import 'package:flutter/material.dart';
import 'package:taxi_booking_driver_screens_app_package/utils/app_color.dart';
import 'package:taxi_booking_driver_screens_app_package/utils/sizer_utils.dart';

import '../../../widgets/text/common_text.dart';

class CommonDialog extends StatelessWidget {
  final Widget icon;
  final Widget? titleText;
  final Widget? descriptionText;
  final Widget? button;
  const CommonDialog({
    super.key,
    required this.icon,
    required this.titleText,
    required this.descriptionText,
    this.button,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 0.setWidth),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      backgroundColor: CustomAppColor.of(context).bgAlertDialog,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.setWidth, horizontal: 16.setWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            SizedBox(height: 30.setHeight),
            titleText ?? const CommonText(text: ""),
            SizedBox(height: 10.setHeight),
            descriptionText ?? const CommonText(text: ""),
            SizedBox(height: 30.setHeight),
            button ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
