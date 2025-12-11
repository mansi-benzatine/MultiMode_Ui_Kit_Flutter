import 'package:cinemix_screens_app/utils/app_color.dart';
import 'package:cinemix_screens_app/utils/constant.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:cinemix_screens_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../button/common_button.dart';

class ReviewAlertDialog extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ReviewAlertDialog());
  }

  const ReviewAlertDialog({super.key});

  @override
  State<ReviewAlertDialog> createState() => _ReviewAlertDialogState();
}

class _ReviewAlertDialogState extends State<ReviewAlertDialog> {
  double rating = 0;
  final TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20.setWidth),
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
        padding: EdgeInsets.symmetric(vertical: 20.setHeight, horizontal: 24.setWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonText(
              text: "Give Review",
              fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
              fontSize: 22.setFontSize,
            ),
            SizedBox(height: 6.setHeight),
            const Divider(),
            SizedBox(height: 8.setHeight),
            CommonText(
              text: "Please Give Your Rates And Also Give\nYour Review",
              fontSize: 13.setFontSize,
              textAlign: TextAlign.center,
              textColor: CustomAppColor.of(context).txtLightGrey,
            ),
            SizedBox(height: 20.setHeight),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 10.setHeight),
              height: 110.setHeight,
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).textFormFieldBg,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: CustomAppColor.of(context).textFormFieldBg,
                ),
              ),
              child: TextField(
                controller: reviewController,
                maxLines: 3,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Message...",
                ),
                style: TextStyle(
                  package: "cinemix_screens_app",
                  fontFamily: Constant.fontFamilyClashGroteskRegular400,
                  fontSize: 12.setFontSize,
                  color: CustomAppColor.of(context).hintText,
                ),
              ),
            ),
            SizedBox(height: 20.setHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      rating = index + 1.0;
                    });
                  },
                  child: Icon(
                    Icons.star_rate_rounded,
                    size: 36.setFontSize,
                    color: index < rating ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtLightGrey,
                  ),
                );
              }),
            ),
            SizedBox(height: 30.setHeight),
            IgnorePointer(
              ignoring: true,
              child: Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      text: "CANCEL",
                      onTap: () {
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
                      text: "SUBMIT",
                      onTap: () {
                        Navigator.pop(context);
                      },
                      height: 44.setHeight,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
