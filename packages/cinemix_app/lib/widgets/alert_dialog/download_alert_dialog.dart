import 'dart:async';

import 'package:cinemix_app/utils/app_color.dart';
import 'package:cinemix_app/utils/constant.dart';
import 'package:cinemix_app/utils/sizer_utils.dart';
import 'package:cinemix_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../button/common_button.dart';

class DownloadAlertDialog extends StatefulWidget {
  final BuildContext parentContext;

  const DownloadAlertDialog({super.key, required this.parentContext});

  @override
  State<DownloadAlertDialog> createState() => _DownloadAlertDialogState();
}

class _DownloadAlertDialogState extends State<DownloadAlertDialog> with SingleTickerProviderStateMixin {
  double progressValue = 0.0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startProgressAnimation();
  }

  void startProgressAnimation() {
    timer = Timer.periodic(const Duration(milliseconds: 60), (timer) {
      if (progressValue >= 1.0) {
        timer.cancel();
        return;
      }

      setState(() {
        progressValue += 0.01;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 30.setWidth),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      backgroundColor: CustomAppColor.of(context).bgAlertDialog,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              CustomAppColor.of(context).bgShadowDark,
              CustomAppColor.of(context).bgTextFormFieldShadow,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.symmetric(vertical: 20.setWidth, horizontal: 16.setWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonText(
              text: "Download",
              fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
              fontSize: 22.setFontSize,
            ),
            Divider(height: 35.setHeight),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 90.setHeight,
                  width: 90.setWidth,
                  child: CircularProgressIndicator(
                    value: progressValue,
                    trackGap: 10,
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation(
                      CustomAppColor.of(context).primary,
                    ),
                    backgroundColor: CustomAppColor.of(context).txtLightGrey.withValues(alpha: 0.2),
                  ),
                ),
                Container(
                  height: 75.setHeight,
                  width: 75.setWidth,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomAppColor.of(context).btnGrey,
                  ),
                  child: Icon(
                    Icons.download_rounded,
                    size: 36.setFontSize,
                    color: CustomAppColor.of(context).primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.setHeight),
            CommonText(
              text: "${(progressValue * 100).toInt()}%",
              fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
              fontSize: 20.setFontSize,
            ),
            SizedBox(height: 20.setHeight),
            Row(
              children: [
                Expanded(
                  child: CommonButton(
                    text: "CANCEL",
                    onTap: () {
                      timer?.cancel();
                      Navigator.pop(context);
                    },
                    height: 44.setHeight,
                    buttonTextColor: CustomAppColor.of(context).txtBlack,
                    borderColor: CustomAppColor.of(context).txtBlack,
                    buttonColor: Colors.transparent,
                  ),
                ),
                SizedBox(width: 15.setWidth),
                Expanded(
                  child: CommonButton(
                    text: "DOWNLOAD",
                    onTap: () {
                      timer?.cancel();
                      Navigator.pop(context);
                    },
                    height: 44.setHeight,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
