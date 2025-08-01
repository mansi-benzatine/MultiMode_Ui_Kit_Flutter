import 'package:flutter/material.dart';
import 'package:qr_scanner_screens_app_package/utils/sizer_utils.dart';
import 'package:qr_scanner_screens_app_package/utils/utils.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_color.dart';
import '../../widgets/button/common_button.dart';
import '../../widgets/text/common_text.dart';

class ChangeCameraTypeDialog extends StatefulWidget {
  const ChangeCameraTypeDialog({super.key});

  @override
  State<ChangeCameraTypeDialog> createState() => _ChangeCameraTypeDialogState();
}

class _ChangeCameraTypeDialogState extends State<ChangeCameraTypeDialog> {
  ValueNotifier<bool> isRearCamera = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor:
          CustomAppColor.of(context).txtBlack.withOpacityPercent(0.6),
      insetPadding: EdgeInsets.symmetric(horizontal: 16.setWidth),
      child: Container(
        padding: EdgeInsets.all(20.setWidth),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgDialog,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonText(
              text: Languages.of(context).txtCameraType,
              fontSize: 20.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).primary,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15.setHeight),
            Divider(
              color: CustomAppColor.of(context).containerBorder,
              height: 1,
            ),
            SizedBox(height: 25.setHeight),
            Row(
              children: [
                ValueListenableBuilder(
                  valueListenable: isRearCamera,
                  builder: (context, value, child) {
                    return SizedBox(
                      width: 30.setWidth,
                      height: 30.setHeight,
                      child: Radio(
                        value: true,
                        groupValue: isRearCamera.value,
                        activeColor: CustomAppColor.of(context).primary,
                        onChanged: (value) {
                          isRearCamera.value = value ?? false;
                        },
                      ),
                    );
                  },
                ),
                CommonText(
                  text: Languages.of(context).txtRearCamera,
                  fontSize: 15.setFontSize,
                  fontWeight: FontWeight.w500,
                  textColor: CustomAppColor.of(context).txtDarkGray,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 5.setHeight),
            Row(
              children: [
                ValueListenableBuilder(
                  valueListenable: isRearCamera,
                  builder: (context, value, child) {
                    return SizedBox(
                      width: 30.setWidth,
                      height: 30.setHeight,
                      child: Radio(
                        value: false,
                        groupValue: isRearCamera.value,
                        activeColor: CustomAppColor.of(context).primary,
                        onChanged: (value) {
                          isRearCamera.value = value ?? false;
                        },
                      ),
                    );
                  },
                ),
                CommonText(
                  text: Languages.of(context).txtFrontCamera,
                  fontSize: 15.setFontSize,
                  fontWeight: FontWeight.w500,
                  textColor: CustomAppColor.of(context).txtDarkGray,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 30.setHeight),
            Row(
              children: [
                Expanded(
                  child: CommonButton(
                    onTap: () {
                      Navigator.pop(context, false);
                    },
                    text: Languages.of(context).txtCancel.toUpperCase(),
                    buttonColor: CustomAppColor.of(context).transparent,
                    borderColor: CustomAppColor.of(context).primary,
                    buttonFontStyle: FontStyle.normal,
                    buttonTextColor: CustomAppColor.of(context).primary,
                    buttonTextSize: 14.setFontSize,
                    buttonTextWeight: FontWeight.w500,
                    height: 40.setHeight,
                  ),
                ),
                SizedBox(width: 10.setWidth),
                Expanded(
                  child: CommonButton(
                    onTap: () {
                      Navigator.pop(context, isRearCamera.value);
                    },
                    text: Languages.of(context).txtOk.toUpperCase(),
                    buttonColor: CustomAppColor.of(context).primary,
                    buttonTextColor: CustomAppColor.of(context).white,
                    height: 40.setHeight,
                    buttonTextSize: 14.setFontSize,
                    buttonTextWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
