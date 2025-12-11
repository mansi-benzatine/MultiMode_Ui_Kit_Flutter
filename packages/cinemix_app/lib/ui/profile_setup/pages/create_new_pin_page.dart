import 'package:cinemix_app/localization/language/languages.dart';
import 'package:cinemix_app/utils/app_color.dart';
import 'package:cinemix_app/utils/sizer_utils.dart';
import 'package:cinemix_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../../../utils/constant.dart';
import '../../../widgets/otp_field/otp_field.dart';
import '../../../widgets/otp_field/otp_field_style.dart';

class CreateNewPinPage extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const CreateNewPinPage());
  }

  const CreateNewPinPage({super.key});

  @override
  State<CreateNewPinPage> createState() => _CreateNewPinPageState();
}

class _CreateNewPinPageState extends State<CreateNewPinPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtCreateNewPinDesc,
            textColor: CustomAppColor.of(context).txtGray,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 30.setHeight),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.setWidth),
            child: OTPTextField(
              context: context,
              length: 4,
              width: 0.screenWidth - 40.setWidth,
              fieldWidth: 60.setWidth,
              fieldHeight: 60.setHeight,
              outlineBorderRadius: 16,
              fieldStyle: FieldStyle.box,
              style: TextStyle(
                fontSize: 28.setFontSize,
                color: CustomAppColor.of(context).txtPrimary,
                fontFamily: Constant.fontFamilyClashDisplayBold700,
                fontWeight: FontWeight.bold,
              ),
              textFieldAlignment: MainAxisAlignment.spaceBetween,
              otpFieldStyle: OtpFieldStyle(
                backgroundColor: CustomAppColor.of(context).bgTextFormFieldShadow,
                borderColor: CustomAppColor.of(context).grey,
                focusBorderColor: CustomAppColor.of(context).borderOtp,
                enabledBorderColor: CustomAppColor.of(context).borderOtp,
                disabledBorderColor: CustomAppColor.of(context).borderOtp,
                errorBorderColor: CustomAppColor.of(context).txtRed,
              ),
              onChanged: (value) {},
              onCompleted: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
