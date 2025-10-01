import 'package:flutter/material.dart';
import 'package:stoxy_screens_app_package/widgets/button/common_button.dart';

import '../../../../../widgets/text/common_text.dart';
import '../../utils/app_assets.dart';
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
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: EdgeInsets.only(top: 40.setHeight),
            child: Container(
              width: 320.setWidth,
              padding: EdgeInsets.fromLTRB(16.setWidth, 45.setHeight, 16.setWidth, 20.setHeight),
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).txtWhite,
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
                  CommonText(
                    text: "Delete Account",
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
                    text: "Are You Sure Want to Delete Account?",
                    fontSize: 13.setFontSize,
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).txtBlack,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 25.setHeight),
                  IgnorePointer(
                    ignoring: true,
                    child: Row(
                      children: [
                        Expanded(
                          child: CommonButton(
                            height: 40.setHeight,
                            text: "Cancel",
                            buttonTextSize: 14.setFontSize,
                            buttonTextColor: CustomAppColor.of(context).txtGray,
                            borderColor: CustomAppColor.of(context).txtGray,
                            gradient: null,
                            buttonColor: CustomAppColor.of(context).bgScreen,
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        SizedBox(width: 10.setWidth),
                        Expanded(
                          child: CommonButton(
                            height: 40.setHeight,
                            text: "Delete Account",
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: 72.setWidth,
              height: 72.setHeight,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomAppColor.of(context).txtRed,
              ),
              child: UnconstrainedBox(
                child: Image.asset(
                  AppAssets.icLogout,
                  width: 32.setWidth,
                  height: 32.setHeight,
                  color: CustomAppColor.of(context).txtWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
