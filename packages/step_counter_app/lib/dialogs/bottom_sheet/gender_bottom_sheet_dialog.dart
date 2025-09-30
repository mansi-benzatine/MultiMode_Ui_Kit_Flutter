import 'package:flutter/material.dart';
import 'package:step_counter_app_package/utils/sizer_utils.dart';
import 'package:step_counter_app_package/widgets/button/common_button.dart';
import 'package:step_counter_app_package/widgets/text/common_text.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';

class GenderBottomSheetDialog extends StatefulWidget {
  const GenderBottomSheetDialog({super.key, required this.onSave});

  final Function() onSave;

  @override
  State<GenderBottomSheetDialog> createState() => _GenderBottomSheetDialogState();
}

class _GenderBottomSheetDialogState extends State<GenderBottomSheetDialog> {
  final ValueNotifier<bool> isMale = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15.setHeight),
        ValueListenableBuilder(
          valueListenable: isMale,
          builder: (context, value, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    isMale.value = true;
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 100.setHeight,
                        width: 100.setWidth,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
                          border: Border.all(
                            color: value ? CustomAppColor.of(context).primary : CustomAppColor.of(context).borderColor,
                            width: value ? 2.5 : 1,
                          ),
                        ),
                        padding: EdgeInsets.all(15.setHeight),
                        child: Image.asset(
                          AppAssets.icMan,
                          color: value ? CustomAppColor.of(context).primary : CustomAppColor.of(context).borderColor,
                        ),
                      ),
                      SizedBox(height: 10.setHeight),
                      CommonText(
                        text: Languages.of(context).txtMale,
                        fontSize: 18.setFontSize,
                        fontWeight: value ? FontWeight.w600 : FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 30.setWidth),
                InkWell(
                  onTap: () {
                    isMale.value = false;
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 100.setHeight,
                        width: 100.setWidth,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
                          border: Border.all(
                            color: !value ? CustomAppColor.of(context).primary : CustomAppColor.of(context).borderColor,
                            width: !value ? 2.5 : 1,
                          ),
                        ),
                        padding: EdgeInsets.all(15.setHeight),
                        child: Image.asset(
                          AppAssets.icWomen,
                          color: !value ? CustomAppColor.of(context).primary : CustomAppColor.of(context).borderColor,
                        ),
                      ),
                      SizedBox(height: 10.setHeight),
                      CommonText(
                        text: Languages.of(context).txtFemale,
                        fontSize: 18.setFontSize,
                        fontWeight: !value ? FontWeight.w600 : FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        SizedBox(height: 30.setHeight),
        Row(
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
                text: Languages.of(context).txtSave,
                onTap: () {
                  Navigator.pop(context);
                  widget.onSave();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
