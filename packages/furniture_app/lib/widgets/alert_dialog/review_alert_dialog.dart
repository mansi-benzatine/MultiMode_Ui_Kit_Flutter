import 'package:flutter/material.dart';
import 'package:furniture_app_package/utils/app_color.dart';
import 'package:furniture_app_package/utils/constant.dart';
import 'package:furniture_app_package/utils/sizer_utils.dart';
import 'package:furniture_app_package/widgets/button/common_button.dart';
import 'package:furniture_app_package/widgets/text/common_text.dart';
import 'package:furniture_app_package/widgets/text_field/text_form_field.dart';

class ReviewAlertDialog extends StatefulWidget {
  const ReviewAlertDialog({super.key});

  @override
  ReviewAlertDialogState createState() => ReviewAlertDialogState();
}

class ReviewAlertDialogState extends State<ReviewAlertDialog> {
  final TextEditingController _reviewController = TextEditingController();
  double _rating = 0.0;

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      backgroundColor: CustomAppColor.of(context).bgAlertDialog,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonText(
              text: "Review",
              fontSize: 28.setFontSize,
              fontFamily: Constant.fontFamilyBold700,
            ),
            Divider(color: CustomAppColor.of(context).dividerColor),
            SizedBox(height: 10.setHeight),
            CommonText(
              text: "Please Give Your Rates And Also Give Your Review",
              fontSize: 16.setFontSize,
              fontFamily: Constant.fontFamilyMedium500,
              textColor: CustomAppColor.of(context).txtLightGrey,
            ),
            SizedBox(height: 16.0.setHeight),
            CommonTextFormField(
              controller: _reviewController,
              hintText: "Message...",
              maxLines: 3,
              minLines: 3,
            ),
            SizedBox(height: 24.0.setHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) {
                  return IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      _rating > index ? Icons.star_rounded : Icons.star_rounded,
                      color: _rating > index ? CustomAppColor.of(context).btnPrimary : CustomAppColor.of(context).txtLightGrey.withValues(alpha: 0.3),
                      size: 45,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          _rating = (index + 1).toDouble();
                        },
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 24.0.setHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: CommonButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    text: "Cancel",
                    buttonTextColor: CustomAppColor.of(context).txtLightGrey,
                    buttonColor: CustomAppColor.of(context).transparent,
                    borderColor: CustomAppColor.of(context).dividerColor,
                  ),
                ),
                SizedBox(width: 12.setWidth),
                Expanded(
                  child: CommonButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    text: "Submit",
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
