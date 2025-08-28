import 'package:flutter/material.dart';
import 'package:mantra_yoga_screens_app_package/utils/sizer_utils.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../utils/constant.dart';
import '../../widgets/button/common_button.dart';
import '../../widgets/text/common_text.dart';

class SubscriptionCongratulationDialog extends StatefulWidget {
  final BuildContext parentContext;
  final Function? onTap;

  const SubscriptionCongratulationDialog({
    super.key,
    required this.parentContext,
    this.onTap,
  });

  static Future<void> show(BuildContext context, {Function? onTap}) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => SubscriptionCongratulationDialog(
        parentContext: context,
        onTap: onTap,
      ),
    );
  }

  @override
  State<SubscriptionCongratulationDialog> createState() => _SubscriptionCongratulationDialogState();
}

class _SubscriptionCongratulationDialogState extends State<SubscriptionCongratulationDialog> {
  @override
  Widget build(BuildContext context) {
    final parentContext = widget.parentContext;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Navigator.pop(context);
        }
      },
      child: AlertDialog(
        backgroundColor: CustomAppColor.of(parentContext).bgScreen,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.setWidth,
          vertical: 20.setHeight,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppAssets.imgSubscriptionDone,
              width: 100.setHeight,
              height: 100.setHeight,
            ),
            SizedBox(height: 15.setHeight),
            CommonText(
              text: "${Languages.of(parentContext).txtCongratulations}!",
              fontSize: 28.setFontSize,
              fontWeight: FontWeight.w700,
              fontFamily: Constant.fontFamilyBold700,
              textColor: CustomAppColor.of(parentContext).txtBlack,
            ),
            SizedBox(height: 10.setHeight),
            CommonText(
              text: Languages.of(parentContext).txtLoremIpsum,
              fontSize: 12.setFontSize,
              fontWeight: FontWeight.w400,
              fontFamily: Constant.fontFamilyRegular400,
              textColor: CustomAppColor.of(parentContext).txtDarkGray,
            ),
            SizedBox(height: 20.setHeight),
            IgnorePointer(
              ignoring: true,
              child: CommonButton(
                text: Languages.of(parentContext).txtDone,
                onTap: () {
                  Navigator.pop(context);
                  widget.onTap?.call();
                },
                buttonColor: CustomAppColor.of(parentContext).primary,
                borderColor: CustomAppColor.of(parentContext).borderColor,
                borderWidth: 3,
                height: 55.setHeight,
                width: 180.setWidth,
                radius: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
