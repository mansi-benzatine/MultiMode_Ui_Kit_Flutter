import 'package:flutter/material.dart';
import 'package:qr_scanner_app_package/utils/sizer_utils.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../barcode_result/view/barcode_result_screen.dart';

class CreateBarcodeScreen extends StatefulWidget {
  final Map<String, dynamic> barcodeType;
  const CreateBarcodeScreen({super.key, required this.barcodeType});

  @override
  State<CreateBarcodeScreen> createState() => _CreateBarcodeScreenState();
}

class _CreateBarcodeScreenState extends State<CreateBarcodeScreen> implements TopBarClickListener {
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
                              color: CustomAppColor.of(context).bgCard,
                              borderRadius: BorderRadius.circular(12.setHeight),
                              border: Border.all(
                                color: CustomAppColor.of(context).containerBorder,
                                width: 1,
                              ),
                            ),
                            padding: EdgeInsets.all(16.setWidth),
                            child: Column(
                              children: [
                                SizedBox(height: 40.setHeight),

                                // Input Field
                                _buildInputField(widget.barcodeType['type']),

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
                        child: Center(child: _buildBarcodeTypeIcon()),
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
    return widget.barcodeType['name'];
    /* switch (widget.barcodeType['type']) {
      case Constant.toolISBN:
        return Languages.of(context).txtCreateISBNBarcode;
      case Constant.toolEAN8:
        return Languages.of(context).txtCreateEAN8Barcode;
      case Constant.toolEAN13:
        return Languages.of(context).txtCreateEAN13Barcode;
      case Constant.toolUPCA:
        return Languages.of(context).txtCreateUPCABarcode;
      case Constant.toolUPCE:
        return Languages.of(context).txtCreateUPCEBarcode;
      case Constant.toolCODE39:
        return Languages.of(context).txtCreateCODE39Barcode;
      case Constant.toolCODE93:
        return Languages.of(context).txtCreateCODE93Barcode;
      case Constant.toolCODE128:
        return Languages.of(context).txtCreateCODE128Barcode;
      case Constant.toolITF:
        return Languages.of(context).txtCreateITFBarcode;
      case Constant.toolPDF417:
        return Languages.of(context).txtCreatePDF417Barcode;
      case Constant.toolCODEBAR:
        return Languages.of(context).txtCreateCODEBARBarcode;
      case Constant.toolDATAMATRIX:
        return Languages.of(context).txtCreateDATAMATRIXBarcode;
      case Constant.toolAZTEC:
        return Languages.of(context).txtCreateAZTECBarcode;
      default:
        return Languages.of(context).txtCreateBarcode;
    } */
  }

  Widget _buildBarcodeTypeIcon() {
    return Container(
      width: 84.setWidth,
      height: 84.setWidth,
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScreen,
        shape: BoxShape.circle,
        border: Border.all(
          color: CustomAppColor.of(context).containerBorder,
          width: 1,
        ),
      ),
      child: Center(
          child: Image.asset(
        widget.barcodeType['icon'],
        width: 48.setWidth,
        height: 40.setWidth,
      )),
    );
  }

  Widget _buildInputField(String barcodeType) {
    switch (barcodeType) {
      case Constant.toolISBN:
        return CommonTextFormField(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtPleaseType12Or13Digits,
        );
      case Constant.toolEAN8:
        return CommonTextFormField(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtPleaseType8Digits,
        );
      case Constant.toolEAN13:
        return CommonTextFormField(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtPleaseType13Digits,
        );
      case Constant.toolUPCE:
        return CommonTextFormField(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtPleaseTypeUPCE,
        );
      case Constant.toolUPCA:
        return CommonTextFormField(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtPleaseTypeUPCA,
        );
      case Constant.toolCODE39:
        return CommonTextFormField(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtPleaseTypeAlphabetsAndNumbers,
        );
      case Constant.toolCODE93:
        return CommonTextFormField(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtPleaseTypeAlphabetsAndNumbersOrSomeCharacters,
          maxLines: 6,
          keyboardType: TextInputType.multiline,
        );
      case Constant.toolCODE128:
        return CommonTextFormField(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtPleaseTypeAlphabetsAndNumbers,
          maxLines: 6,
          keyboardType: TextInputType.multiline,
        );
      case Constant.toolITF:
        return CommonTextFormField(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtPleaseTypeEvenDigits,
        );
      case Constant.toolPDF417:
        return CommonTextFormField(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtPleaseTypeAlphabetsAndNumbersAndCharacters,
        );
      case Constant.toolCODEBAR:
        return CommonTextFormField(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtPleaseTypeCodeBarDigits,
        );
      case Constant.toolDATAMATRIX:
        return CommonTextFormField(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtPleaseTypeAlphabetsAndNumbers,
        );
      case Constant.toolAZTEC:
        return CommonTextFormField(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtPleaseTypeAlphabetsAndNumbers,
        );
      default:
        return CommonTextFormField(
          controller: TextEditingController(),
          hintText: Languages.of(context).txtEnterSomething,
        );
    }
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
          child: CommonButton(
            onTap: _onGeneratePressed,
            text: Languages.of(context).txtGenerate,
            buttonColor: CustomAppColor.of(context).primary,
            buttonTextColor: CustomAppColor.of(context).white,
            height: 40.setHeight,
            buttonTextSize: 14.setFontSize,
            buttonTextWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  void _onResetPressed() {}

  void _onGeneratePressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => BarcodeResultScreen(barcodeType: widget.barcodeType)));
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
