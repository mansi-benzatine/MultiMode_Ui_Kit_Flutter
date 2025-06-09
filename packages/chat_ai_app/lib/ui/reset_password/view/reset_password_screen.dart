import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/alert_dialog/common_alert_dialog.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../create_profile/view/create_profile_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ResetPasswordScreen());
  }

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController = TextEditingController();

  ValueNotifier<bool> isPasswordVisible = ValueNotifier<bool>(false);
  ValueNotifier<bool> isConfirmPasswordVisible = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 10.setHeight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.setHeight),
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Image.asset(
                    AppAssets.icBack,
                    width: 24.setHeight,
                    height: 24.setHeight,
                    gaplessPlayback: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.setHeight),
                child: _ForgotPasswordView(
                  newPasswordController: _newPasswordController,
                  confirmNewPasswordController: _confirmNewPasswordController,
                  isPasswordVisible: isPasswordVisible,
                  isConfirmPasswordVisible: isConfirmPasswordVisible,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ForgotPasswordView extends StatelessWidget {
  final TextEditingController newPasswordController;
  final TextEditingController confirmNewPasswordController;

  final ValueNotifier<bool> isPasswordVisible;
  final ValueNotifier<bool> isConfirmPasswordVisible;

  const _ForgotPasswordView({
    required this.newPasswordController,
    required this.confirmNewPasswordController,
    required this.isPasswordVisible,
    required this.isConfirmPasswordVisible,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.icAiText,
          width: 60.setHeight,
          height: 47.setHeight,
          gaplessPlayback: true,
        ),
        SizedBox(height: 50.setHeight),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CommonText(
              text: Languages.of(context).txtRestPassword,
              fontWeight: FontWeight.w800,
              fontSize: 35.setFontSize,
              textColor: CustomAppColor.of(context).txtBlack,
              height: 1,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 16.setHeight),
            CommonText(
              text: "figure out Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              fontWeight: FontWeight.w400,
              fontSize: 13.setFontSize,
              textColor: CustomAppColor.of(context).txtBlackAndGray,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 40.setHeight),
            ValueListenableBuilder(
              valueListenable: isPasswordVisible,
              builder: (context, value, widget) {
                return CommonTextFormFieldWithPrefixAndSuffix(
                  controller: newPasswordController,
                  titleText: Languages.of(context).txtNewPassword,
                  hintText: Languages.of(context).txtEnterYourNewPassword,
                  prefixIcon: AppAssets.icPassword,
                  suffixIcon: value ? AppAssets.icVisiblePassword : AppAssets.icUnVisiblePassword,
                  obscureText: value,
                  keyboardType: TextInputType.visiblePassword,
                  onSuffixClick: () => isPasswordVisible.value = !isPasswordVisible.value,
                );
              },
            ),
            SizedBox(height: 20.setHeight),
            ValueListenableBuilder(
              valueListenable: isConfirmPasswordVisible,
              builder: (context, value, widget) {
                return CommonTextFormFieldWithPrefixAndSuffix(
                  controller: confirmNewPasswordController,
                  titleText: Languages.of(context).txtConfirmNewPassword,
                  hintText: Languages.of(context).txtConfirmNewPassword,
                  prefixIcon: AppAssets.icPassword,
                  suffixIcon: value ? AppAssets.icVisiblePassword : AppAssets.icUnVisiblePassword,
                  obscureText: value,
                  keyboardType: TextInputType.visiblePassword,
                  onSuffixClick: () => isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value,
                );
              },
            ),
            SizedBox(height: 30.setHeight),
            CommonButton(
              text: Languages.of(context).txtRest,
              onTap: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (dialogContext) {
                    Future.delayed(const Duration(seconds: 2), () {
                      if (dialogContext.mounted) {
                        Navigator.of(dialogContext).pop();
                      }
                      Future.delayed(const Duration(milliseconds: 100), () {
                        if (context.mounted) {
                          Navigator.of(context).pop();
                          Navigator.push(context, CreateProfileScreen.route());
                        }
                      });
                    });
                    return CommonDialog(
                      titleText: CommonText(
                        text: Languages.of(context).txtCongratulations,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.setFontSize,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                      descriptionText: CommonText(
                        text: Languages.of(context).txtLoremIpsumDesc,
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                      icon: Image.asset(
                        AppAssets.icCongratulation,
                        height: 110.setHeight,
                      ),
                      showLoader: true,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
