import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:musify_app_package/ui/verify_otp/view/verify_otp_screen.dart';
import 'package:musify_app_package/utils/constant.dart';
import 'package:musify_app_package/utils/sizer_utils.dart';
import 'package:musify_app_package/widgets/button/common_button.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../../widgets/top_bar/topbar.dart';

class SignInPhoneNumberScreen extends StatefulWidget {
  const SignInPhoneNumberScreen({super.key});

  @override
  State<SignInPhoneNumberScreen> createState() => _SignInPhoneNumberScreenState();
}

class _SignInPhoneNumberScreenState extends State<SignInPhoneNumberScreen> implements TopBarClickListener {
  TextEditingController phoneNumberController = TextEditingController(text: "12345 67890");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.imgCommonBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              TopBar(
                this,
                title: "",
                isShowBack: true,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, bottom: 20.setHeight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.setHeight),
                      CommonText(
                        text: Languages.of(context).txtEnterPhoneNumber.toUpperCase(),
                        textAlign: TextAlign.start,
                        fontSize: 28.setFontSize,
                        fontWeight: FontWeight.w700,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                      SizedBox(height: 5.setHeight),
                      CommonText(
                        text: Languages.of(context).txtLoremIpsumShort,
                        textAlign: TextAlign.start,
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                        maxLines: 3,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                      SizedBox(height: 40.setHeight),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  bottom: 6.setHeight,
                                  left: 5.setWidth,
                                ),
                                child: CommonText(
                                  text: Languages.of(context).txtCountry,
                                  fontSize: 15.setFontSize,
                                  fontWeight: FontWeight.w600,
                                  textColor: CustomAppColor.of(context).txtBlack,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: CustomAppColor.of(context).borderTextFormFeild, width: 0.5),
                                  borderRadius: BorderRadius.circular(1000.setWidth),
                                ),
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(left: 8.setWidth, right: 12.setWidth, top: 1.setHeight, bottom: 1.setHeight),
                                child: Row(
                                  children: [
                                    CountryCodePicker(
                                      initialSelection: 'US',
                                      showCountryOnly: true,
                                      showOnlyCountryWhenClosed: true,
                                      showFlag: true,
                                      showFlagDialog: true,
                                      showFlagMain: true,
                                      flagWidth: 30.setWidth,
                                      margin: EdgeInsets.zero,
                                      showDropDownButton: false,
                                      padding: EdgeInsets.zero,
                                      /*  builder: (country) {
                                      return CommonTextFormField(
                                        controller: TextEditingController(text: country?.flagUri),
                                        hintText: Languages.of(context).txtCountryCode,
                                        labelText: Languages.of(context).txtCountryCode.toUpperCase(),
                                        readOnly: true,
                                      );
                                    }, */
                                      hideMainText: true,
                                      hideSearch: true,
                                      hideCloseIcon: true,
                                    ),
                                    Transform.rotate(
                                      angle: 3.14159 + 1.5708, // 90 degrees in radians
                                      child: Icon(Icons.arrow_back_ios_new_rounded, size: 15.setHeight, color: CustomAppColor.of(context).txtBlack),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10.setWidth),
                          Expanded(
                            child: CommonTextFormField(
                              controller: phoneNumberController,
                              hintText: Languages.of(context).txtEnterPhoneNumber,
                              titleText: Languages.of(context).txtPhoneNumber,
                              prefixIcon: AppAssets.icPhone,
                            ),
                          ),
                        ],
                      ),
                      CommonButton(
                        text: Languages.of(context).txtContinue,
                        mTop: 25.setHeight,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const VerifyOtpScreen(isFromSignIn: true),
                              ));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
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
