import 'package:flutter/material.dart';
import 'package:mivi_app/localization/language/languages.dart';
import 'package:mivi_app/ui/reset_password/view/reset_password_screen.dart';
import 'package:mivi_app/utils/app_assets.dart';
import 'package:mivi_app/utils/app_color.dart';
import 'package:mivi_app/utils/constant.dart';
import 'package:mivi_app/utils/sizer_utils.dart';
import 'package:mivi_app/widgets/otp_field/otp_field.dart';
import 'package:mivi_app/widgets/otp_field/otp_field_style.dart';
import 'package:mivi_app/widgets/text/common_text.dart';

import '../../../widgets/button/common_button.dart';

class EnterOtpScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EnterOtpScreen());
  }

  const EnterOtpScreen({super.key});

  @override
  State<EnterOtpScreen> createState() => _EnterOtpScreenState();
}

class _EnterOtpScreenState extends State<EnterOtpScreen> {
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            AppAssets.imgWhiteBg,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 92.setHeight),
                Image.asset(
                  AppAssets.icAppIcon,
                  height: 57.setHeight,
                  width: 65.setWidth,
                ),
                SizedBox(height: 40.setHeight),
                CommonText(
                  text: Languages.of(context).txtEnterOtp,
                  fontFamily: Constant.fontFamilyBold700,
                  fontSize: 30.setFontSize,
                ),
                SizedBox(height: 20.setHeight),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.setWidth),
                  child: OTPTextField(
                    context: context,
                    length: 4,
                    width: 0.screenWidth - 40.setWidth,
                    fieldWidth: 60.setWidth,
                    fieldHeight: 60.setHeight,
                    outlineBorderRadius: 12,
                    fieldStyle: FieldStyle.box,
                    style: TextStyle(
                      fontSize: 28.setFontSize,
                      color: CustomAppColor.of(context).txtPrimary,
                      fontFamily: Constant.fontFamilyBlack900,
                      fontWeight: FontWeight.bold,
                    ),
                    textFieldAlignment: MainAxisAlignment.spaceBetween,
                    otpFieldStyle: OtpFieldStyle(
                      backgroundColor: CustomAppColor.of(context).bgTextFormField,
                      borderColor: CustomAppColor.of(context).txtLightGrey,
                      focusBorderColor: CustomAppColor.of(context).txtLightGrey,
                      enabledBorderColor: CustomAppColor.of(context).txtLightGrey,
                      disabledBorderColor: CustomAppColor.of(context).txtLightGrey,
                      errorBorderColor: CustomAppColor.of(context).txtRed,
                    ),
                    onChanged: (value) {},
                    onCompleted: (value) {},
                  ),
                ),
                SizedBox(height: 20.setHeight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonText(
                      text: Languages.of(context).txtResendCodeIn,
                      textColor: CustomAppColor.of(context).txtLightGrey,
                      fontSize: 12.setFontSize,
                    ),
                    SizedBox(width: 5.setWidth),
                    CommonText(
                      text: "23s",
                      fontSize: 12.setFontSize,
                      fontFamily: Constant.fontFamilySemiBold600,
                    ),
                  ],
                ),
                SizedBox(height: 50.setHeight),
                CommonButton(
                  text: Languages.of(context).txtContinue,
                  onTap: () {
                    Navigator.push(context, ResetPasswordScreen.route());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
