import 'package:flutter/material.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_color.dart';
import '../../utils/sizer_utils.dart';
import '../../widgets/button/common_button.dart';
import '../../widgets/text/common_text.dart';

class ClearChatBottomSheet extends StatelessWidget {
  final Function? onLogout;

  const ClearChatBottomSheet({
    super.key,
    this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25.setHeight),
        CommonText(
          text: Languages.of(context).txtAreYouSureYouWantToClearChat,
          fontWeight: FontWeight.w500,
          fontSize: 15.setFontSize,
          textColor: CustomAppColor.of(context).txtBlack,
        ),
        SizedBox(height: 30.setHeight),
        Row(
          children: [
            Expanded(
              child: CommonButton(
                buttonColor: CustomAppColor.of(context).unSelectedTabColor,
                text: Languages.of(context).txtCancel,
                buttonTextColor: CustomAppColor.of(context).txtBlack,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(width: 10.setWidth),
            Expanded(
              child: CommonButton(
                buttonColor: CustomAppColor.of(context).primary,
                text: Languages.of(context).txtClearChat,
                onTap: () {
                  onLogout?.call();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
