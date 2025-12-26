import 'package:bitx_screens_app/widgets/button/common_button.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/text/common_text.dart';
import '../../utils/app_color.dart';
import '../../utils/sizer_utils.dart';

class DeleteAccountDialog extends StatefulWidget {
  const DeleteAccountDialog({
    super.key,
  });

  @override
  State<DeleteAccountDialog> createState() => _DeleteAccountDialogState();
}

class _DeleteAccountDialogState extends State<DeleteAccountDialog> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
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
              padding: EdgeInsets.all(12.setHeight),
              child: UnconstrainedBox(
                child: Icon(
                  Icons.delete_outline_rounded,
                  color: CustomAppColor.of(context).white,
                  size: 28,
                ),
              ),
            ),
            SizedBox(height: 12.setHeight),
            CommonText(
              text: "Delete Account",
              fontSize: 20.setFontSize,
              fontWeight: FontWeight.w700,
              textColor: CustomAppColor.of(context).txtBlack,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5.setHeight),
            Divider(
              color: CustomAppColor.of(context).txtGray,
              thickness: 1,
            ),
            SizedBox(height: 10.setHeight),
            CommonText(
              text: "Are You Sure Want To Delete Account?",
              fontSize: 13.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).txtGray,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 25.setHeight),
            Column(
              children: [
                IgnorePointer(
                  ignoring: true,
                  child: CommonButton(
                    height: 40.setHeight,
                    text: 'Delete Account',
                    buttonTextSize: 14.setFontSize,
                    buttonTextColor: CustomAppColor.of(context).white,
                    borderColor: CustomAppColor.of(context).red,
                    gradient: null,
                    buttonColor: CustomAppColor.of(context).red,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(height: 10.setHeight),
                IgnorePointer(
                  ignoring: true,
                  child: CommonButton(
                    height: 40.setHeight,
                    text: "Cancel",
                    gradient: CustomAppColor.of(context).linearGradiant,
                    buttonTextColor: CustomAppColor.of(context).txtBlack,
                    borderColor: CustomAppColor.of(context).borderTextFormFeild,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
