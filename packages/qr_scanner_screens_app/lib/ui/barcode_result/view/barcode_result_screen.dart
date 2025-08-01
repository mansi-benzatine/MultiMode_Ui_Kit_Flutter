import 'package:flutter/material.dart';
import 'package:qr_scanner_screens_app_package/utils/sizer_utils.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class BarcodeResultScreen extends StatefulWidget {
  final Map<String, dynamic> barcodeType;

  static Route<void> route({required Map<String, dynamic> barcodeType}) {
    return MaterialPageRoute(
        builder: (_) => BarcodeResultScreen(barcodeType: barcodeType));
  }

  const BarcodeResultScreen({super.key, required this.barcodeType});

  @override
  State<BarcodeResultScreen> createState() => _BarcodeResultScreenState();
}

class _BarcodeResultScreenState extends State<BarcodeResultScreen>
    implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtBarcodeResult,
              isShowBack: true,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(24.setWidth),
                child: Stack(
                  children: [
                    Wrap(
                      children: [
                        Container(
                          width: double.infinity,
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
                              SizedBox(height: 50.setHeight),
                              Center(
                                child: CommonText(
                                  text: widget.barcodeType['name'],
                                  fontSize: 14.setFontSize,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.center,
                                  textColor:
                                      CustomAppColor.of(context).txtBlack,
                                ),
                              ),
                              SizedBox(height: 30.setHeight),
                              Image.asset(
                                AppAssets.icBarcodeDummy,
                                height: 200.setHeight,
                                width: 250.setWidth,
                                color: CustomAppColor.of(context).txtBlack,
                              ),
                              SizedBox(height: 20.setHeight),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.setWidth, vertical: 20.setHeight),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 60.setHeight,
                                    width: 60.setWidth,
                                    decoration: BoxDecoration(
                                      color: CustomAppColor.of(context).primary,
                                      borderRadius:
                                          BorderRadius.circular(15.setHeight),
                                    ),
                                    child: Icon(
                                      Icons.download,
                                      size: 28.setFontSize,
                                      color:
                                          CustomAppColor.of(context).txtWhite,
                                    ),
                                  ),
                                  SizedBox(height: 10.setHeight),
                                  CommonText(
                                    text: Languages.of(context).txtSave,
                                    fontSize: 12.setFontSize,
                                    fontWeight: FontWeight.w500,
                                    textColor:
                                        CustomAppColor.of(context).txtBlack,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 60.setHeight,
                                    width: 60.setWidth,
                                    decoration: BoxDecoration(
                                      color: CustomAppColor.of(context).primary,
                                      borderRadius:
                                          BorderRadius.circular(15.setHeight),
                                    ),
                                    child: Icon(
                                      Icons.share,
                                      size: 28.setFontSize,
                                      color:
                                          CustomAppColor.of(context).txtWhite,
                                    ),
                                  ),
                                  SizedBox(height: 10.setHeight),
                                  CommonText(
                                    text: Languages.of(context).txtShare,
                                    fontSize: 12.setFontSize,
                                    fontWeight: FontWeight.w500,
                                    textColor:
                                        CustomAppColor.of(context).txtBlack,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 60.setHeight,
                                    width: 60.setWidth,
                                    decoration: BoxDecoration(
                                      color: CustomAppColor.of(context).primary,
                                      borderRadius:
                                          BorderRadius.circular(15.setHeight),
                                    ),
                                    padding: EdgeInsets.all(16.setWidth),
                                    child: Image.asset(
                                      AppAssets.icTabFavoriteSelected,
                                      color:
                                          CustomAppColor.of(context).txtWhite,
                                      height: 24.setHeight,
                                      width: 24.setWidth,
                                    ),
                                  ),
                                  SizedBox(height: 10.setHeight),
                                  CommonText(
                                    text: Languages.of(context).txtFavorite,
                                    fontSize: 12.setFontSize,
                                    fontWeight: FontWeight.w500,
                                    textColor:
                                        CustomAppColor.of(context).txtBlack,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 60.setHeight,
                                    width: 60.setWidth,
                                    decoration: BoxDecoration(
                                      color: CustomAppColor.of(context).primary,
                                      borderRadius:
                                          BorderRadius.circular(15.setHeight),
                                    ),
                                    child: Icon(
                                      Icons.delete_rounded,
                                      size: 28.setFontSize,
                                      color:
                                          CustomAppColor.of(context).txtWhite,
                                    ),
                                  ),
                                  SizedBox(height: 10.setHeight),
                                  CommonText(
                                    text: Languages.of(context).txtDelete,
                                    fontSize: 12.setFontSize,
                                    fontWeight: FontWeight.w500,
                                    textColor:
                                        CustomAppColor.of(context).txtBlack,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
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
          ],
        ),
      ),
    );
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

  @override
  void onTopBarClick(String title, {bool value = false}) {
    if (title == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
