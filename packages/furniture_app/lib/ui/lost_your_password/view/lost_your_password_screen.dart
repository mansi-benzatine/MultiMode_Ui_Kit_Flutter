import 'package:flutter/material.dart';
import 'package:furniture_app_package/ui/enter_otp/view/enter_otp_screen.dart';
import 'package:furniture_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text_field/text_form_field.dart';

class LostYourPasswordScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const LostYourPasswordScreen());
  }

  const LostYourPasswordScreen({super.key});

  @override
  State<LostYourPasswordScreen> createState() => _LostYourPasswordScreenState();
}

class _LostYourPasswordScreenState extends State<LostYourPasswordScreen> {
  final TextEditingController emailAddressController = TextEditingController(text: "Kellyoliver@yourdomain.com");

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
                        emailAddressController: emailAddressController,
                      ),
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
  TextEditingController emailAddressController = TextEditingController(text: "Kellyoliver@yourdomain.com");

  ValueNotifier<bool> isPasswordVisible = ValueNotifier(true);
  FormView({
    super.key,
    required this.emailAddressController,
  });

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
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
          text: Languages.of(context).txtLostYourPassword,
          fontFamily: Constant.fontFamilyBold700,
          fontSize: 30.setFontSize,
        ),
        SizedBox(height: 12.setHeight),
        CommonText(
          text: Languages.of(context).txtPleaseEnterYourEmailAddressYouWillReceiveALinkToCreateANewPasswordViaEmail,
          fontFamily: Constant.fontFamilyMedium500,
          fontSize: 16.setFontSize,
          textAlign: TextAlign.start,
          textColor: CustomAppColor.of(context).txtGray,
        ),
        SizedBox(height: 20.setHeight),
        CommonTextFormFieldWithPrefix(
          prefixIcon: AppAssets.icEmail,
          controller: widget.emailAddressController,
          hintText: Languages.of(context).txtEnterEmailAddress,
          titleText: Languages.of(context).txtEmailAddress,
          prefixIconColor: CustomAppColor.of(context).icGray,
        ),
        SizedBox(height: 30.setHeight),
        CommonButton(
          text: Languages.of(context).txtContinue,
          onTap: () => Navigator.push(context, EnterOtpScreen.route()),
        ),
      ],
    );
  }
}
