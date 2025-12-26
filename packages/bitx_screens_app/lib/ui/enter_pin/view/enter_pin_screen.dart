import 'package:bitx_screens_app/dialogs/alerts/order_received_dialog.dart';
import 'package:bitx_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:bitx_screens_app/localization/language/languages.dart';
import 'package:bitx_screens_app/utils/app_color.dart';
import 'package:bitx_screens_app/utils/constant.dart';
import 'package:bitx_screens_app/utils/sizer_utils.dart';
import 'package:bitx_screens_app/utils/utils.dart';
import 'package:bitx_screens_app/widgets/button/common_button.dart';
import 'package:bitx_screens_app/widgets/otp_field/otp_field.dart';
import 'package:bitx_screens_app/widgets/text/common_text.dart';
import 'package:bitx_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../../widgets/otp_field/otp_field_style.dart';
import '../../home/view/home_screen.dart';

class EnterPinScreen extends StatefulWidget {
  final WishListItemData data;
  final bool forSuccessDialog;

  static Route<void> route({required WishListItemData data, bool forSuccessDialog = false}) {
    return MaterialPageRoute(
      builder: (context) => EnterPinScreen(
        data: data,
        forSuccessDialog: forSuccessDialog,
      ),
    );
  }

  const EnterPinScreen({
    super.key,
    required this.data,
    this.forSuccessDialog = false,
  });

  @override
  State<EnterPinScreen> createState() => _EnterPinScreenState();
}

class _EnterPinScreenState extends State<EnterPinScreen> implements TopBarClickListener {
  @override
  void initState() {
    super.initState();

    if (widget.forSuccessDialog) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          showDialog(
            context: context,
            barrierColor: CustomAppColor.of(context).black.withOpacityPercent(0.3),
            builder: (dialogContext) {
              return PopScope(
                canPop: false,
                onPopInvokedWithResult: (didPop, result) {
                  if (!didPop) {
                    Navigator.pop(dialogContext);
                    Navigator.pop(context);
                  }
                },
                child: OrderReceivedDialog(
                  title: widget.data.company,
                  message: Languages.of(context).txtYourAccountIsReadyToUse,
                  icon: widget.data.stockIcon,
                  onComplete: () {},
                ),
              );
            },
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtEnterPin,
            isShowBack: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 100.setHeight, right: 20.setWidth, left: 20.setWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15.setHeight),
                  CommonText(
                    text: Languages.of(context).txtEnterYourSecurityPINToConfirmTheTransction,
                    fontSize: 13.setFontSize,
                    fontWeight: FontWeight.w400,
                    textColor: CustomAppColor.of(context).txtDescriptionGray,
                    textAlign: TextAlign.start,
                    maxLines: 2,
                  ),
                  SizedBox(height: 25.setHeight),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 25.setHeight),
                    child: OTPTextField(
                      context: context,
                      length: 4,
                      width: 0.screenWidth - 40.setWidth,
                      fieldWidth: 64.setWidth,
                      fieldHeight: 48.setHeight,
                      outlineBorderRadius: 12,
                      fieldStyle: FieldStyle.box,
                      style: TextStyle(
                        fontSize: 24.setFontSize,
                        fontWeight: FontWeight.w600,
                        color: CustomAppColor.of(context).txtBlack,
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
                        filledBorderColor: CustomAppColor.of(context).primary,
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
          Padding(
            padding: EdgeInsets.only(left: 20.setWidth, bottom: 60.setHeight, right: 20.setWidth),
            child: IgnorePointer(
              ignoring: true,
              child: CommonButton(
                text: Languages.of(context).txtConfirm,
                onTap: () {
                  showDialog(
                    context: context,
                    barrierColor: CustomAppColor.of(context).black.withOpacityPercent(0.3),
                    builder: (context) => OrderReceivedDialog(
                      title: widget.data.company,
                      message: Languages.of(context).txtYourAccountIsReadyToUse,
                      icon: widget.data.stockIcon,
                      onComplete: () {},
                    ),
                  );
                },
              ),
            ),
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
