import 'package:flutter/material.dart';
import 'package:mantra_yoga_app_package/utils/sizer_utils.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../../widgets/top_bar/topbar.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) => const ResetPasswordScreen());
  }

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> implements TopBarClickListener {
  ValueNotifier<bool> isPasswordVisible = ValueNotifier(true);
  ValueNotifier<bool> isConfirmPasswordVisible = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: "",
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 30.setHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: Languages.of(context).txtResetPassword,
                    fontSize: 30.setFontSize,
                    fontWeight: FontWeight.w700,
                    fontFamily: Constant.fontFamilyBold700,
                    textColor: CustomAppColor.of(context).txtBlack,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 8.setHeight),
                  CommonText(
                    text: Languages.of(context).txtLoremIpsum,
                    fontSize: 12.setFontSize,
                    fontWeight: FontWeight.w400,
                    fontFamily: Constant.fontFamilyRegular400,
                    textColor: CustomAppColor.of(context).txtBlack,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 50.setHeight),
                  ValueListenableBuilder(
                    valueListenable: isPasswordVisible,
                    builder: (context, value, child) {
                      return CommonTextFormFieldWithPrefixAndSuffix(
                        controller: TextEditingController(),
                        hintText: Languages.of(context).txtNewPassword,
                        prefixIcon: AppAssets.icPassword,
                        obscureText: value,
                        suffixIcon: value ? AppAssets.icPassEnable : AppAssets.icPassDisable,
                        onSuffixClick: () {
                          isPasswordVisible.value = !isPasswordVisible.value;
                        },
                      );
                    },
                  ),
                  SizedBox(height: 15.setHeight),
                  ValueListenableBuilder(
                    valueListenable: isConfirmPasswordVisible,
                    builder: (context, value, child) {
                      return CommonTextFormFieldWithPrefixAndSuffix(
                        controller: TextEditingController(),
                        hintText: Languages.of(context).txtConfirmPassword,
                        prefixIcon: AppAssets.icPassword,
                        obscureText: value,
                        suffixIcon: value ? AppAssets.icPassEnable : AppAssets.icPassDisable,
                        onSuffixClick: () {
                          isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
                        },
                      );
                    },
                  ),
                  SizedBox(height: 30.setHeight),
                  CommonButton(
                    text: Languages.of(context).txtContinue,
                    onTap: () {},
                    buttonColor: CustomAppColor.of(context).primary,
                    borderColor: CustomAppColor.of(context).borderColor,
                    borderWidth: 3,
                    height: 45.setHeight,
                    radius: 18,
                  ),
                ],
              ),
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
