import 'package:flutter/material.dart';
import 'package:goozzy_e_commerce_app_package/utils/utils.dart';

import '../../../../../ui/verify_code/view/verify_code_screen.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/string_constant.dart';
import '../../../../../widgets/textfield/common_textformfield.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../create_new_password/view/create_new_password_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (context) => const ForgotPasswordScreen());
  }

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool isEmailSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(24)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: AppSizes.setHeight(61)),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    AppAssets.icLeftArrow,
                    width: AppSizes.setWidth(20),
                    height: AppSizes.setHeight(20),
                  ),
                ),
              ),
              Image.asset(
                AppAssets.imgAppLogo,
                width: AppSizes.setWidth(80),
                height: AppSizes.setHeight(80),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(15)),
                child: CommonText(
                  text: Languages.of(context).forgotPassword,
                  fontWeight: FontWeight.w700,
                  fontSize: AppSizes.setFontSize(24),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: AppSizes.setHeight(12), left: AppSizes.setWidth(12), right: AppSizes.setWidth(12)),
                child: CommonText(
                  text: Languages.of(context).enterYourEmailOrPhone,
                  textColor: CustomAppColor.of(context).txtGrey,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(12), horizontal: AppSizes.setWidth(80)),
                child: Image.asset(
                  AppAssets.imgForgotPassword,
                  height: AppSizes.setHeight(195),
                  width: AppSizes.setWidth(200),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: AppSizes.setHeight(32)),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(8)),
                  width: AppSizes.setWidth(281),
                  height: AppSizes.setHeight(48),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).btnPurple.withOpacityPercent(0.1),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isEmailSelected = true;
                            });
                          },
                          child: Container(
                            width: AppSizes.setWidth(134),
                            height: AppSizes.setHeight(36),
                            decoration: BoxDecoration(
                              color: isEmailSelected ? CustomAppColor.of(context).btnPurple : CustomAppColor.of(context).transparent,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            alignment: Alignment.center,
                            child: CommonText(
                              text: Languages.of(context).eMail,
                              textColor: isEmailSelected ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtPurple,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isEmailSelected = false;
                            });
                          },
                          child: Container(
                            width: AppSizes.setWidth(134),
                            height: AppSizes.setHeight(36),
                            decoration: BoxDecoration(
                              color: !isEmailSelected ? CustomAppColor.of(context).btnPurple : CustomAppColor.of(context).transparent,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            alignment: Alignment.center,
                            child: CommonText(
                              text: Languages.of(context).mobileNumber,
                              textColor: isEmailSelected ? CustomAppColor.of(context).txtPurple : CustomAppColor.of(context).white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (isEmailSelected)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(30)),
                  child: CommonTextFormField(
                    borderColor: CustomAppColor.of(context).textFieldBorder,
                    leadingIcon: Image.asset(
                      AppAssets.icMail,
                      width: AppSizes.setHeight(20),
                      height: AppSizes.setHeight(20),
                    ),
                    hintText: Languages.of(context).eMail,
                  ),
                ),
              if (!isEmailSelected)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(30)),
                  child: CommonTextFormField(
                    isPhoneNumberField: true,
                    borderColor: CustomAppColor.of(context).textFieldBorder,
                    hintText: AppStrings.phoneNumber,
                  ),
                ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(20)),
                child: CommonButton(
                  onTap: () {
                    if (isEmailSelected) {
                      Navigator.push(context, CreateNewPasswordScreen.route());
                    } else {
                      Navigator.push(context, VerifyCodeScreen.route());
                    }
                  },
                  btnText: Languages.of(context).sendCode,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
