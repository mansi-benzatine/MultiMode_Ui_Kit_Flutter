import 'package:flutter/material.dart';
import 'package:mantra_yoga_screens_app_package/utils/sizer_utils.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../utils/constant.dart';
import '../../widgets/button/common_button.dart';
import '../../widgets/text/common_text.dart';

class CompletedDialog extends StatefulWidget {
  final Function? onTap;
  final BuildContext parentContext; // ✅ Add parentContext

  const CompletedDialog({
    super.key,
    required this.parentContext,
    this.onTap,
  });

  static Future<void> show(BuildContext context, {Function? onTap}) async {
    return showDialog(
      context: context,
      builder: (_) => CompletedDialog(
        parentContext: context,
        onTap: onTap,
      ),
    );
  }

  @override
  State<CompletedDialog> createState() => _CompletedDialogState();
}

class _CompletedDialogState extends State<CompletedDialog> {
  @override
  Widget build(BuildContext context) {
    final parentContext = widget.parentContext;

    return AlertDialog(
      backgroundColor: CustomAppColor.of(parentContext).bgScreen,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20.setWidth,
        vertical: 20.setHeight,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppAssets.icCompleted,
            width: 120.setHeight,
            height: 120.setHeight,
          ),
          SizedBox(height: 15.setHeight),
          CommonText(
            text: "${Languages.of(parentContext).txtCompleted}!",
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
          CommonButton(
            text: Languages.of(parentContext).txtContinue,
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
        ],
      ),
    );
  }
}
