import 'package:flutter/material.dart';
import 'package:qr_scanner_screens_app_package/utils/sizer_utils.dart';
import 'package:qr_scanner_screens_app_package/utils/utils.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_color.dart';
import '../../widgets/button/common_button.dart';
import '../../widgets/text/common_text.dart';

class ChangeCameraTypeDialog extends StatefulWidget {
  final BuildContext parentContext; // Add parentContext

  const ChangeCameraTypeDialog({super.key, required this.parentContext});

  @override
  State<ChangeCameraTypeDialog> createState() => _ChangeCameraTypeDialogState();
}

class _ChangeCameraTypeDialogState extends State<ChangeCameraTypeDialog> {
  ValueNotifier<bool> isRearCamera = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: CustomAppColor.of(widget.parentContext)
          .txtBlack
          .withOpacityPercent(0.6),
      insetPadding: EdgeInsets.symmetric(horizontal: 16.setWidth),
      child: Container(
        padding: EdgeInsets.all(20.setWidth),
        decoration: BoxDecoration(
          color: CustomAppColor.of(widget.parentContext).bgDialog,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonText(
              text: Languages.of(widget.parentContext)
                  .txtCameraType, // Use parentContext
              fontSize: 20.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(widget.parentContext).primary,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15.setHeight),
            Divider(
              color: CustomAppColor.of(widget.parentContext).containerBorder,
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
                        activeColor:
                            CustomAppColor.of(widget.parentContext).primary,
                        onChanged: (value) {
                          isRearCamera.value = value ?? false;
                        },
                      ),
                    );
                  },
                ),
                CommonText(
                  text: Languages.of(widget.parentContext)
                      .txtRearCamera, // Use parentContext
                  fontSize: 15.setFontSize,
                  fontWeight: FontWeight.w500,
                  textColor:
                      CustomAppColor.of(widget.parentContext).txtDarkGray,
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
                        activeColor:
                            CustomAppColor.of(widget.parentContext).primary,
                        onChanged: (value) {
                          isRearCamera.value = value ?? false;
                        },
                      ),
                    );
                  },
                ),
                CommonText(
                  text: Languages.of(widget.parentContext)
                      .txtFrontCamera, // Use parentContext
                  fontSize: 15.setFontSize,
                  fontWeight: FontWeight.w500,
                  textColor:
                      CustomAppColor.of(widget.parentContext).txtDarkGray,
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
                    text: Languages.of(widget.parentContext)
                        .txtCancel
                        .toUpperCase(), // Use parentContext
                    buttonColor:
                        CustomAppColor.of(widget.parentContext).transparent,
                    borderColor:
                        CustomAppColor.of(widget.parentContext).primary,
                    buttonFontStyle: FontStyle.normal,
                    buttonTextColor:
                        CustomAppColor.of(widget.parentContext).primary,
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
                    text: Languages.of(widget.parentContext)
                        .txtOk
                        .toUpperCase(), // Use parentContext
                    buttonColor:
                        CustomAppColor.of(widget.parentContext).primary,
                    buttonTextColor:
                        CustomAppColor.of(widget.parentContext).white,
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
