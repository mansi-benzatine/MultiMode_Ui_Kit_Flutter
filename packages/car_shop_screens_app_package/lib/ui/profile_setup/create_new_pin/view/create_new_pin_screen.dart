import 'package:car_shop_screens_app_package/dialogs/alerts/congratulations_dialog.dart';
import 'package:car_shop_screens_app_package/utils/sizer_utils.dart';
import 'package:car_shop_screens_app_package/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../../../../interfaces/top_bar_click_listener.dart';
import '../../../../localization/language/languages.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/constant.dart';
import '../../../../widgets/button/common_button.dart';
import '../../../../widgets/otp_field/otp_field.dart';
import '../../../../widgets/otp_field/otp_field_style.dart';
import '../../../../widgets/top_bar/topbar.dart';

class CreateNewPinScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const CreateNewPinScreen());
  }

  const CreateNewPinScreen({super.key});

  @override
  State<CreateNewPinScreen> createState() => _CreateNewPinScreenState();
}

class _CreateNewPinScreenState extends State<CreateNewPinScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtCreateNewPin,
            isShowBack: true,
          ),
          SizedBox(height: 20.setHeight),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: Column(
                children: [
                  CommonText(text: Languages.of(context).txtAddNewPinMessage, fontSize: 12.setFontSize, fontWeight: FontWeight.w400, textColor: CustomAppColor.of(context).txtBlack),
                  SizedBox(height: 20.setHeight),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.setWidth),
                    child: OTPTextField(
                      context: context,
                      length: 4,
                      width: 0.screenWidth - 40.setWidth,
                      fieldWidth: 60.setWidth,
                      fieldHeight: 60.setHeight,
                      outlineBorderRadius: 16,
                      fieldStyle: FieldStyle.box,
                      style: TextStyle(
                        fontSize: 24.setFontSize,
                        fontWeight: FontWeight.w600,
                        color: CustomAppColor.of(context).primary,
                        fontFamily: Constant.fontFamily,
                        height: 1,
                      ),
                      textFieldAlignment: MainAxisAlignment.spaceBetween,
                      otpFieldStyle: OtpFieldStyle(
                        backgroundColor: CustomAppColor.of(context).bgScreen,
                        borderColor: CustomAppColor.of(context).primary,
                        focusBorderColor: CustomAppColor.of(context).primary,
                        enabledBorderColor: CustomAppColor.of(context).txtGray,
                        disabledBorderColor: CustomAppColor.of(context).txtGray,
                        errorBorderColor: CustomAppColor.of(context).txtRed,
                      ),
                      onChanged: (value) {
                        // _otpValue.value = value;
                      },
                      onCompleted: (value) {
                        // _otpValue.value = value;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.setHeight),
          CommonButton(
              text: Languages.of(context).txtContinue,
              mLeft: 30.setWidth,
              mRight: 30.setWidth,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (dialogContext) => CongratulationsDialog(
                    onComplete: () {
                      Navigator.pop(dialogContext);
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardScreen(),
                        ),
                      );*/
                    },
                  ),
                );
              }),
          SizedBox(height: 50.setHeight),
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
