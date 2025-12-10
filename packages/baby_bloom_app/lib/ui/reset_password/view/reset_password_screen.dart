import 'package:baby_bloom_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_app/utils/sizer_utils.dart';
import 'package:baby_bloom_app/widgets/alert_dialog/reset_password_success_dialog.dart';
import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../../widgets/top_bar/topbar.dart';

class ResetPasswordScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
  }

  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> implements TopBarClickListener {
  final TextEditingController passwordController = TextEditingController();
  ValueNotifier<bool> isPasswordVisible = ValueNotifier(true);

  final TextEditingController newPasswordController = TextEditingController();
  ValueNotifier<bool> isNewPasswordVisible = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            AppAssets.imgBackground,
          ),
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

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }

  Widget _formFieldsView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtResetPassword,
            fontSize: 30.setFontSize,
            fontFamily: Constant.fontFamilySemiBold600,
          ),
          SizedBox(height: 14.setHeight),
          CommonText(
            text: Languages.of(context).txtResetPasswordDesc,
            fontSize: 14.setFontSize,
            fontFamily: Constant.fontFamilyRegular400,
            textColor: CustomAppColor.of(context).txtLightGrey,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 40.setHeight),
          ValueListenableBuilder(
            valueListenable: isPasswordVisible,
            builder: (context, value, child) {
              return CommonTextFormFieldWithPrefixAndSuffix(
                controller: passwordController,
                hintText: Languages.of(context).txtEnterYourNewPassword,
                titleText: Languages.of(context).txtNewPassword,
                prefixIcon: AppAssets.icLock,
                prefixIconColor: CustomAppColor.of(context).icGray,
                suffixIconColor: CustomAppColor.of(context).icGray,
                obscureText: value,
                suffixIcon: value ? AppAssets.icEyeSlash : AppAssets.icEye,
                onSuffixClick: () {
                  isPasswordVisible.value = !isPasswordVisible.value;
                },
              );
            },
          ),
          SizedBox(height: 24.setHeight),
          ValueListenableBuilder(
            valueListenable: isPasswordVisible,
            builder: (context, value, child) {
              return CommonTextFormFieldWithPrefixAndSuffix(
                controller: newPasswordController,
                hintText: Languages.of(context).txtConfirmNewPassword,
                titleText: Languages.of(context).txtConfirmPassword,
                prefixIcon: AppAssets.icLock,
                prefixIconColor: CustomAppColor.of(context).icGray,
                suffixIconColor: CustomAppColor.of(context).icGray,
                obscureText: value,
                suffixIcon: value ? AppAssets.icEyeSlash : AppAssets.icEye,
                onSuffixClick: () {
                  isNewPasswordVisible.value = !isNewPasswordVisible.value;
                },
              );
            },
          ),
          SizedBox(height: 24.setHeight),
          CommonButton(
            text: Languages.of(context).txtResetPassword,
            onTap: () {
              showDialog(
                context: context,
                builder: (dialogContext) {
                  return ResetPasswordSuccessDialog(parentContext: context);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
