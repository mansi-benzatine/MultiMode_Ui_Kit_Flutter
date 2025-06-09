import 'package:chat_ai_screens_app_package/widgets/text_field/text_form_field.dart';
import 'package:flutter/material.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_color.dart';
import '../../utils/sizer_utils.dart';
import '../../widgets/button/common_button.dart';

class RenameBottomSheet extends StatelessWidget {
  final Function? onLogout;

  const RenameBottomSheet({
    super.key,
    this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonTextFormField(controller: TextEditingController(text: "12/05/2024"), hintText: ""),
        SizedBox(height: 25.setHeight),
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
                text: Languages.of(context).txtRename,
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
