import 'package:flutter/material.dart';
import 'package:qr_scanner_screens_app_package/ui/qr_code_result/view/qr_code_result_screen.dart';
import 'package:qr_scanner_screens_app_package/utils/constant.dart';
import 'package:qr_scanner_screens_app_package/utils/debug.dart';
import 'package:qr_scanner_screens_app_package/widgets/text_field/text_form_field.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class CreateQrCodeScreen extends StatefulWidget {
  final Map<String, dynamic> qrType;

  static Route<void> route({required Map<String, dynamic> qrType}) {
    return MaterialPageRoute(
        builder: (_) => CreateQrCodeScreen(qrType: qrType));
  }

  const CreateQrCodeScreen({super.key, required this.qrType});

  @override
  State<CreateQrCodeScreen> createState() => _CreateQrCodeScreenState();
}

class _CreateQrCodeScreenState extends State<CreateQrCodeScreen>
    implements TopBarClickListener {
  @override
  void initState() {
    super.initState();
    Debug.printLog('qrType: ${widget.qrType['type']}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(this, title: _getTopBarTitle(), isShowBack: true),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(24.setWidth),
                  child: Stack(
                    children: [
                      Wrap(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 42.setHeight),
                            decoration: BoxDecoration(
                              color: CustomAppColor.of(context).bgScreen,
                              borderRadius: BorderRadius.circular(12.setHeight),
                              border: Border.all(
                                color:
                                    CustomAppColor.of(context).containerBorder,
                                width: 1,
                              ),
                            ),
                            padding: EdgeInsets.all(16.setWidth),
                            child: Column(
                              children: [
                                SizedBox(height: 60.setHeight),

                                // Input Field
                                _buildInputField(widget.qrType['type']),

                                SizedBox(height: 20.setHeight),

                                // Action Buttons
                                _buildActionButtons(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Center(child: _buildQrTypeIcon()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getTopBarTitle() {
    return widget.qrType['name'];
    /* switch (widget.qrType['type']) {
      case Constant.toolContentFromClipboard:
        return Languages.of(context).txtClipboardCreateQrCode;
      case Constant.toolWebsite:
        return Languages.of(context).txtWebsiteCreateQrCode;
      case Constant.toolText:
        return Languages.of(context).txtTextCreateQrCode;
      case Constant.toolContact:
        return Languages.of(context).txtContactCreateQrCode;
      case Constant.toolEmail:
        return Languages.of(context).txtEmailCreateQrCode;
      case Constant.toolSms:
        return Languages.of(context).txtSmsCreateQrCode;
      case Constant.toolLocation:
        return Languages.of(context).txtLocationCreateQrCode;
      case Constant.toolCall:
        return Languages.of(context).txtCallCreateQrCode;
      case Constant.toolEvent:
        return Languages.of(context).txtEventCreateQrCode;
      case Constant.toolWifi:
        return Languages.of(context).txtWifiCreateQrCode;
      case Constant.toolApp:
        return Languages.of(context).txtAppCreateQrCode;
      case Constant.toolBarcodes2DCode:
        return Languages.of(context).txtBarcodeCreateQrCode;
      default:
        return Languages.of(context).txtCreateQrCode;
    } */
  }

  Widget _buildQrTypeIcon() {
    return SizedBox(
      width: 84.setWidth,
      height: 84.setWidth,
      child: Center(
        child: Image.asset(widget.qrType['icon']),
      ),
    );
  }

  Widget _buildInputField(String qrType) {
    switch (qrType) {
      case Constant.toolContentFromClipboard:
        return CommonTextFormField(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtEnterSomething,
          maxLines: 6,
        );
      case Constant.toolWebsite:
        return _buildWebsiteInputField();

      case Constant.toolText:
        return CommonTextFormField(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtEnterContent,
          maxLines: 6,
        );
      case Constant.toolContact:
        return _buildContactInputField();
      case Constant.toolEmail:
        return _buildEmailInputField();
      case Constant.toolSms:
        return _buildSmsInputField();
      case Constant.toolLocation:
        return _buildLocationInputField();
      case Constant.toolCall:
        return _buildCallInputField();
      case Constant.toolEvent:
        return _buildEventInputField();
      case Constant.toolWifi:
        return _buildWifiInputField();

      default:
        return CommonTextFormField(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtEnterSomething);
    }
  }

  Widget _buildWebsiteInputField() {
    return Column(
      children: [
        CommonTextFormField(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtEnterContent,
        ),
        SizedBox(height: 10.setHeight),
        Row(
          children: [
            Container(
              height: 30.setHeight,
              width: 70.setWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.setHeight),
                color: CustomAppColor.of(context).bgChip,
              ),
              child: Center(
                child: CommonText(
                  text: Languages.of(context).txtHttp,
                  fontSize: 12.setFontSize,
                  fontWeight: FontWeight.w500,
                  textColor: CustomAppColor.of(context).primary,
                ),
              ),
            ),
            SizedBox(width: 10.setWidth),
            Container(
              height: 30.setHeight,
              width: 70.setWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.setHeight),
                color: CustomAppColor.of(context).bgChip,
              ),
              child: Center(
                child: CommonText(
                  text: Languages.of(context).txtWWW,
                  fontSize: 12.setFontSize,
                  fontWeight: FontWeight.w500,
                  textColor: CustomAppColor.of(context).primary,
                ),
              ),
            ),
            SizedBox(width: 10.setWidth),
            Container(
              height: 30.setHeight,
              width: 70.setWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.setHeight),
                color: CustomAppColor.of(context).bgChip,
              ),
              child: Center(
                child: CommonText(
                  text: Languages.of(context).txtCom,
                  fontSize: 12.setFontSize,
                  fontWeight: FontWeight.w500,
                  textColor: CustomAppColor.of(context).primary,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildContactInputField() {
    return Column(
      children: [
        CommonTextFormField(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtEnterFirstName),
        SizedBox(height: 10.setHeight),
        CommonTextFormField(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtEnterLastName),
        SizedBox(height: 10.setHeight),
        CommonTextFormField(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtEnterOrganizationName),
        SizedBox(height: 10.setHeight),
        CommonTextFormField(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtEnterPhoneNumber),
        SizedBox(height: 10.setHeight),
        CommonTextFormField(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtEnterEmailAddress),
        SizedBox(height: 10.setHeight),
        CommonTextFormField(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtEnterStreetAddress),
        SizedBox(height: 10.setHeight),
        CommonTextFormField(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtEnterCity),
        SizedBox(height: 10.setHeight),
        Row(
          children: [
            Expanded(
              child: CommonTextFormField(
                  controller: TextEditingController(),
                  hintText: Languages.of(context).txtEnterCountry),
            ),
            SizedBox(width: 10.setWidth),
            Expanded(
              child: CommonTextFormField(
                  controller: TextEditingController(),
                  hintText: Languages.of(context).txtEnterZipCode),
            ),
          ],
        ),
        SizedBox(height: 10.setHeight),
        CommonTextFormField(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtEnterWebsite),
      ],
    );
  }

  Widget _buildEmailInputField() {
    return Column(
      children: [
        CommonTextFormField(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtEnterEmailAddress),
        SizedBox(height: 10.setHeight),
        CommonTextFormField(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtEnterSubject),
        SizedBox(height: 10.setHeight),
        CommonTextFormField(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtEnterSomething,
          maxLines: 6,
        ),
      ],
    );
  }

  Widget _buildSmsInputField() {
    return Column(
      children: [
        CommonTextFormField(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtEnterPhoneNumber),
        SizedBox(height: 10.setHeight),
        CommonTextFormField(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtEnterSomething,
          maxLines: 6,
        ),
      ],
    );
  }

  Widget _buildLocationInputField() {
    return Column(
      children: [
        CommonTextFormField(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtEnterLatitudeOfLocation),
        SizedBox(height: 10.setHeight),
        CommonTextFormField(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtEnterLongitudeOfLocation),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        // Reset Button
        Expanded(
          child: CommonButton(
            onTap: _onResetPressed,
            text: Languages.of(context).txtReset,
            buttonColor: CustomAppColor.of(context).transparent,
            borderColor: CustomAppColor.of(context).primary,
            buttonFontStyle: FontStyle.normal,
            buttonTextColor: CustomAppColor.of(context).primary,
            buttonTextSize: 14.setFontSize,
            buttonTextWeight: FontWeight.w500,
            height: 40.setHeight,
          ),
        ),

        SizedBox(width: 16.setWidth),

        // Generate Button
        Expanded(
          child: IgnorePointer(
            ignoring: true,
            child: CommonButton(
              onTap: _onGeneratePressed,
              text: Languages.of(context).txtGenerate,
              buttonColor: CustomAppColor.of(context).primary,
              buttonTextColor: CustomAppColor.of(context).txtWhite,
              height: 40.setHeight,
              buttonTextSize: 14.setFontSize,
              buttonTextWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCallInputField() {
    return Column(
      children: [
        CommonTextFormField(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtEnterPhoneNumber),
      ],
    );
  }

  bool allDayEvent = false;
  Widget _buildEventInputField() {
    return Column(
      children: [
        CommonTextFormField(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtEnterEventTitle),
        Row(
          children: [
            Expanded(
                child: CommonText(
              text: Languages.of(context).txtAllDayEvent,
              fontSize: 16.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).primary,
            )),
            Switch(
                value: allDayEvent,
                onChanged: (value) {
                  setState(() {
                    allDayEvent = !allDayEvent;
                  });
                },
                activeColor: CustomAppColor.of(context).primary),
          ],
        ),
        SizedBox(height: 10.setHeight),
        Row(
          children: [
            Expanded(
                child: CommonTextFormField(
                    controller: TextEditingController(),
                    hintText: Languages.of(context).txtEnterStartDate)),
            if (!allDayEvent) ...{
              SizedBox(width: 10.setWidth),
              Expanded(
                  child: CommonTextFormField(
                      controller: TextEditingController(),
                      hintText: Languages.of(context).txtEnterStartTime)),
            }
          ],
        ),
        SizedBox(height: 10.setHeight),
        Row(
          children: [
            Expanded(
                child: CommonTextFormField(
                    controller: TextEditingController(),
                    hintText: Languages.of(context).txtEnterEndDate)),
            if (!allDayEvent) ...{
              SizedBox(width: 10.setWidth),
              Expanded(
                  child: CommonTextFormField(
                      controller: TextEditingController(),
                      hintText: Languages.of(context).txtEnterEndTime)),
            }
          ],
        ),
        SizedBox(height: 10.setHeight),
        CommonTextFormField(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtEnterLocation),
        SizedBox(height: 10.setHeight),
        CommonTextFormField(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtEnterSomething,
          maxLines: 6,
        ),
      ],
    );
  }

  bool isWPA = false;
  bool isWEP = false;
  bool isNone = false;

  Widget _buildWifiInputField() {
    return Column(
      children: [
        CommonTextFormField(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtEnterNetworkNameSSID),
        SizedBox(height: 15.setHeight),
        Align(
          alignment: Alignment.centerLeft,
          child: CommonText(
              text: Languages.of(context).txtSelectSecurityType,
              fontSize: 12.setFontSize,
              fontWeight: FontWeight.w400,
              textColor: CustomAppColor.of(context).txtGray),
        ),
        SizedBox(height: 10.setHeight),
        Row(
          children: [
            CommonButton(
              width: 88.setWidth,
              onTap: () {
                setState(() {
                  isWPA = !isWPA;
                  isWEP = false;
                  isNone = false;
                });
              },
              text: Languages.of(context).txtWPA,
              buttonColor: isWPA
                  ? CustomAppColor.of(context).primary
                  : CustomAppColor.of(context).transparent,
              buttonTextColor: isWPA
                  ? CustomAppColor.of(context).white
                  : CustomAppColor.of(context).primary,
              borderColor: CustomAppColor.of(context).primary,
              height: 30.setHeight,
              buttonTextSize: 12.setFontSize,
              buttonTextWeight: FontWeight.w500,
            ),
            SizedBox(width: 10.setWidth),
            CommonButton(
              width: 88.setWidth,
              onTap: () {
                setState(() {
                  isWEP = !isWEP;
                  isWPA = false;
                  isNone = false;
                });
              },
              text: Languages.of(context).txtWEP,
              buttonColor: isWEP
                  ? CustomAppColor.of(context).primary
                  : CustomAppColor.of(context).transparent,
              buttonTextColor: isWEP
                  ? CustomAppColor.of(context).white
                  : CustomAppColor.of(context).primary,
              borderColor: CustomAppColor.of(context).primary,
              height: 30.setHeight,
              buttonTextSize: 12.setFontSize,
              buttonTextWeight: FontWeight.w500,
            ),
            SizedBox(width: 10.setWidth),
            CommonButton(
              width: 88.setWidth,
              onTap: () {
                setState(() {
                  isNone = !isNone;
                  isWPA = false;
                  isWEP = false;
                });
              },
              text: Languages.of(context).txtNone,
              buttonColor: isNone
                  ? CustomAppColor.of(context).primary
                  : CustomAppColor.of(context).transparent,
              buttonTextColor: isNone
                  ? CustomAppColor.of(context).white
                  : CustomAppColor.of(context).primary,
              borderColor: CustomAppColor.of(context).primary,
              height: 30.setHeight,
              buttonTextSize: 12.setFontSize,
              buttonTextWeight: FontWeight.w500,
            ),
          ],
        ),
        SizedBox(height: 20.setHeight),
        CommonTextFormField(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtEnterNetworkPassword),
      ],
    );
  }

  void _onResetPressed() {}

  void _onGeneratePressed() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => QrCodeResultScreen(qrType: widget.qrType)));
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
