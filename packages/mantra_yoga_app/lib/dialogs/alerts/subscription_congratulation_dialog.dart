import 'package:flutter/material.dart';
import 'package:mantra_yoga_app_package/utils/sizer_utils.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../utils/constant.dart';
import '../../widgets/button/common_button.dart';
import '../../widgets/text/common_text.dart';

class SubscriptionCongratulationDialog extends StatefulWidget {
  const SubscriptionCongratulationDialog({super.key, required this.onTap});

  final Function? onTap;

  static Future<void> show(BuildContext context, {Function? onTap}) async {
    return showDialog(
      context: context,
      builder: (context) => SubscriptionCongratulationDialog(onTap: onTap),
    );
  }

  @override
  State<SubscriptionCongratulationDialog> createState() => _SubscriptionCongratulationDialogState();
}

class _SubscriptionCongratulationDialogState extends State<SubscriptionCongratulationDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
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
            text: "${Languages.of(context).txtCongratulations}!",
            fontSize: 28.setFontSize,
            fontWeight: FontWeight.w700,
            fontFamily: Constant.fontFamilyBold700,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: Languages.of(context).txtLoremIpsum,
            fontSize: 12.setFontSize,
            fontWeight: FontWeight.w400,
            fontFamily: Constant.fontFamilyRegular400,
            textColor: CustomAppColor.of(context).txtDarkGray,
          ),
          SizedBox(height: 20.setHeight),
          CommonButton(
            text: Languages.of(context).txtDone,
            onTap: () {
              Navigator.pop(context);
              widget.onTap?.call();
            },
            buttonColor: CustomAppColor.of(context).primary,
            borderColor: CustomAppColor.of(context).borderColor,
            borderWidth: 3,
            height: 55.setHeight,
            width: 180.setWidth,
            radius: 18,
          ),
        ],
      ),
    );
  }
}
