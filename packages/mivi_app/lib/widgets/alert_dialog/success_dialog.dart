import 'package:flutter/material.dart';
import 'package:mivi_app/utils/app_assets.dart';
import 'package:mivi_app/utils/constant.dart';
import 'package:mivi_app/utils/sizer_utils.dart';
import 'package:mivi_app/widgets/text/common_text.dart';

import '../../utils/app_color.dart';
import '../button/common_button.dart';

class SuccessDialog extends StatelessWidget {
  final BuildContext parentContext;

  const SuccessDialog({super.key, required this.parentContext});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 40.setWidth),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: CustomAppColor.of(context).secondary, width: 0.5),
      ),
      backgroundColor: CustomAppColor.of(context).bgAlertDialog,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 26.setWidth, horizontal: 24.setWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppAssets.icResetSuccessfully,
              width: 80.setWidth,
              height: 80.setHeight,
            ),
            SizedBox(height: 25.setHeight),
            CommonText(
              text: "Congratulations!",
              fontFamily: Constant.fontFamilyBold700,
              fontSize: 22.setFontSize,
            ),
            SizedBox(height: 5.setHeight),
            CommonText(
              text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem dummy.",
              fontSize: 10.setFontSize,
              textColor: CustomAppColor.of(context).txtLightGrey,
            ),
            SizedBox(height: 24.setHeight),
            CommonButton(
              text: "Ok!",
              width: 164.setWidth,
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(parentContext);
              },
              height: 45.setHeight,
            ),
          ],
        ),
      ),
    );
  }
}
