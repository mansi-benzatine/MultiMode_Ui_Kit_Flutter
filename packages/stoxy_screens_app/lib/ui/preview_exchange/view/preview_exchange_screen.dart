import 'package:flutter/material.dart';
import 'package:stoxy_screens_app_package/dialogs/alerts/order_exchange_received_dialog.dart';
import 'package:stoxy_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:stoxy_screens_app_package/localization/language/languages.dart';
import 'package:stoxy_screens_app_package/utils/app_assets.dart';
import 'package:stoxy_screens_app_package/utils/app_color.dart';
import 'package:stoxy_screens_app_package/utils/constant.dart';
import 'package:stoxy_screens_app_package/utils/preference.dart';
import 'package:stoxy_screens_app_package/utils/service_locator.dart';
import 'package:stoxy_screens_app_package/utils/sizer_utils.dart';
import 'package:stoxy_screens_app_package/utils/utils.dart';
import 'package:stoxy_screens_app_package/widgets/top_bar/topbar.dart';

import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';

class PreviewExchangeScreen extends StatefulWidget {
  final bool isForDialog;
  static Route<void> route({bool isForDialog = false}) {
    return MaterialPageRoute(
      builder: (_) => PreviewExchangeScreen(isForDialog: isForDialog),
    );
  }

  const PreviewExchangeScreen({super.key, this.isForDialog = false});

  @override
  State<PreviewExchangeScreen> createState() => _PreviewExchangeScreenState();
}

class _PreviewExchangeScreenState extends State<PreviewExchangeScreen> implements TopBarClickListener {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.isForDialog) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          barrierDismissible: false,
          context: context,
          barrierColor: CustomAppColor.of(context).black.withOpacityPercent(0.3),
          builder: (dialogContext) => PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) {
              if (!didPop) {
                Navigator.pop(dialogContext);
                Navigator.pop(context);
              }
            },
            child: OrderExchangeDialog(
              title1: "NFLX",
              title2: "SPOT",
              message: Languages.of(context).txtYourAccountIsReadyToUse,
              icon1: AppAssets.icStockNetflix,
              icon2: AppAssets.icStockSpotify,
              onComplete: () {},
            ),
          ),
        );
      });
    }
  }

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
                title: Languages.of(context).txtPreviewExchange,
                isShowMore: true,
                isShowBack: true,
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.setHeight, vertical: 10.setHeight),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                AppAssets.icStockNetflix,
                                width: 44.setWidth,
                                height: 44.setHeight,
                              ),
                              SizedBox(width: 10.setWidth),
                              CommonText(
                                text: "NFLX",
                                fontWeight: FontWeight.w600,
                                fontSize: 16.setFontSize,
                                textColor: CustomAppColor.of(context).txtBlack,
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            size: 28,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                AppAssets.icStockSpotify,
                                width: 44.setWidth,
                                height: 44.setHeight,
                              ),
                              SizedBox(width: 10.setWidth),
                              CommonText(
                                text: "SPOT",
                                fontWeight: FontWeight.w600,
                                fontSize: 16.setFontSize,
                                textColor: CustomAppColor.of(context).txtBlack,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    _costDetailsView()
                  ],
                ),
              ),
              IgnorePointer(
                ignoring: true,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
                  child: CommonButton(
                    text: Languages.of(context).txtExchangeNow,
                    gradient: CustomAppColor.of(context).primaryGradient,
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierColor: CustomAppColor.of(context).black.withOpacityPercent(0.3),
                        builder: (context) => OrderExchangeDialog(
                          title1: "NFLX",
                          title2: "SPOT",
                          message: Languages.of(context).txtYourAccountIsReadyToUse,
                          icon1: AppAssets.icStockNetflix,
                          icon2: AppAssets.icStockSpotify,
                          onComplete: () {},
                        ),
                      );
                    },
                  ),
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
                  text: Languages.of(context).txtMarketPriceNFLX,
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
                  text: Languages.of(context).txtMarketPriceSpot,
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
                  text: Languages.of(context).txtNumberOfShares,
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
                  text: Languages.of(context).txtAmount,
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
                  text: "\$12,020.00",
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
