import 'package:flutter/material.dart';
import 'package:mantra_yoga_screens_app_package/utils/sizer_utils.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../utils/constant.dart';
import '../../widgets/button/common_button.dart';
import '../../widgets/text/common_text.dart';

class CongratulationDialog extends StatefulWidget {
  final Function? onTap;
  final BuildContext parentContext;

  const CongratulationDialog({
    super.key,
    required this.onTap,
    required this.parentContext,
  });

  static Future<void> show(BuildContext context, {Function? onTap}) async {
    return showDialog(
      context: context,
      builder: (_) => CongratulationDialog(
        onTap: onTap,
        parentContext: context,
      ),
    );
  }

  @override
  State<CongratulationDialog> createState() => _CongratulationDialogState();
}

class _CongratulationDialogState extends State<CongratulationDialog> {
  @override
  Widget build(BuildContext context) {
    final lang = Languages.of(widget.parentContext);
    final colors = CustomAppColor.of(widget.parentContext);

    return AlertDialog(
      backgroundColor: colors.bgScreen,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 20.setWidth,
        vertical: 20.setHeight,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppAssets.imgCongratulation,
            width: 200.setHeight,
            height: 200.setHeight,
          ),
          SizedBox(height: 15.setHeight),
          CommonText(
            text: "${lang.txtCongratulations}!",
            fontSize: 28.setFontSize,
            fontWeight: FontWeight.w700,
            fontFamily: Constant.fontFamilyBold700,
            textColor: colors.txtBlack,
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: lang.txtLoremIpsum,
            fontSize: 12.setFontSize,
            fontWeight: FontWeight.w400,
            fontFamily: Constant.fontFamilyRegular400,
            textColor: colors.txtDarkGray,
          ),
          SizedBox(height: 20.setHeight),
          CommonButton(
            text: lang.txtDone,
            onTap: () {
              Navigator.pop(context);
              widget.onTap?.call();
            },
            buttonColor: colors.primary,
            borderColor: colors.borderColor,
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
