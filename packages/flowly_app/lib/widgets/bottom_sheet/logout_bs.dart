import 'package:flowly_app/utils/app_color.dart';
import 'package:flowly_app/utils/constant.dart';
import 'package:flowly_app/utils/sizer_utils.dart';
import 'package:flowly_app/widgets/button/common_button.dart';
import 'package:flowly_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

class LogoutBs extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const LogoutBs());
  }

  const LogoutBs({super.key});

  @override
  State<LogoutBs> createState() => _LogoutBsState();
}

class _LogoutBsState extends State<LogoutBs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10.setHeight),
            Center(
              child: Container(
                height: 4.setHeight,
                width: 40.setWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: const Color(0xFFDDDDDD),
                ),
              ),
            ),
            SizedBox(height: 15.setHeight),
            CommonText(
              text: "Delete Account",
              fontSize: 22.setFontSize,
              fontFamily: Constant.fontFamilyMulishBold700,
            ),
            SizedBox(height: 5.setHeight),
            const Divider(thickness: 0.5),
            SizedBox(height: 15.setHeight),
            CommonText(
              text: "Are you sure you want to delete account?",
              fontSize: 15.setFontSize,
              textColor: CustomAppColor.of(context).txtGray,
            ),
            SizedBox(height: 25.setHeight),
            Row(
              children: [
                Expanded(
                  child: CommonButton(
                    onTap: () => Navigator.pop(context),
                    text: "Cancel",
                    buttonColor: CustomAppColor.of(context).btnGrey,
                    borderColor: CustomAppColor.of(context).btnGrey,
                    buttonTextColor: CustomAppColor.of(context).txtGray,
                  ),
                ),
                SizedBox(width: 15.setWidth),
                Expanded(
                  child: CommonButton(
                    onTap: () => Navigator.pop(context),
                    text: "Delete",
                    buttonColor: Colors.red,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
