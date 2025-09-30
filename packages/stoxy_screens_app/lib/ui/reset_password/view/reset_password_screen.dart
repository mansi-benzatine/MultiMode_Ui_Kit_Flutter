import 'package:flutter/material.dart';
import 'package:stoxy_screens_app_package/ui/login/view/login_screen.dart';
import 'package:stoxy_screens_app_package/utils/sizer_utils.dart';
import 'package:stoxy_screens_app_package/utils/utils.dart';

import '../../../dialogs/alerts/congratulations_dialog.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart' show AppAssets;
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../../widgets/top_bar/topbar.dart';

class ResetPasswordScreen extends StatefulWidget {
  final bool isForDialog;
  static Route<void> route({bool isForDialog = false}) {
    return MaterialPageRoute(builder: (_) => ResetPasswordScreen(isForDialog: isForDialog));
  }

  const ResetPasswordScreen({super.key, this.isForDialog = false});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> implements TopBarClickListener {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController(text: "123456");
  final TextEditingController confirmPasswordController = TextEditingController(text: "123456");

  final ValueNotifier<bool> isShowPassword = ValueNotifier(false);
  final ValueNotifier<bool> isShowConfirmPassword = ValueNotifier(false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isForDialog) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          barrierDismissible: false,
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
              child: CongratulationsDialog(
                title: Languages.of(context).txtCongratulations,
                message: Languages.of(context).txtLoremIpsumShort,
              ),
            );
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.imgSignUpBackground),
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
              SizedBox(height: 40.setHeight),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(left: 16.setWidth, right: 16.setWidth, bottom: 16.setHeight),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CommonText(
                          text: Languages.of(context).txtResetPassword,
                          textAlign: TextAlign.start,
                          fontSize: 30.setFontSize,
                          fontWeight: FontWeight.w700,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                      ),
                      SizedBox(height: 10.setHeight),
                      CommonText(
                        text: Languages.of(context).txtLoremIpsumShort,
                        textAlign: TextAlign.start,
                        fontSize: 13.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtDescriptionGray,
                      ),
                      SizedBox(height: 30.setHeight),
                      ValueListenableBuilder(
                        valueListenable: isShowPassword,
                        builder: (context, value, child) {
                          return CommonTextFormFieldWithPrefixAndSuffix(
                            controller: passwordController,
                            hintText: Languages.of(context).txtEnterNewPassword,
                            titleText: Languages.of(context).txtNewPassword,
                            prefixIcon: AppAssets.icPasswordKey,
                            suffixIcon: value ? AppAssets.icEye : AppAssets.icEyeClose,
                            obscureText: !value,
                            keyboardType: TextInputType.visiblePassword,
                            onSuffixClick: () {
                              isShowPassword.value = !isShowPassword.value;
                            },
                          );
                        },
                      ),
                      SizedBox(height: 25.setHeight),
                      ValueListenableBuilder(
                        valueListenable: isShowConfirmPassword,
                        builder: (context, value, child) {
                          return CommonTextFormFieldWithPrefixAndSuffix(
                            controller: confirmPasswordController,
                            hintText: Languages.of(context).txtConfirmNewPassword,
                            titleText: Languages.of(context).txtConfirmNewPassword,
                            prefixIcon: AppAssets.icPasswordKey,
                            suffixIcon: value ? AppAssets.icEye : AppAssets.icEyeClose,
                            obscureText: !value,
                            keyboardType: TextInputType.visiblePassword,
                            onSuffixClick: () {
                              isShowConfirmPassword.value = !isShowConfirmPassword.value;
                            },
                          );
                        },
                      ),
                      SizedBox(height: 35.setHeight),
                      IgnorePointer(
                        ignoring: true,
                        child: CommonButton(
                          text: Languages.of(context).txtResetPassword,
                          gradient: CustomAppColor.of(context).primaryGradient,
                          onTap: () {
                            showDialog(
                              context: context,
                              barrierColor: CustomAppColor.of(context).black.withOpacityPercent(0.3),
                              builder: (context) => CongratulationsDialog(
                                title: Languages.of(context).txtCongratulations,
                                message: Languages.of(context).txtLoremIpsumShort,
                                onComplete: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
                                },
                              ),
                            );
                          },
                        ),
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
