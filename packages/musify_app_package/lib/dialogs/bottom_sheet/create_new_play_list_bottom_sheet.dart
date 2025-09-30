import 'package:flutter/material.dart';
import 'package:musify_app_package/utils/sizer_utils.dart';
import 'package:musify_app_package/utils/utils.dart';
import 'package:musify_app_package/widgets/button/common_button.dart';
import 'package:musify_app_package/widgets/text_field/text_form_field.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_color.dart';
import '../../utils/constant.dart';
import '../../widgets/text/common_text.dart';

class CreateNewPlayListBottomSheet extends StatelessWidget {
  const CreateNewPlayListBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.4,
        ),
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
                  color: CustomAppColor.of(context).txtBlack.withOpacityPercent(0.5),
                  borderRadius: BorderRadius.circular(20.setWidth),
                ),
              ),
            ),
            SizedBox(height: 30.setHeight),
            Center(
              child: CommonText(
                text: Languages.of(context).txtCreateNewPlaylist,
                fontSize: 20.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtBlack,
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
            SizedBox(height: 40.setHeight),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: CommonTextFormField(
                controller: TextEditingController(text: "My New Music"),
                hintText: Languages.of(context).txtEnterPlaylistName,
                radius: 18,
                borderWidth: 0.5,
              ),
            ),
            SizedBox(height: 20.setHeight),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
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
                    SizedBox(width: 10.setWidth),
                    Expanded(
                      child: CommonButton(
                        text: Languages.of(context).txtCreate,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                )),
            SizedBox(height: MediaQuery.of(context).size.height * 0.12),
          ],
        ),
      ),
    );
  }
}
