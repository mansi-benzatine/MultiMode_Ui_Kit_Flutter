import 'package:flutter/material.dart';
import 'package:furniture_app_package/ui/reset_password/view/reset_password_screen.dart';
import 'package:furniture_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/otp_field/otp_field.dart';
import '../../../widgets/otp_field/otp_field_style.dart';
import '../../../widgets/text/common_text.dart';

class EnterOtpScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EnterOtpScreen());
  }

  const EnterOtpScreen({super.key});

  @override
  State<EnterOtpScreen> createState() => _EnterOtpScreenState();
}

class _EnterOtpScreenState extends State<EnterOtpScreen> {
  final TextEditingController emailAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Image.asset(
              AppAssets.imgBg,
              height: 280.setHeight,
              width: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
            ),
            Padding(
              padding: EdgeInsets.only(top: 240.setHeight),
              child: Container(
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).bgScreen,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 20.setHeight),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormView(
                        emailAddressController: emailAddressController,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50.setHeight,
              left: 22.setWidth,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Image.asset(
                  AppAssets.icArrowRight,
                  width: 25.setWidth,
                  height: 25.setHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FormView extends StatefulWidget {
  TextEditingController emailAddressController = TextEditingController();

  ValueNotifier<bool> isPasswordVisible = ValueNotifier(true);
  FormView({
    super.key,
    required this.emailAddressController,
  });

  @override
  State<FormView> createState() => FormViewState();
}

class FormViewState extends State<FormView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.setHeight),
        CommonText(
          text: Languages.of(context).txtEnterOtp,
          fontFamily: Constant.fontFamilyBold700,
          fontSize: 30.setFontSize,
        ),
        SizedBox(height: 12.setHeight),
        CommonText(
          text: Languages.of(context).txtPleaseEnterThe4DigitCodeSentToYourEmailAddress,
          fontFamily: Constant.fontFamilyMedium500,
          fontSize: 16.setFontSize,
          textAlign: TextAlign.start,
          textColor: CustomAppColor.of(context).txtGray,
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
        SizedBox(height: 30.setHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonText(
              text: Languages.of(context).txtResendCodeIn,
              fontFamily: Constant.fontFamilyMedium500,
              textColor: CustomAppColor.of(context).txtGray,
              fontSize: 16.setFontSize,
            ),
            SizedBox(width: 5.setWidth),
            CommonText(
              text: "45 s",
              fontFamily: Constant.fontFamilyBold700,
              textColor: CustomAppColor.of(context).txtOrange,
              fontSize: 16.setFontSize,
            ),
          ],
        ),
        SizedBox(height: 40.setHeight),
        CommonButton(
          text: Languages.of(context).txtContinue,
          onTap: () => Navigator.push(context, ResetPasswordScreen.route()),
        ),
      ],
    );
  }
}
