import 'package:flutter/material.dart';
import 'package:furniture_app_package/interfaces/top_bar_click_listener.dart';
import 'package:furniture_app_package/localization/language/languages.dart';
import 'package:furniture_app_package/ui/track_order/view/track_order_screen.dart';
import 'package:furniture_app_package/utils/app_color.dart';
import 'package:furniture_app_package/utils/constant.dart';
import 'package:furniture_app_package/utils/sizer_utils.dart';
import 'package:furniture_app_package/widgets/button/common_button.dart';
import 'package:furniture_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';
import '../../../widgets/alert_dialog/common_alert_dialog.dart';
import '../../../widgets/otp_field/otp_field.dart';
import '../../../widgets/otp_field/otp_field_style.dart';
import '../../../widgets/text/common_text.dart';

class EnterYourPinScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EnterYourPinScreen());
  }

  const EnterYourPinScreen({super.key});

  @override
  State<EnterYourPinScreen> createState() => _EnterYourPinScreenState();
}

class _EnterYourPinScreenState extends State<EnterYourPinScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
          child: Column(
        children: [
          TopBar(
            this,
            isShowBack: true,
            title: Languages.of(context).txtEnterYourPin,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 25.setHeight),
                  CommonText(
                    text: Languages.of(context).txtEnterYourPinToConfirmPayment,
                    textColor: CustomAppColor.of(context).txtLightGrey,
                    fontFamily: Constant.fontFamilyMedium500,
                    fontSize: 14.setFontSize,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.setWidth, vertical: 40.setHeight),
                    child: OTPTextField(
                      context: context,
                      length: 4,
                      width: 0.screenWidth - 120.setWidth,
                      fieldWidth: 60.setWidth,
                      fieldHeight: 60.setHeight,
                      outlineBorderRadius: 100,
                      fieldStyle: FieldStyle.box,
                      style: TextStyle(
                        fontSize: 28.setFontSize,
                        color: CustomAppColor.of(context).txtPrimary,
                        fontFamily: Constant.fontFamilyBold700,
                        fontWeight: FontWeight.bold,
                        package: 'furniture_app_package',
                      ),
                      textFieldAlignment: MainAxisAlignment.spaceBetween,
                      otpFieldStyle: OtpFieldStyle(
                        backgroundColor: CustomAppColor.of(context).bgScreen,
                        borderColor: CustomAppColor.of(context).txtGray,
                        focusBorderColor: CustomAppColor.of(context).primary,
                        enabledBorderColor: CustomAppColor.of(context).txtGray,
                        disabledBorderColor: CustomAppColor.of(context).primary,
                        errorBorderColor: CustomAppColor.of(context).txtRed,
                      ),
                      onChanged: (value) {},
                      onCompleted: (value) {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 20.setHeight),
            child: CommonButton(
              text: Languages.of(context).txtContinue,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (dialogContext) {
                    return CommonDialog(
                      icon: CircleAvatar(
                        radius: 35,
                        backgroundColor: CustomAppColor.of(context).primary,
                        child: Image.asset(
                          AppAssets.icShoppingCart,
                          height: 30.setHeight,
                          width: 30.setWidth,
                          color: CustomAppColor.of(context).white,
                        ),
                      ),
                      titleText: CommonText(
                        text: Languages.of(context).txtOrderSuccessful,
                        fontFamily: Constant.fontFamilyBold700,
                        fontSize: 26.setFontSize,
                      ),
                      descriptionText: CommonText(
                        text: Languages.of(context).txtCongratulationsDesc,
                        fontFamily: Constant.fontFamilyRegular400,
                        textColor: CustomAppColor.of(context).txtGray,
                        fontSize: 14.setFontSize,
                      ),
                      button: CommonButton(
                          text: Languages.of(context).txtTrackOrder,
                          onTap: () {
                            Navigator.pop(dialogContext);
                            Navigator.push(context, TrackOrderScreen.route());
                          }),
                    );
                  },
                );
              },
            ),
          )
        ],
      )),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
