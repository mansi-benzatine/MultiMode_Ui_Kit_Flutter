import 'package:bitx_app/utils/constant.dart';
import 'package:bitx_app/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/otp_field/otp_field.dart';
import '../../../widgets/otp_field/otp_field_style.dart';
import '../../../widgets/text/common_text.dart';

class CreatePinPage extends StatefulWidget {
  const CreatePinPage({super.key});

  @override
  State<CreatePinPage> createState() => _CreatePinPageState();
}

class _CreatePinPageState extends State<CreatePinPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 100.setHeight, right: 20.setWidth, left: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.setHeight),
          CommonText(
            text: Languages.of(context).txtCreateNewPin.toUpperCase(),
            fontSize: 28.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
            maxLines: 2,
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: Languages.of(context).txtLoremIpsumShort,
            fontSize: 13.setFontSize,
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtDescriptionGray,
            textAlign: TextAlign.start,
            maxLines: 2,
          ),
          SizedBox(height: 25.setHeight),
          Align(
            alignment: Alignment.center,
            child: CommonText(
              text: Languages.of(context).txtEnterYourOtp,
              fontSize: 14.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).txtBlack,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 25.setHeight),
            child: OTPTextField(
              context: context,
              length: 4,
              width: 0.screenWidth - 40.setWidth,
              fieldWidth: 64.setWidth,
              fieldHeight: 56.setHeight,
              outlineBorderRadius: 12,
              fieldStyle: FieldStyle.box,
              style: TextStyle(
                fontSize: 24.setFontSize,
                fontWeight: FontWeight.w600,
                color: CustomAppColor.of(context).txtBlack,
                height: 1,
              ),
              textFieldAlignment: MainAxisAlignment.spaceBetween,
              otpFieldStyle: OtpFieldStyle(
                backgroundColor: CustomAppColor.of(context).bgScreen,
                borderColor: CustomAppColor.of(context).primary,
                focusBorderColor: CustomAppColor.of(context).primary,
                enabledBorderColor: CustomAppColor.of(context).txtGray,
                disabledBorderColor: CustomAppColor.of(context).txtGray,
                errorBorderColor: CustomAppColor.of(context).txtRed,
                filledBorderColor: CustomAppColor.of(context).primary,
              ),
              onChanged: (value) {
                // _otpValue.value = value;
              },
              onCompleted: (value) {
                // _otpValue.value = value;
              },
            ),
          ),
          InkWell(
            onTap: () {},
            child: Align(
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: Languages.of(context).txtResendOtp,
                      style: TextStyle(
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w600,
                        color: CustomAppColor.of(context).txtBlack,
                        fontFamily: Constant.fontFamily,
                        package: "bitx_app",
                      ),
                    ),
                    WidgetSpan(child: SizedBox(width: 5.setWidth)),
                    TextSpan(
                      text: "45 sec",
                      style: TextStyle(
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w700,
                        color: CustomAppColor.of(context).primary,
                        fontFamily: Constant.fontFamily,
                        package: "bitx_app",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
