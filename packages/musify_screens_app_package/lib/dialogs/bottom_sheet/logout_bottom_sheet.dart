import 'package:flutter/material.dart';
import 'package:musify_screens_app_package/localization/language/languages.dart';
import 'package:musify_screens_app_package/utils/constant.dart';
import 'package:musify_screens_app_package/utils/utils.dart';

import '../../utils/app_color.dart';
import '../../utils/sizer_utils.dart';
import '../../widgets/button/common_button.dart';
import '../../widgets/text/common_text.dart';

class LogoutBottomSheet extends StatelessWidget {
  final Function? onLogout;

  const LogoutBottomSheet({
    super.key,
    this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgBottomSheet,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.setWidth),
            topRight: Radius.circular(20.setWidth),
          ),
        ),
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Wrap(
          children: [
            Center(
              child: Container(
                height: 4.setHeight,
                width: 40.setWidth,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).black.withOpacityPercent(0.5),
                  borderRadius: BorderRadius.circular(20.setWidth),
                ),
              ),
            ),
            SizedBox(height: 35.setHeight),
            Center(
              child: CommonText(
                text: Languages.of(context).txtLogout,
                fontSize: 24.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtRed,
                fontFamily: Constant.fontFamily,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40.setHeight),
            Divider(
              color: CustomAppColor.of(context).containerBorder,
              indent: 20.setWidth,
              endIndent: 20.setWidth,
            ),
            SizedBox(height: 35.setHeight),
            Center(
              child: CommonText(
                  text: Languages.of(context).txtAreYouSureWantToLogout,
                  fontSize: 16.setFontSize,
                  fontWeight: FontWeight.w400,
                  textColor: CustomAppColor.of(context).txtBlack,
                  fontFamily: Constant.fontFamily,
                  textAlign: TextAlign.center),
            ),
            SizedBox(height: 30.setHeight),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
                child: IgnorePointer(
                  ignoring: true,
                  child: Row(
                    children: [
                      Expanded(
                        child: CommonButton(
                          text: Languages.of(context).txtCancel,
                          borderColor: CustomAppColor.of(context).txtBlack,
                          buttonTextColor: CustomAppColor.of(context).txtBlack,
                          buttonColor: CustomAppColor.of(context).transparent,
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(width: 20.setWidth),
                      Expanded(
                        child: CommonButton(
                          text: Languages.of(context).txtLogout,
                          buttonColor: CustomAppColor.of(context).red.withOpacityPercent(0.1),
                          buttonTextColor: CustomAppColor.of(context).txtRed,
                          borderColor: CustomAppColor.of(context).red,
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(height: MediaQuery.of(context).size.height * 0.12),
          ],
        ),
      ),
    );
  }
}
