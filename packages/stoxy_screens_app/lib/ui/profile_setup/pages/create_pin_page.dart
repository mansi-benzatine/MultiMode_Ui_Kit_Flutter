import 'package:flutter/cupertino.dart';
import 'package:stoxy_screens_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
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
      padding: EdgeInsets.only(bottom: 100.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.setHeight),

          // Title
          CommonText(
            text: Languages.of(context).txtCreateNewPin,
            fontSize: 28.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
            maxLines: 2,
          ),

          SizedBox(height: 10.setHeight),

          // Subtitle
          CommonText(
            text: Languages.of(context).txtLoremIpsumShort,
            fontSize: 13.setFontSize,
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtDescriptionGray,
            textAlign: TextAlign.start,
            maxLines: 2,
          ),
          SizedBox(height: 10.setHeight),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30.setWidth, vertical: 25.setHeight),
            child: OTPTextField(
              context: context,
              length: 4,
              width: 0.screenWidth - 40.setWidth,
              fieldWidth: 60.setWidth,
              fieldHeight: 60.setHeight,
              outlineBorderRadius: 1000,
              fieldStyle: FieldStyle.box,
              style: TextStyle(
                fontSize: 24.setFontSize,
                fontWeight: FontWeight.w600,
                color: CustomAppColor.of(context).txtBlack,
                fontFamily: Constant.fontFamily,
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
        ],
      ),
    );
  }
}
