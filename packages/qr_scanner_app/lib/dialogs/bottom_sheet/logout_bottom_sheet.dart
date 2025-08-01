import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/sizer_utils.dart';
import '../../widgets/button/common_button.dart';
import '../../widgets/text/common_text.dart';

class LogoutBottomDataSheet extends StatelessWidget {
  final Function? onLogout;

  const LogoutBottomDataSheet({
    super.key,
    this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.setHeight),
        CommonText(
          text: "Languages.of(context).txtAreYouSureWantToLogout",
          fontWeight: FontWeight.w500,
          fontSize: 15.setFontSize,
          textColor: CustomAppColor.of(context).txtBlack,
        ),
        SizedBox(height: 25.setHeight),
        Row(
          children: [
            Expanded(
              child: CommonButton(
                buttonColor: CustomAppColor.of(context).bgScreen,
                text: "Languages.of(context).txtCancel",
                buttonTextColor: CustomAppColor.of(context).txtBlack,
                onTap: () {
                  Navigator.pop(context);
                },
                borderColor: CustomAppColor.of(context).lineColor,
              ),
            ),
            SizedBox(width: 10.setWidth),
            Expanded(
              child: CommonButton(
                buttonColor: CustomAppColor.of(context).red,
                buttonTextColor: CustomAppColor.of(context).white,
                text: "Languages.of(context).txtLogout",
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
