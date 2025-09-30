import 'package:flutter/material.dart';
import 'package:stoxy_app_package/dialogs/alerts/order_received_dialog.dart';
import 'package:stoxy_app_package/interfaces/top_bar_click_listener.dart';
import 'package:stoxy_app_package/ui/home/view/home_screen.dart';
import 'package:stoxy_app_package/utils/sizer_utils.dart';
import 'package:stoxy_app_package/utils/utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class PreviewSellScreen extends StatefulWidget {
  final WishListItemData data;

  static Route<void> route({required WishListItemData data}) {
    return MaterialPageRoute(builder: (_) => PreviewSellScreen(data: data));
  }

  const PreviewSellScreen({super.key, required this.data});

  @override
  State<PreviewSellScreen> createState() => _PreviewSellScreenState();
}

class _PreviewSellScreenState extends State<PreviewSellScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: Container(
          decoration: BoxDecoration(
            image: getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: true)
                ? null
                : DecorationImage(
                    image: AssetImage(AppAssets.imgCommonBackground),
                    fit: BoxFit.fill,
                  ),
          ),
          child: Column(
            children: [
              TopBar(
                this,
                title: Languages.of(context).txtPreviewSell,
                isShowBack: true,
              ),
              Expanded(
                child: Column(
                  children: [
                    _stockDetailsView(),
                    SizedBox(height: 10.setHeight),
                    _costDetailsView(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
                child: CommonButton(
                  text: Languages.of(context).txtSellNow,
                  gradient: CustomAppColor.of(context).primaryGradient,
                  onTap: () {
                    showDialog(
                        context: context,
                        barrierColor: CustomAppColor.of(context).black.withOpacityPercent(0.3),
                        builder: (context) => OrderReceivedDialog(
                              title: widget.data.company,
                              message: Languages.of(context).txtYourAccountIsReadyToUse,
                              icon: widget.data.stockIcon,
                              onComplete: () {},
                            ));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }

  Widget _stockDetailsView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 5.setHeight),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 17.setHeight),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgCard,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  widget.data.stockIcon,
                  width: 48.setWidth,
                  height: 48.setHeight,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 12.setWidth),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: widget.data.symbol,
                      fontSize: 16.setFontSize,
                      fontWeight: FontWeight.w600,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                    SizedBox(height: 4.setHeight),
                    CommonText(
                      text: widget.data.company,
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w400,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                  ],
                ),
              ],
            ),
            CommonText(
              text: "Buy In Dollar",
              fontSize: 14.setFontSize,
              fontWeight: FontWeight.w400,
              textColor: CustomAppColor.of(context).txtBlack,
            ),
          ],
        ),
      ),
    );
  }

  Widget _costDetailsView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 5.setHeight),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 17.setWidth, vertical: 20.setHeight),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgCard,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: Languages.of(context).txtMarketPrice,
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w500,
                  fontFamily: Constant.fontFamilyMedium,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
                SizedBox(height: 4.setHeight),
                CommonText(
                  text: "\$254,48",
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
              ],
            ),
            SizedBox(height: 18.setHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: Languages.of(context).txtNflxShares,
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w500,
                  fontFamily: Constant.fontFamilyMedium,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
                SizedBox(height: 4.setHeight),
                CommonText(
                  text: "0.016342576",
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
              ],
            ),
            Divider(
              height: 35.setHeight,
              thickness: 0.3,
              color: CustomAppColor.of(context).greyIndicator,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: Languages.of(context).txtNflxAmount,
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w500,
                  fontFamily: Constant.fontFamilyMedium,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
                SizedBox(height: 4.setHeight),
                CommonText(
                  text: "\$1000.00",
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
              ],
            ),
            SizedBox(height: 18.setHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: Languages.of(context).txtTradingFee,
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w500,
                  fontFamily: Constant.fontFamilyMedium,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
                SizedBox(height: 4.setHeight),
                CommonText(
                  text: "\$30.00",
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
              ],
            ),
            Divider(
              height: 45.setHeight,
              thickness: 0.3,
              color: CustomAppColor.of(context).greyIndicator,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: Languages.of(context).txtTotalCost,
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w500,
                  fontFamily: Constant.fontFamilyMedium,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
                SizedBox(height: 4.setHeight),
                CommonText(
                  text: "\$1030.00",
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).primary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
