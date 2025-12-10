import 'package:baby_bloom_screens_app/utils/app_assets.dart';
import 'package:baby_bloom_screens_app/utils/app_color.dart';
import 'package:baby_bloom_screens_app/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../utils/constant.dart';
import '../text/common_text.dart';

class PregnancyLossAlertDialog extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const PregnancyLossAlertDialog());
  }

  const PregnancyLossAlertDialog({super.key});

  @override
  State<PregnancyLossAlertDialog> createState() => _PregnancyLossAlertDialogState();
}

class _PregnancyLossAlertDialogState extends State<PregnancyLossAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 40.setWidth),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      backgroundColor: CustomAppColor.of(context).bgAlertDialog,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.setWidth, horizontal: 20.setWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IgnorePointer(
                  ignoring: true,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.close,
                    ),
                  ),
                )
              ],
            ),
            Image.asset(
              AppAssets.icEmojiSad,
              height: 80.setHeight,
              width: 80.setWidth,
            ),
            CommonText(
              text: "We're Sorry for Your Loss",
              fontFamily: Constant.fontFamilyBold700,
              fontSize: 18.setFontSize,
            ),
            SizedBox(height: 5.setHeight),
            CommonText(
              text: "We know this can be an emotional and overwhelming moment. Please remember you are not alone. Take the time you need, and when you feel ready, we are here to support you.",
              fontSize: 12.setFontSize,
              textAlign: TextAlign.center,
              textColor: CustomAppColor.of(context).txtLightGrey,
            ),
          ],
        ),
      ),
    );
  }
}
