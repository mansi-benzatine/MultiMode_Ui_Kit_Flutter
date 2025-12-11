import 'package:cinemix_screens_app/localization/language/languages.dart';
import 'package:cinemix_screens_app/utils/app_color.dart';
import 'package:cinemix_screens_app/utils/constant.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:cinemix_screens_app/widgets/alert_dialog/reset_password_success_dialog.dart';
import 'package:cinemix_screens_app/widgets/button/common_button.dart';
import 'package:cinemix_screens_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../widgets/animated_image_row/animated_image_row.dart';
import '../../../widgets/text_field/text_form_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  final bool isShowSuccessAlert;

  static Route<void> route({bool isShowSuccessAlert = false}) {
    return MaterialPageRoute(
      builder: (_) => ResetPasswordScreen(isShowSuccessAlert: isShowSuccessAlert),
    );
  }

  const ResetPasswordScreen({super.key, this.isShowSuccessAlert = false});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final imageLists = [
    [
      AppAssets.imgGetStarted1,
      AppAssets.imgGetStarted2,
      AppAssets.imgGetStarted3,
      AppAssets.imgGetStarted4,
      AppAssets.imgGetStarted5,
      AppAssets.imgGetStarted6,
    ],
    [
      AppAssets.imgGetStarted4,
      AppAssets.imgGetStarted5,
      AppAssets.imgGetStarted6,
      AppAssets.imgGetStarted7,
      AppAssets.imgGetStarted8,
      AppAssets.imgGetStarted9,
    ],
  ];
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  ValueNotifier<bool> isPasswordVisible = ValueNotifier(true);
  ValueNotifier<bool> isNewPasswordVisible = ValueNotifier(true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.isShowSuccessAlert) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (dialogContext) {
            return PopScope(
              canPop: false,
              onPopInvokedWithResult: (didPop, result) {
                if (!didPop) {
                  Navigator.pop(dialogContext);
                  Navigator.pop(context);
                }
              },
              child: const ResetPasswordSuccessDialog(),
            );
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Stack(
        children: [
          Positioned(
            top: -110.setHeight,
            left: -92.setWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(imageLists.length, (i) {
                return AnimatedImageRow(
                  images: imageLists[i],
                  reverse: i.isOdd,
                );
              }),
            ),
          ),
          Positioned(
            top: 50.setHeight,
            left: 20.setWidth,
            child: IgnorePointer(
              ignoring: true,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.keyboard_backspace_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.setWidth,
                vertical: 70.setHeight,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    CustomAppColor.of(context).bgLinearShadow.withValues(alpha: 0.05),
                    CustomAppColor.of(context).bgLinearShadow.withValues(alpha: 0.8),
                    CustomAppColor.of(context).bgLinearShadow,
                    CustomAppColor.of(context).bgLinearShadow,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.0, 0.2, 0.3, 0.9],
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.setWidth),
                    child: CommonText(
                      text: Languages.of(context).txtResetPassword,
                      textAlign: TextAlign.center,
                      fontSize: 32.setFontSize,
                      fontFamily: Constant.fontFamilyClashDisplayBold700,
                      letterSpacing: 1.1,
                    ),
                  ),
                  SizedBox(height: 20.setHeight),
                  CommonText(
                    text: Languages.of(context).txtCodeHasBeenSendToSameEmail,
                    textAlign: TextAlign.center,
                    fontSize: 14.setFontSize,
                    fontFamily: Constant.fontFamilyClashGroteskMedium500,
                    textColor: CustomAppColor.of(context).txtGray,
                  ),
                  SizedBox(height: 25.setHeight),
                  ValueListenableBuilder(
                    valueListenable: isPasswordVisible,
                    builder: (context, value, child) {
                      return CommonTextFormFieldWithPrefixAndSuffix(
                        controller: passwordController,
                        hintText: Languages.of(context).txtEnterYourNewPassword,
                        titleText: Languages.of(context).txtNewPassword,
                        prefixIcon: AppAssets.icKey,
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
                  SizedBox(height: 15.setHeight),
                  ValueListenableBuilder(
                    valueListenable: isNewPasswordVisible,
                    builder: (context, value, child) {
                      return CommonTextFormFieldWithPrefixAndSuffix(
                        controller: newPasswordController,
                        hintText: Languages.of(context).txtConfirmNewPassword,
                        titleText: Languages.of(context).txtConfirmPassword,
                        prefixIcon: AppAssets.icKey,
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
                  SizedBox(height: 200.setHeight),
                  CommonButton(
                    text: Languages.of(context).txtContinue.toUpperCase(),
                    buttonTextColor: CustomAppColor.of(context).white,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const ResetPasswordSuccessDialog();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
