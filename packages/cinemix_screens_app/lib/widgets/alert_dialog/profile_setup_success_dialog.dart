import 'package:cinemix_screens_app/ui/who_is_watching/view/who_is_watching_screen.dart';
import 'package:cinemix_screens_app/utils/app_assets.dart';
import 'package:cinemix_screens_app/utils/constant.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:cinemix_screens_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../button/common_button.dart';

class ProfileSetupSuccessDialog extends StatelessWidget {
  const ProfileSetupSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 30.setWidth),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              CustomAppColor.of(context).bgShadowDark,
              CustomAppColor.of(context).bgTextFormFieldShadowLight,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.symmetric(vertical: 26.setWidth, horizontal: 24.setWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: CustomAppColor.of(context).primary,
                  width: 2,
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Image.asset(
                AppAssets.icProfileTick,
                width: 45.setWidth,
                height: 45.setHeight,
              ),
            ),
            SizedBox(height: 15.setHeight),
            CommonText(
              text: "Congratulations!",
              fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
              fontSize: 22.setFontSize,
            ),
            SizedBox(height: 8.setHeight),
            CommonText(
              text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem dummy.",
              fontSize: 13.setFontSize,
              textColor: CustomAppColor.of(context).txtLightGrey,
            ),
            SizedBox(height: 24.setHeight),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.setWidth),
              child: IgnorePointer(
                ignoring: true,
                child: CommonButton(
                  text: "Done!",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, WhoIsWatchingScreen.route());
                  },
                  height: 45.setHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
