import 'package:flutter/material.dart';
import 'package:job_finder_app_package_for_main/utils/utils.dart';

import '../../../../../../localization/language/languages.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/constant.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/top_bar/topbar.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../utils/app_assets.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text_field/text_form_field.dart';

class UpdatePasswordScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const UpdatePasswordScreen());
  }

  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> implements TopBarClickListener {
  ValueNotifier<bool> isShowPass = ValueNotifier<bool>(true);
  ValueNotifier<bool> isShowConfirmPass = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      body: Column(
        children: [
          TopBar(
            this,
            isShowTitle: true,
            title: Languages.of(context).txtUpdatePassword,
            isShowBack: true,
            textColor: CustomAppColor.of(context).txtSecondaryWhite,
            iconColor: CustomAppColor.of(context).bgDetailsCard,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: InputFieldsView(
                isShowPass: isShowPass,
                isShowConfirmPass: isShowConfirmPass,
              ),
            ),
          ),
          _ContinueButtonView(
            buttonText: Languages.of(context).txtUpdateNow,
            onTap: () {},
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
}

class InputFieldsView extends StatelessWidget {
  final ValueNotifier<bool> isShowPass;
  final ValueNotifier<bool> isShowConfirmPass;
  const InputFieldsView({super.key, required this.isShowPass, required this.isShowConfirmPass});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 22.setWidth, right: 22.setWidth, top: 20.setHeight),
      child: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: isShowConfirmPass,
            builder: (context, value, widget) {
              return CommonTextFormFieldWithPrefixAndSuffix(
                controller: TextEditingController(),
                hintText: Languages.of(context).txtEnterOldPassword,
                prefixIcon: AppAssets.icPass,
                obscureText: value,
                suffixIcon: value ? AppAssets.icShowPass : AppAssets.icHidePass,
                onSuffixClick: () {
                  isShowConfirmPass.value = !isShowConfirmPass.value;
                },
              );
            },
          ),
          SizedBox(height: 15.setHeight),
          ValueListenableBuilder(
            valueListenable: isShowConfirmPass,
            builder: (context, value, widget) {
              return CommonTextFormFieldWithPrefixAndSuffix(
                controller: TextEditingController(),
                hintText: Languages.of(context).txtEnterNewPassword,
                prefixIcon: AppAssets.icPass,
                obscureText: value,
                suffixIcon: value ? AppAssets.icShowPass : AppAssets.icHidePass,
                onSuffixClick: () {
                  isShowConfirmPass.value = !isShowConfirmPass.value;
                },
              );
            },
          ),
          SizedBox(height: 15.setHeight),
          ValueListenableBuilder(
            valueListenable: isShowConfirmPass,
            builder: (context, value, widget) {
              return CommonTextFormFieldWithPrefixAndSuffix(
                controller: TextEditingController(),
                hintText: Languages.of(context).txtEnterConfirmNewPassword,
                prefixIcon: AppAssets.icPass,
                obscureText: value,
                suffixIcon: value ? AppAssets.icHidePass : AppAssets.icShowPass,
                onSuffixClick: () {
                  isShowConfirmPass.value = !isShowConfirmPass.value;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ContinueButtonView extends StatelessWidget {
  final String buttonText;
  final Function() onTap;
  const _ContinueButtonView({required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgNavBarWhiteSecondary,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 20,
            spreadRadius: 0,
            color: CustomAppColor.of(context).black.withOpacityPercent(.08),
          ),
        ],
      ),
      padding: EdgeInsets.only(left: 25.setWidth, right: 25.setWidth, bottom: 10.setHeight, top: 15.setHeight),
      child: SafeArea(
        top: false,
        child: CommonButton(
          onTap: onTap,
          text: buttonText,
          buttonTextSize: 18.setFontSize,
          buttonTextWeight: FontWeight.w500,
          buttonTextColor: CustomAppColor.of(context).white,
          buttonColor: CustomAppColor.of(context).txtSecondary,
        ),
      ),
    );
  }
}
