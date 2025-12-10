import 'package:baby_bloom_app/utils/app_assets.dart';
import 'package:baby_bloom_app/utils/app_color.dart';
import 'package:baby_bloom_app/utils/constant.dart';
import 'package:baby_bloom_app/utils/sizer_utils.dart';
import 'package:baby_bloom_app/widgets/button/common_button.dart';
import 'package:baby_bloom_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../text_field/text_form_field.dart';

class ReviewAlertDialog extends StatefulWidget {
  const ReviewAlertDialog({super.key});

  @override
  ReviewAlertDialogState createState() => ReviewAlertDialogState();
}

class ReviewAlertDialogState extends State<ReviewAlertDialog> {
  final TextEditingController _reviewController = TextEditingController();
  double _rating = 0.0;
  int selectedRate = 0;

  List<String> rateUsImage = [
    AppAssets.icRate0,
    AppAssets.icRate1,
    AppAssets.icRate2,
    AppAssets.icRate3,
    AppAssets.icRate4,
    AppAssets.icRate5,
  ];

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
      backgroundColor: CustomAppColor.of(context).bgScreen,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.setWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CommonText(
                      text: "Rate Us",
                      fontSize: 20.setFontSize,
                      fontFamily: Constant.fontFamilySemiBold600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close),
                  )
                ],
              ),
            ),
            SizedBox(height: 10.setHeight),
            CommonText(
              text: "Please give your rate and share your experience to us",
              fontSize: 14.setFontSize,
              fontFamily: Constant.fontFamilyMedium500,
              textColor: CustomAppColor.of(context).txtLightGrey,
            ),
            SizedBox(height: 16.0.setHeight),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (child, animation) => FadeTransition(opacity: animation, child: child),
              child: Image.asset(
                rateUsImage[selectedRate],
                key: ValueKey<int>(selectedRate),
                height: 80.setHeight,
                width: 90.setWidth,
              ),
            ),
            SizedBox(height: 10.setHeight),
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
                          selectedRate = index + 1;
                        },
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 20.setHeight),
            CommonTextFormField(
              controller: _reviewController,
              hintText: "Type your experience",
              radius: 15,
              maxLines: 3,
              minLines: 3,
            ),
            SizedBox(height: 20.setHeight),
            CommonButton(
              height: 45.setHeight,
              onTap: () {
                Navigator.pop(context);
              },
              text: "Submit",
            ),
          ],
        ),
      ),
    );
  }
}
