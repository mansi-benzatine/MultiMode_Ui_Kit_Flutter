import 'package:flutter/material.dart';
import 'package:qr_scanner_screens_app_package/utils/utils.dart';

import '../../../../../widgets/text/common_text.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../utils/sizer_utils.dart';
import '../../widgets/button/common_button.dart';

class CongratulationsDialog extends StatelessWidget {
  const CongratulationsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor:
          CustomAppColor.of(context).txtBlack.withOpacityPercent(.6),
      child: Container(
        padding: EdgeInsets.all(20.setWidth),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgDialog,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppAssets.icTabCreate,
              height: 110.setHeight,
              width: 110.setHeight,
              gaplessPlayback: true,
            ),
            SizedBox(height: 20.setHeight),
            CommonText(
              text: "Languages.of(context).txtCongratulations",
              fontWeight: FontWeight.w900,
              fontSize: 30.setFontSize,
              textColor: CustomAppColor.of(context).txtBlack,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.setHeight),
            CommonText(
              text: "Languages.of(context).txtLoremIpsumDesc",
              fontWeight: FontWeight.w500,
              fontSize: 12.setFontSize,
              textColor: CustomAppColor.of(context).txtBlackAndGray,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 25.setHeight),
            CommonButton(
              text: "Languages.of(context).txtContinue",
              onTap: () {
                ///Navigator.pushAndRemoveUntil(context, ChatAiDashboardScreen.route(), (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
