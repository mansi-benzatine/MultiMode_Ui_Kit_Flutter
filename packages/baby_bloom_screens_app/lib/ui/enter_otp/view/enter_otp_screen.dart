import 'package:baby_bloom_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_screens_app/ui/reset_password/view/reset_password_screen.dart';
import 'package:baby_bloom_screens_app/utils/app_assets.dart';
import 'package:baby_bloom_screens_app/utils/app_color.dart';
import 'package:baby_bloom_screens_app/utils/constant.dart';
import 'package:baby_bloom_screens_app/utils/sizer_utils.dart';
import 'package:baby_bloom_screens_app/widgets/otp_field/otp_field.dart';
import 'package:baby_bloom_screens_app/widgets/otp_field/otp_field_style.dart';
import 'package:baby_bloom_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';

class EnterOtpScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EnterOtpScreen());
  }

  const EnterOtpScreen({super.key});

  @override
  State<EnterOtpScreen> createState() => _EnterOtpScreenState();
}

class _EnterOtpScreenState extends State<EnterOtpScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(AppAssets.imgBackground),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBar(
                this,
                title: "",
                isShowBack: true,
                appBarColor: CustomAppColor.of(context).transparent,
              ),
              SizedBox(height: 80.setHeight),
              _formFieldsView(),
            ],
          )
        ],
      ),
    );
  }

  Widget _formFieldsView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtEnterOtp,
            fontSize: 30.setFontSize,
            fontFamily: Constant.fontFamilySemiBold600,
          ),
          SizedBox(height: 14.setHeight),
          CommonText(
            text: Languages.of(context).txtEnterOtpDesc,
            fontSize: 14.setFontSize,
            fontFamily: Constant.fontFamilyRegular400,
            textColor: CustomAppColor.of(context).txtLightGrey,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 40.setHeight),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.setWidth),
            child: OTPTextField(
              context: context,
              length: 4,
              width: 0.screenWidth - 40.setWidth,
              fieldWidth: 60.setWidth,
              fieldHeight: 60.setHeight,
              outlineBorderRadius: 100,
              fieldStyle: FieldStyle.box,
              style: TextStyle(
                fontSize: 28.setFontSize,
                color: CustomAppColor.of(context).txtPrimary,
                fontFamily: Constant.fontFamilyBlack900,
                fontWeight: FontWeight.bold,
              ),
              textFieldAlignment: MainAxisAlignment.spaceBetween,
              otpFieldStyle: OtpFieldStyle(
                backgroundColor: CustomAppColor.of(context).bgScreen,
                borderColor: CustomAppColor.of(context).txtGray,
                focusBorderColor: CustomAppColor.of(context).primary,
                enabledBorderColor: CustomAppColor.of(context).txtGray,
                disabledBorderColor: CustomAppColor.of(context).primary,
                errorBorderColor: CustomAppColor.of(context).txtRed,
              ),
              onChanged: (value) {},
              onCompleted: (value) {},
            ),
          ),
          SizedBox(height: 15.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonText(
                text: Languages.of(context).txtResendCodeIn,
                textColor: CustomAppColor.of(context).txtGray,
                fontSize: 14.setFontSize,
              ),
              SizedBox(width: 5.setWidth),
              CommonText(
                text: "33 seconds",
                textColor: CustomAppColor.of(context).secondary,
                fontSize: 14.setFontSize,
              ),
            ],
          ),
          SizedBox(height: 30.setHeight),
          IgnorePointer(
            ignoring: true,
            child: CommonButton(
              text: Languages.of(context).txtContinue,
              onTap: () {
                Navigator.push(context, ResetPasswordScreen.route());
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
