import 'package:flutter/material.dart';
import 'package:furniture_app_package/ui/sign_in/view/sign_in_screen.dart';
import 'package:furniture_app_package/utils/sizer_utils.dart';
import 'package:furniture_app_package/widgets/alert_dialog/common_alert_dialog.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text_field/text_form_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
  }

  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController newPasswordController = TextEditingController(text: "123456789");
  final TextEditingController passwordController = TextEditingController(text: "123456789");
  ValueNotifier<bool> isPasswordVisible = ValueNotifier(true);

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
                        newPasswordController: newPasswordController,
                        passwordController: passwordController,
                        isPasswordVisible: isPasswordVisible,
                      ),
                      SizedBox(height: 40.setHeight),
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
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ValueNotifier<bool> isPasswordVisible = ValueNotifier(true);

  FormView({super.key, required this.newPasswordController, required this.passwordController, required this.isPasswordVisible});

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
          text: Languages.of(context).txtResetPassword,
          fontFamily: Constant.fontFamilyBold700,
          fontSize: 30.setFontSize,
        ),
        SizedBox(height: 12.setHeight),
        CommonText(
          text: Languages.of(context).txtPleaseEnterTheYourNewPasswordItMustBeDiffrentFromPreviouslyUserPassword,
          fontFamily: Constant.fontFamilyMedium500,
          textColor: CustomAppColor.of(context).txtGray,
          fontSize: 16.setFontSize,
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 30.setHeight),
        ValueListenableBuilder(
          valueListenable: widget.isPasswordVisible,
          builder: (context, value, child) {
            return CommonTextFormFieldWithPrefixAndSuffix(
              controller: widget.newPasswordController,
              hintText: Languages.of(context).txtEnterNewPassword,
              titleText: Languages.of(context).txtNewPassword,
              prefixIcon: AppAssets.icPassword,
              obscureText: value,
              suffixIcon: value ? AppAssets.icCloseEye : AppAssets.icOpenEye,
              onSuffixClick: () {
                widget.isPasswordVisible.value = !widget.isPasswordVisible.value;
              },
            );
          },
        ),
        SizedBox(height: 20.setHeight),
        ValueListenableBuilder(
          valueListenable: widget.isPasswordVisible,
          builder: (context, value, child) {
            return CommonTextFormFieldWithPrefixAndSuffix(
              controller: widget.passwordController,
              hintText: Languages.of(context).txtEnterConfirmNewPassword,
              titleText: Languages.of(context).txtConfirmPassword,
              prefixIcon: AppAssets.icPassword,
              obscureText: value,
              suffixIcon: value ? AppAssets.icCloseEye : AppAssets.icOpenEye,
              onSuffixClick: () {
                widget.isPasswordVisible.value = !widget.isPasswordVisible.value;
              },
            );
          },
        ),
        SizedBox(height: 30.setHeight),
        CommonButton(
          text: Languages.of(context).txtContinue,
          onTap: () {
            showDialog(
              context: context,
              builder: (dialogContext) {
                return CommonDialog(
                  icon: Container(
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).primary,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(25),
                    child: Image.asset(
                      AppAssets.icSelectedProfile,
                      height: 50.setHeight,
                      width: 50.setWidth,
                      color: CustomAppColor.of(context).white,
                    ),
                  ),
                  titleText: CommonText(
                    text: Languages.of(context).txtCongratulations,
                    fontFamily: Constant.fontFamilyBold700,
                    textColor: CustomAppColor.of(context).txtPrimary,
                    fontSize: 26.setFontSize,
                  ),
                  descriptionText: CommonText(
                    text: Languages.of(context).txtCongratulationsDesc,
                    fontFamily: Constant.fontFamilyRegular400,
                    textColor: CustomAppColor.of(context).txtGray,
                    fontSize: 14.setFontSize,
                  ),
                  button: CommonButton(
                      text: Languages.of(context).txtDone,
                      onTap: () {
                        Navigator.pop(dialogContext);
                        Navigator.push(context, SignInScreen.route());
                      }),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
