import 'package:flutter/material.dart';
import 'package:qr_scanner_app_package/interfaces/top_bar_click_listener.dart';
import 'package:qr_scanner_app_package/utils/app_assets.dart';
import 'package:qr_scanner_app_package/utils/sizer_utils.dart';
import 'package:qr_scanner_app_package/widgets/text/common_text.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../dashboard/view/dashboard_screen.dart';

class QrCodeResultScreen extends StatefulWidget {
  final Map<String, dynamic> qrType;
  const QrCodeResultScreen({super.key, required this.qrType});

  @override
  State<QrCodeResultScreen> createState() => _QrCodeResultScreenState();
}

class _QrCodeResultScreenState extends State<QrCodeResultScreen> implements TopBarClickListener {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtQrCodeResult,
              isShowBack: true,
              isShowScan: true,
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
                              SizedBox(height: 50.setHeight),
                              Center(
                                child: CommonText(
                                  text: widget.qrType['name'],
                                  fontSize: 16.setFontSize,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.center,
                                  textColor: CustomAppColor.of(context).txtBlack,
                                ),
                              ),
                              SizedBox(height: 20.setHeight),
                              Image.asset(
                                AppAssets.imgDummyQr,
                                height: 200.setHeight,
                                width: 200.setWidth,
                                color: CustomAppColor.of(context).txtBlack,
                              ),
                              SizedBox(height: 20.setHeight),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 20.setHeight),
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
                                      borderRadius: BorderRadius.circular(15.setHeight),
                                    ),
                                    child: Icon(
                                      Icons.download,
                                      size: 28.setFontSize,
                                      color: CustomAppColor.of(context).txtWhite,
                                    ),
                                  ),
                                  SizedBox(height: 10.setHeight),
                                  CommonText(
                                    text: Languages.of(context).txtSave,
                                    fontSize: 12.setFontSize,
                                    fontWeight: FontWeight.w500,
                                    textColor: CustomAppColor.of(context).txtBlack,
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
                                      borderRadius: BorderRadius.circular(15.setHeight),
                                    ),
                                    child: Icon(
                                      Icons.share,
                                      size: 28.setFontSize,
                                      color: CustomAppColor.of(context).txtWhite,
                                    ),
                                  ),
                                  SizedBox(height: 10.setHeight),
                                  CommonText(
                                    text: Languages.of(context).txtShare,
                                    fontSize: 12.setFontSize,
                                    fontWeight: FontWeight.w500,
                                    textColor: CustomAppColor.of(context).txtBlack,
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
                                      borderRadius: BorderRadius.circular(15.setHeight),
                                    ),
                                    padding: EdgeInsets.all(16.setWidth),
                                    child: Image.asset(
                                      AppAssets.icTabFavoriteSelected,
                                      color: CustomAppColor.of(context).txtWhite,
                                      height: 24.setHeight,
                                      width: 24.setWidth,
                                    ),
                                  ),
                                  SizedBox(height: 10.setHeight),
                                  CommonText(
                                    text: Languages.of(context).txtFavorite,
                                    fontSize: 12.setFontSize,
                                    fontWeight: FontWeight.w500,
                                    textColor: CustomAppColor.of(context).txtBlack,
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
                                      borderRadius: BorderRadius.circular(15.setHeight),
                                    ),
                                    child: Icon(
                                      Icons.delete_rounded,
                                      size: 28.setFontSize,
                                      color: CustomAppColor.of(context).txtWhite,
                                    ),
                                  ),
                                  SizedBox(height: 10.setHeight),
                                  CommonText(
                                    text: Languages.of(context).txtDelete,
                                    fontSize: 12.setFontSize,
                                    fontWeight: FontWeight.w500,
                                    textColor: CustomAppColor.of(context).txtBlack,
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
                      child: Center(child: _buildQrTypeIcon()),
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

  Widget _buildQrTypeIcon() {
    return SizedBox(
      width: 84.setWidth,
      height: 84.setWidth,
      child: Center(
        child: Image.asset(widget.qrType['icon']),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    switch (name) {
      case Constant.strBack:
        Navigator.pop(context);
        break;
      case Constant.strScan:
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const DashboardScreen()), (route) => false);
        break;
    }
  }
}
