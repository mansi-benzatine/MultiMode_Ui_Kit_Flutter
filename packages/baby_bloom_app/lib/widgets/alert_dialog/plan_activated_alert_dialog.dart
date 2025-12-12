import 'package:baby_bloom_app/utils/app_color.dart';
import 'package:baby_bloom_app/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../utils/app_assets.dart';
import '../../utils/constant.dart';
import '../button/common_button.dart';
import '../text/common_text.dart';

class PlanActivatedAlertDialog extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const PlanActivatedAlertDialog());
  }

  const PlanActivatedAlertDialog({super.key});

  @override
  State<PlanActivatedAlertDialog> createState() => _PlanActivatedAlertDialogState();
}

class _PlanActivatedAlertDialogState extends State<PlanActivatedAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 35.setWidth),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      backgroundColor: CustomAppColor.of(context).bgAlertDialog,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.setWidth, horizontal: 20.setWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppAssets.icPlanActivate,
              width: 130.setWidth,
              height: 130.setHeight,
            ),
            SizedBox(height: 5.setHeight),
            CommonText(
              text: "Plan Activated!",
              fontFamily: Constant.fontFamilyBold700,
              fontSize: 24.setFontSize,
            ),
            SizedBox(height: 15.setHeight),
            CommonText(
              text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem dummy.",
              fontSize: 12.setFontSize,
              textColor: CustomAppColor.of(context).txtLightGrey,
            ),
            SizedBox(height: 24.setHeight),
            CommonButton(
              text: "Back to Home",
              onTap: () {
                Navigator.pop(context);
              },
              borderColor: CustomAppColor.of(context).secondary,
              buttonColor: CustomAppColor.of(context).secondary,
            ),
          ],
        ),
      ),
    );
  }
}
