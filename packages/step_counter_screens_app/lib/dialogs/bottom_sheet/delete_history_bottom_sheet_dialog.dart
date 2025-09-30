import 'package:flutter/material.dart';
import 'package:step_counter_screens_app_package/utils/sizer_utils.dart';
import 'package:step_counter_screens_app_package/widgets/button/common_button.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../widgets/text/common_text.dart';

class DeleteHistoryBottomSheetDialog extends StatelessWidget {
  const DeleteHistoryBottomSheetDialog({super.key, required this.onDelete});

  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15.setHeight),
        Image.asset(
          AppAssets.icDeleteHistory,
          height: 80.setHeight,
          width: 80.setHeight,
        ),
        SizedBox(height: 25.setHeight),
        CommonText(
          text: Languages.of(context).txtAreYouSureToDeleteYourHistory,
          fontSize: 14.setFontSize,
          fontWeight: FontWeight.w500,
          textColor: CustomAppColor.of(context).txtDarkGray,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30.setHeight),
        IgnorePointer(
          ignoring: true,
          child: Row(
            children: [
              Expanded(
                child: CommonButton(
                  text: Languages.of(context).txtCancel,
                  mLeft: 15.setWidth,
                  mRight: 8.setWidth,
                  buttonColor: CustomAppColor.of(context).transparent,
                  buttonTextColor: CustomAppColor.of(context).txtPrimary,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Expanded(
                child: CommonButton(
                  mLeft: 8.setWidth,
                  mRight: 15.setWidth,
                  text: Languages.of(context).txtDelete,
                  onTap: () {
                    Navigator.pop(context);
                    onDelete();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
