import 'package:bitx_app/widgets/button/common_button.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/text/common_text.dart';
import '../../utils/app_color.dart';
import '../../utils/sizer_utils.dart';

class LogoutDialog extends StatefulWidget {
  const LogoutDialog({
    super.key,
  });

  @override
  State<LogoutDialog> createState() => _LogoutDialogState();
}

class _LogoutDialogState extends State<LogoutDialog> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 320.setWidth,
        padding: EdgeInsets.fromLTRB(16.setWidth, 20.setHeight, 16.setWidth, 20.setHeight),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).dialogBg,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 25,
              offset: const Offset(0, 10),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomAppColor.of(context).txtRed,
              ),
              padding: EdgeInsets.all(14.setHeight),
              child: UnconstrainedBox(
                  child: Icon(
                Icons.power_settings_new_rounded,
                color: CustomAppColor.of(context).white,
                size: 30,
              )),
            ),
            SizedBox(height: 12.setHeight),
            CommonText(
              text: "Logout",
              fontSize: 20.setFontSize,
              fontWeight: FontWeight.w700,
              textColor: CustomAppColor.of(context).txtBlack,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.setHeight),
            Divider(
              color: CustomAppColor.of(context).txtGray,
              thickness: 1,
            ),
            SizedBox(height: 20.setHeight),
            CommonText(
              text: "Are You Sure You Want To Logout?",
              fontSize: 13.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).txtGray,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 25.setHeight),
            Column(
              children: [
                CommonButton(
                  height: 40.setHeight,
                  text: "Logout",
                  buttonTextColor: CustomAppColor.of(context).white,
                  borderColor: CustomAppColor.of(context).red,
                  gradient: null,
                  buttonColor: CustomAppColor.of(context).red,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 15.setHeight),
                CommonButton(
                  height: 40.setHeight,
                  text: "Cancel",
                  buttonTextColor: CustomAppColor.of(context).txtBlack,
                  borderColor: CustomAppColor.of(context).borderTextFormFeild,
                  gradient: CustomAppColor.of(context).linearGradiant,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
