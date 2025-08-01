import 'package:flutter/material.dart';
import 'package:qr_scanner_app_package/utils/constant.dart';
import 'package:qr_scanner_app_package/utils/sizer_utils.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../../dialogs/bottom_sheet/select_color_bottom_sheet.dart';

enum ModuleShape { square, round }

class QrCodeSettingScreen extends StatefulWidget {
  const QrCodeSettingScreen({super.key});

  @override
  State<QrCodeSettingScreen> createState() => _QrCodeSettingScreenState();
}

class _QrCodeSettingScreenState extends State<QrCodeSettingScreen> implements TopBarClickListener {
  ValueNotifier<ModuleShape> selectedShape = ValueNotifier(ModuleShape.square);
  ValueNotifier<ModuleShape> selectedEyeBallShape = ValueNotifier(ModuleShape.square);
  ValueNotifier<Color> selectedColor = ValueNotifier(Colors.black);
  ValueNotifier<Color> selectedEyeBallColor = ValueNotifier(Colors.black);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtQrCodeSetting,
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(24.setWidth),
                  child: Wrap(
                    children: [
                      Stack(
                        children: [
                          Wrap(
                            children: [
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(top: 42.setHeight),
                                decoration: BoxDecoration(
                                  color: CustomAppColor.of(context).bgScreen,
                                  borderRadius: BorderRadius.circular(12.setHeight),
                                  border: Border.all(
                                    color: CustomAppColor.of(context).containerBorder,
                                    width: 1,
                                  ),
                                ),
                                padding: EdgeInsets.all(16.setWidth),
                                child: Column(
                                  children: [
                                    SizedBox(height: 30.setHeight),
                                    Image.asset(
                                      AppAssets.imgDummyQr,
                                      width: double.infinity,
                                      fit: BoxFit.contain,
                                      color: CustomAppColor.of(context).txtBlack,
                                    ),
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
                      _buildModuleShapeEyeBallShape(),
                      CommonButton(
                        text: Languages.of(context).txtApply.toUpperCase(),
                        buttonColor: CustomAppColor.of(context).primary,
                        buttonTextColor: CustomAppColor.of(context).txtWhite,
                        height: 45.setHeight,
                        width: double.infinity,
                        mTop: 40.setHeight,
                        mLeft: 20.setWidth,
                        mRight: 20.setWidth,
                        buttonTextSize: 16.setFontSize,
                        buttonTextWeight: FontWeight.w600,
                        pHorizontal: 10.setWidth,
                        onTap: () {},
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

  Widget _buildModuleShapeEyeBallShape() {
    return Container(
      margin: EdgeInsets.only(top: 20.setHeight),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScreen,
        border: Border.all(
          color: CustomAppColor.of(context).containerBorder,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12.setHeight),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 16.setHeight),
      child: Column(
        children: [
          _buildModuleShape(),
          SizedBox(height: 15.setHeight),
          Divider(
            color: CustomAppColor.of(context).containerBorder,
            height: 1,
          ),
          SizedBox(height: 15.setHeight),
          _buildEyeBallShape(),
        ],
      ),
    );
  }

  Widget _buildModuleShape() {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: Languages.of(context).txtModuleShape,
                  fontSize: 16.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ValueListenableBuilder<ModuleShape>(
                        valueListenable: selectedShape,
                        builder: (context, currentShape, child) {
                          return SizedBox(
                            width: 20.setWidth,
                            height: 20.setHeight,
                            child: Radio<ModuleShape>(
                              value: ModuleShape.square,
                              groupValue: currentShape,
                              activeColor: CustomAppColor.of(context).primary,
                              fillColor: WidgetStateProperty.all(CustomAppColor.of(context).primary),
                              onChanged: (ModuleShape? value) {
                                if (value != null) {
                                  selectedShape.value = value;
                                }
                              },
                            ),
                          );
                        },
                      ),
                      SizedBox(width: 10.setWidth),
                      CommonText(
                        text: Languages.of(context).txtSquare,
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w500,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                      SizedBox(width: 10.setWidth),
                      ValueListenableBuilder<ModuleShape>(
                        valueListenable: selectedShape,
                        builder: (context, currentShape, child) {
                          return SizedBox(
                            width: 20.setWidth,
                            height: 20.setHeight,
                            child: Radio<ModuleShape>(
                              value: ModuleShape.round,
                              groupValue: currentShape,
                              activeColor: CustomAppColor.of(context).primary,
                              fillColor: WidgetStateProperty.all(CustomAppColor.of(context).primary),
                              onChanged: (ModuleShape? value) {
                                if (value != null) {
                                  selectedShape.value = value;
                                }
                              },
                            ),
                          );
                        },
                      ),
                      SizedBox(width: 10.setWidth),
                      CommonText(
                        text: Languages.of(context).txtRound,
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w500,
                        textColor: CustomAppColor.of(context).txtBlack,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.setHeight),
              ],
            ),
          ),
          Column(
            children: [
              CommonText(
                text: Languages.of(context).txtColor,
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              SizedBox(height: 10.setHeight),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => SelectColorBottomSheetDialog(
                      initialColor: selectedColor.value,
                      onColorSelected: (color) {
                        selectedColor.value = color;
                      },
                    ),
                  );
                },
                child: ValueListenableBuilder<Color>(
                  valueListenable: selectedColor,
                  builder: (context, color, child) {
                    return Container(
                      width: 30.setWidth,
                      height: 30.setHeight,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildEyeBallShape() {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: Languages.of(context).txtEyeBallShape,
                  fontSize: 16.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
                SizedBox(height: 10.setHeight),
                Row(
                  children: [
                    ValueListenableBuilder<ModuleShape>(
                      valueListenable: selectedEyeBallShape,
                      builder: (context, currentShape, child) {
                        return SizedBox(
                          width: 20.setWidth,
                          height: 20.setHeight,
                          child: Radio<ModuleShape>(
                            value: ModuleShape.square,
                            groupValue: currentShape,
                            activeColor: CustomAppColor.of(context).primary,
                            fillColor: WidgetStateProperty.all(CustomAppColor.of(context).primary),
                            onChanged: (ModuleShape? value) {
                              if (value != null) {
                                selectedEyeBallShape.value = value;
                              }
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(width: 10.setWidth),
                    CommonText(
                      text: Languages.of(context).txtSquare,
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                    SizedBox(width: 10.setWidth),
                    ValueListenableBuilder<ModuleShape>(
                      valueListenable: selectedEyeBallShape,
                      builder: (context, currentShape, child) {
                        return SizedBox(
                          width: 20.setWidth,
                          height: 20.setHeight,
                          child: Radio<ModuleShape>(
                            value: ModuleShape.round,
                            groupValue: currentShape,
                            activeColor: CustomAppColor.of(context).primary,
                            fillColor: WidgetStateProperty.all(CustomAppColor.of(context).primary),
                            onChanged: (ModuleShape? value) {
                              if (value != null) {
                                selectedEyeBallShape.value = value;
                              }
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(width: 10.setWidth),
                    CommonText(
                      text: Languages.of(context).txtRound,
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              CommonText(
                text: Languages.of(context).txtColor,
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              SizedBox(height: 10.setHeight),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => SelectColorBottomSheetDialog(
                      initialColor: selectedEyeBallColor.value,
                      onColorSelected: (color) {
                        selectedEyeBallColor.value = color;
                      },
                    ),
                  );
                },
                child: ValueListenableBuilder<Color>(
                  valueListenable: selectedEyeBallColor,
                  builder: (context, color, child) {
                    return Container(
                      width: 30.setWidth,
                      height: 30.setHeight,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildQrTypeIcon() {
    return Container(
      width: 84.setWidth,
      height: 84.setWidth,
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScreen,
        border: Border.all(
          color: CustomAppColor.of(context).containerBorder,
          width: 1,
        ),
        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.all(20.setHeight),
      child: Center(
        child: Image.asset(AppAssets.icQrCodeSetting),
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
