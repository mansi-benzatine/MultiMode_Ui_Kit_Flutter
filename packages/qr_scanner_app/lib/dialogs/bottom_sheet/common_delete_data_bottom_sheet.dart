import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/sizer_utils.dart';
import '../../widgets/button/common_button.dart';
import '../../widgets/text/common_text.dart';

class DeleteBottomDataSheet extends StatelessWidget {
  final Function? onDelete;
  final String deleteMessage;

  const DeleteBottomDataSheet({
    super.key,
    this.onDelete,
    required this.deleteMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonText(
          text: deleteMessage,
          fontWeight: FontWeight.w500,
          fontSize: 15.setFontSize,
          textColor: CustomAppColor.of(context).txtBlack,
        ),
        SizedBox(height: 25.setHeight),
        Row(
          children: [
            Expanded(
              child: CommonButton(
                buttonColor: CustomAppColor.of(context).unSelectedTabColor,
                text: "Languages.of(context).txtCancel",
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
                text: "Languages.of(context).txtDelete",
                onTap: () {
                  onDelete?.call();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
