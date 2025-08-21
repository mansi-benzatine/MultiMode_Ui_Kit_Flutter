import 'package:flutter/material.dart';
import 'package:mantra_yoga_screens_app_package/utils/debug.dart';
import 'package:mantra_yoga_screens_app_package/utils/sizer_utils.dart';
import 'package:mantra_yoga_screens_app_package/widgets/text_field/text_form_field.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_color.dart';
import '../../utils/constant.dart';
import '../../widgets/button/common_button.dart';
import '../../widgets/rating/animated_star_rating.dart';
import '../../widgets/text/common_text.dart';

class ReviewDialog extends StatefulWidget {
  final Function? onTap;
  final BuildContext parentContext;

  const ReviewDialog({
    super.key,
    required this.parentContext,
    this.onTap,
  });

  static Future<void> show(
    BuildContext context, {
    Function? onTap,
  }) async {
    return showDialog(
      context: context,
      builder: (_) => ReviewDialog(
        parentContext: context,
        onTap: onTap,
      ),
    );
  }

  @override
  State<ReviewDialog> createState() => _ReviewDialogState();
}

class _ReviewDialogState extends State<ReviewDialog> {
  @override
  Widget build(BuildContext context) {
    final parentContext = widget.parentContext;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
      alignment: Alignment.center,
      child: Material(
        color: CustomAppColor.of(parentContext).bgScreen,
        borderRadius: BorderRadius.circular(34),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonText(
                text: Languages.of(parentContext).txtReview,
                fontSize: 22.setFontSize,
                fontWeight: FontWeight.w700,
                fontFamily: Constant.fontFamilyBold700,
                textColor: CustomAppColor.of(parentContext).txtBlack,
              ),
              Divider(
                color: CustomAppColor.of(parentContext).txtBlack.withValues(alpha: 0.5),
                thickness: 1,
                height: 25.setHeight,
              ),
              CommonText(
                text: Languages.of(parentContext).txtPleaseGiveYourRatesAndAlsoGiveYourReview,
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w400,
                fontFamily: Constant.fontFamilyRegular400,
                textColor: CustomAppColor.of(parentContext).txtDarkGray,
              ),
              SizedBox(height: 20.setHeight),
              CommonTextFormField(
                controller: TextEditingController(),
                hintText: "${Languages.of(parentContext).txtMessage}...",
                maxLines: 3,
                radius: 18,
              ),
              SizedBox(height: 20.setHeight),
              AnimatedStarRating(
                maxRating: 5,
                currentRating: 0,
                onRatingChanged: (rating) {
                  Debug.printLog("rating: $rating");
                },
              ),
              SizedBox(height: 20.setHeight),
              CommonButton(
                text: Languages.of(parentContext).txtSubmit,
                onTap: () {
                  Navigator.pop(context);
                  widget.onTap?.call();
                },
                buttonColor: CustomAppColor.of(parentContext).primary,
                borderColor: CustomAppColor.of(parentContext).borderColor,
                borderWidth: 3,
                height: 55.setHeight,
                radius: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
