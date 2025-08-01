import 'package:flutter/material.dart';
import 'package:qr_scanner_app_package/utils/sizer_utils.dart';
import 'package:qr_scanner_app_package/widgets/button/common_button.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class ProVersionScreen extends StatefulWidget {
  const ProVersionScreen({super.key});

  @override
  State<ProVersionScreen> createState() => _ProVersionScreenState();
}

class _ProVersionScreenState extends State<ProVersionScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtProVersion,
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 16.setHeight),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Wrap(
                          children: [
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 62.setHeight),
                              decoration: BoxDecoration(
                                color: CustomAppColor.of(context).bgCard,
                                borderRadius: BorderRadius.circular(12.setHeight),
                                border: Border.all(
                                  color: CustomAppColor.of(context).containerBorder,
                                  width: 1,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 12.setHeight),
                              child: Column(
                                children: [
                                  SizedBox(height: 80.setHeight),
                                  CommonText(
                                    text: Languages.of(context).txtSubscribeToUnlockAllTheFunctionalityOfTheApplication,
                                    fontSize: 12.setFontSize,
                                    fontWeight: FontWeight.w500,
                                    textColor: CustomAppColor.of(context).txtDarkGray,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 16.setHeight),
                                  _buildNoAdsWidget(),
                                  SizedBox(height: 8.setHeight),
                                  Divider(
                                    color: CustomAppColor.of(context).containerBorder,
                                    thickness: 1,
                                  ),
                                  SizedBox(height: 8.setHeight),
                                  _buildCustomizeWidget(),
                                  SizedBox(height: 8.setHeight),
                                  Divider(
                                    color: CustomAppColor.of(context).containerBorder,
                                    thickness: 1,
                                  ),
                                  SizedBox(height: 8.setHeight),
                                  _buildCustomizeDesignWidget(),
                                  SizedBox(height: 30.setHeight),
                                  _buildProVersionWidget(),
                                  SizedBox(height: 30.setHeight),
                                  _buildPrivacyPolicyWidget(),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 125.setWidth,
                          height: 125.setWidth,
                          decoration: BoxDecoration(
                            color: CustomAppColor.of(context).primary,
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(20.setHeight),
                          child: Center(
                            child: Image.asset(
                              AppAssets.icPro,
                              fit: BoxFit.contain,
                              color: CustomAppColor.of(context).txtWhite,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 30.setHeight),
                    CommonButton(
                      text: Languages.of(context).txtContinueWithProVersion,
                      buttonColor: CustomAppColor.of(context).primary,
                      buttonTextColor: CustomAppColor.of(context).txtWhite,
                      height: 50.setHeight,
                      width: double.infinity,
                      buttonTextSize: 16.setFontSize,
                      buttonTextWeight: FontWeight.w600,
                      pHorizontal: 10.setWidth,
                      onTap: () {},
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

  Widget _buildNoAdsWidget() {
    return Row(
      children: [
        Container(
          width: 50.setWidth,
          height: 50.setWidth,
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).primary,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(10.setHeight),
          child: Image.asset(
            AppAssets.icNoAds,
            fit: BoxFit.contain,
            color: CustomAppColor.of(context).txtWhite,
          ),
        ),
        SizedBox(width: 16.setWidth),
        CommonText(
          text: Languages.of(context).txtNoAds,
          fontSize: 14.setFontSize,
          fontWeight: FontWeight.w500,
          textColor: CustomAppColor.of(context).txtBlack,
          textAlign: TextAlign.start,
        ),
        SizedBox(width: 16.setWidth),
      ],
    );
  }

  Widget _buildCustomizeWidget() {
    return Row(
      children: [
        Container(
          width: 50.setWidth,
          height: 50.setWidth,
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).primary,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(10.setHeight),
          child: Image.asset(
            AppAssets.icCustomize,
            fit: BoxFit.contain,
            color: CustomAppColor.of(context).txtWhite,
          ),
        ),
        SizedBox(width: 16.setWidth),
        CommonText(
          text: Languages.of(context).txtCustomizeQRColors,
          fontSize: 14.setFontSize,
          fontWeight: FontWeight.w500,
          textColor: CustomAppColor.of(context).txtBlack,
          textAlign: TextAlign.start,
        ),
        SizedBox(width: 16.setWidth),
      ],
    );
  }

  Widget _buildCustomizeDesignWidget() {
    return Row(
      children: [
        Container(
          width: 50.setWidth,
          height: 50.setWidth,
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).primary,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(10.setHeight),
          child: Image.asset(
            AppAssets.icCustomizeQrDesign,
            fit: BoxFit.contain,
            color: CustomAppColor.of(context).txtWhite,
          ),
        ),
        SizedBox(width: 16.setWidth),
        CommonText(
          text: Languages.of(context).txtCustomizeQrDesign,
          fontSize: 14.setFontSize,
          fontWeight: FontWeight.w500,
          textColor: CustomAppColor.of(context).txtBlack,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }

  Widget _buildProVersionWidget() {
    return CommonText(
      text: Languages.of(context).txtProVersionMsg,
      fontSize: 12.setFontSize,
      fontWeight: FontWeight.w500,
      textColor: CustomAppColor.of(context).txtDarkGray,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildPrivacyPolicyWidget() {
    return Row(
      children: [
        CommonText(
          text: Languages.of(context).txtPrivacyPolicy,
          fontSize: 10.setFontSize,
          fontWeight: FontWeight.w600,
          textColor: CustomAppColor.of(context).primary,
          textAlign: TextAlign.start,
        ),
        const Spacer(),
        CommonText(
          text: Languages.of(context).txtTermsAndConditions,
          fontSize: 10.setFontSize,
          fontWeight: FontWeight.w600,
          textColor: CustomAppColor.of(context).primary,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
