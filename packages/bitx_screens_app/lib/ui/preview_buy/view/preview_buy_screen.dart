import 'package:bitx_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:bitx_screens_app/localization/language/languages.dart';
import 'package:bitx_screens_app/ui/home/view/home_screen.dart';
import 'package:bitx_screens_app/utils/app_color.dart';
import 'package:bitx_screens_app/utils/constant.dart';
import 'package:bitx_screens_app/utils/sizer_utils.dart';
import 'package:bitx_screens_app/utils/utils.dart';
import 'package:bitx_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../../dialogs/alerts/order_received_dialog.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';

class PreviewBuyScreen extends StatefulWidget {
  final WishListItemData data;
  static Route<void> route({required WishListItemData data}) {
    return MaterialPageRoute(
      builder: (context) => PreviewBuyScreen(data: data),
    );
  }

  const PreviewBuyScreen({super.key, required this.data});

  @override
  State<PreviewBuyScreen> createState() => _PreviewBuyScreenState();
}

class _PreviewBuyScreenState extends State<PreviewBuyScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtPreviewBuy,
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
                text: Languages.of(context).txtBuyNow,
              ),
            )
          ],
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
                  fontFamily: Constant.fontFamily,
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
                  fontFamily: Constant.fontFamily,
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
                  fontFamily: Constant.fontFamily,
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
                  fontFamily: Constant.fontFamily,
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
                  fontFamily: Constant.fontFamily,
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
