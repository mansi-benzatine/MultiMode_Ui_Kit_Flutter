import 'package:baby_bloom_screens_app/utils/app_assets.dart';
import 'package:baby_bloom_screens_app/utils/constant.dart';
import 'package:baby_bloom_screens_app/utils/sizer_utils.dart';
import 'package:baby_bloom_screens_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../../utils/app_color.dart';

class DoseCompleteAlertDialog extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const DoseCompleteAlertDialog());
  }

  const DoseCompleteAlertDialog({super.key});

  @override
  State<DoseCompleteAlertDialog> createState() => _DoseCompleteAlertDialogState();
}

class _DoseCompleteAlertDialogState extends State<DoseCompleteAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 25.setWidth),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      backgroundColor: CustomAppColor.of(context).bgAlertDialog,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.setWidth, horizontal: 20.setWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomAppColor.of(context).btnGrey,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    AppAssets.icInjection,
                    height: 20.setHeight,
                    width: 20.setWidth,
                    color: CustomAppColor.of(context).icBlackWhite,
                  ),
                ),
                SizedBox(width: 5.setWidth),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: "BCG",
                        fontFamily: Constant.fontFamilySemiBold600,
                        fontSize: 18.setFontSize,
                      ),
                      CommonText(
                        text: "Recommended at",
                        fontSize: 12.setFontSize,
                        textColor: CustomAppColor.of(context).txtLightGrey,
                      )
                    ],
                  ),
                ),
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
            Divider(
              height: 25.setHeight,
            ),
            const CommonText(
              text: "Why it’s important :",
              fontFamily: Constant.fontFamilyMedium500,
            ),
            SizedBox(height: 5.setHeight),
            CommonText(
              text: "Vaccine that provides immunity against tuberculosis, a serious bacterial infection affects the lungs.",
              fontSize: 12.setFontSize,
              textAlign: TextAlign.start,
              textColor: CustomAppColor.of(context).txtLightGrey,
            ),
            SizedBox(height: 15.setHeight),
            const CommonText(
              text: "Status :",
              fontFamily: Constant.fontFamilyMedium500,
            ),
            SizedBox(height: 5.setHeight),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.setWidth, vertical: 5.setHeight),
              decoration: BoxDecoration(color: Colors.green.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(16)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 16,
                  ),
                  SizedBox(width: 4.setWidth),
                  const CommonText(
                    text: "Completed on 15 July 2025",
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    textColor: Colors.green,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
