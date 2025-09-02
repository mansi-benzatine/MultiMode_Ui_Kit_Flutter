import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxi_booking_driver_app_package/utils/sizer_utils.dart';
import 'package:taxi_booking_driver_app_package/widgets/text_field/text_form_field.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import '../../otp_verification/view/otp_verification_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const LoginScreen());
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final defaultCountry = CountryParser.parseCountryCode('US');
    _countryController.text = "${defaultCountry.flagEmoji} +${defaultCountry.phoneCode}";
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: SafeArea(
          top: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 0.screenHeight / 2,
                  width: 0.screenWidth,
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).btnPrimary,
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(80)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20.setHeight),
                      Image.asset(
                        AppAssets.imgAppLogoWithName,
                        width: 120.setWidth,
                        height: 140.setHeight,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 50.setHeight),
                      CommonText(
                        text: Languages.of(context).txtMobileNumber,
                        fontSize: 24.setFontSize,
                        textAlign: TextAlign.center,
                        textColor: CustomAppColor.of(context).white,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(height: 14.setHeight),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                        child: CommonText(
                          text: Languages.of(context).txtPleaseEnterYourPhoneNumberWeWillSendYou4DigitCodeToVerifyYourAccount,
                          fontSize: 13.setFontSize,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                          textColor: CustomAppColor.of(context).txtGreyWhite,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.setHeight),
                _mobileNumberTextField(),
                SizedBox(height: 40.setHeight),
                InkWell(
                  onTap: () {
                    Navigator.push(context, OtpVerificationScreen.route());
                  },
                  child: Image.asset(
                    AppAssets.icGoToNext,
                    width: 60.setHeight,
                    height: 60.setHeight,
                  ),
                ),
                SizedBox(height: 50.setHeight),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25.setWidth),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(fontSize: 12.setFontSize, fontWeight: FontWeight.w500, color: CustomAppColor.of(context).txtGray, height: 1.7),
                      children: [
                        TextSpan(text: "${Languages.of(context).txtByContinuingYouAgreeToOur} "),
                        TextSpan(
                          text: Languages.of(context).txtTermsOfService,
                          style: TextStyle(
                            color: CustomAppColor.of(context).txtPrimary,
                            decoration: TextDecoration.underline,
                            decorationColor: CustomAppColor.of(context).txtPrimary,
                            decorationThickness: 2,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.setFontSize,
                          ),
                        ),
                        TextSpan(text: " ${Languages.of(context).txtAnd} "),
                        TextSpan(
                          text: "${Languages.of(context).txtPrivacyPolicy}.",
                          style: TextStyle(
                            color: CustomAppColor.of(context).txtPrimary,
                            decoration: TextDecoration.underline,
                            decorationColor: CustomAppColor.of(context).txtPrimary,
                            decorationThickness: 2,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.setFontSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.setHeight),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _mobileNumberTextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CommonTextFormField(
              controller: _countryController,
              hintText: Languages.of(context).txtCountry,
              titleText: Languages.of(context).txtCountry,
              keyboardType: TextInputType.text,
              readOnly: true,
              onTap: () {
                showCountryPicker(
                  context: context,
                  showPhoneCode: true,
                  useSafeArea: true,
                  onSelect: (Country country) {
                    _countryController.text = "${country.flagEmoji} +${country.phoneCode}";
                  },
                );
              },
            ),
          ),
          SizedBox(width: 10.setWidth),
          Expanded(
            flex: 2,
            child: CommonTextFormField(
              controller: _phoneNumberController,
              hintText: Languages.of(context).txtPhoneNumber,
              titleText: Languages.of(context).txtPhoneNumber,
              keyboardType: TextInputType.phone,
            ),
          ),
        ],
      ),
    );
  }
}
