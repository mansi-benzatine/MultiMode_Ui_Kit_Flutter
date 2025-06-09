import 'package:flutter/material.dart';
import 'package:goozzy_e_commerce_screens_app_package/utils/utils.dart';

import '../../../../../../interfaces/top_bar_click_listener.dart';
import '../../../../../../utils/constant.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../utils/string_constant.dart';
import '../../../widgets/bottom_sheet/bottom_sheet.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/topbar/topbar.dart';
import '../../app/my_app.dart';

class OrderSummaryScreen extends StatelessWidget implements TopBarClickListener {
  const OrderSummaryScreen({super.key});
  static Route route() {
    return MaterialPageRoute(builder: (context) => const OrderSummaryScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgTopBar,
        body: Column(
          children: [
            IgnorePointer(
              ignoring: true,
              child: TopBar(
                this,
                isShowBack: true,
                title: Languages.of(context).orderSummary,
                textColor: CustomAppColor.of(context).txtBlack,
                topBarColor: CustomAppColor.of(context).bgBlackWhiteScaffold,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _senderInformation(context),
                    Padding(
                      padding: EdgeInsets.only(top: AppSizes.setHeight(10)),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(12), vertical: AppSizes.setHeight(12)),
                        color: CustomAppColor.of(context).bgPurpleBlack,
                        child: CommonText(
                          text: Languages.of(context).thisInfoWillBeDisplayedInThePackageSent,
                          fontWeight: FontWeight.w500,
                          fontSize: AppSizes.setFontSize(14),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: AppSizes.setHeight(10)),
                      child: _estimateDate(context),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: AppSizes.setHeight(10)),
                      child: _cartProducts(context),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: AppSizes.setHeight(10)),
                      child: _supplierDetail(context),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: AppSizes.setHeight(10)),
                      child: _priceBreakUp(context),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: AppSizes.setHeight(10)),
                      child: _shippingAddress(context),
                    ),
                  ],
                ),
              ),
            ),
            _totalPrice(context),
          ],
        ),
      ),
    );
  }

  Widget _priceBreakUp(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).bgScaffold,
      padding: EdgeInsets.all(AppSizes.setWidth(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).priceBreakUp,
            fontSize: AppSizes.setFontSize(16),
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: AppSizes.setHeight(16)),
          _priceRow(
            context,
            Languages.of(context).productCharges,
            "\$299",
          ),
          _priceRow(
            context,
            Languages.of(context).shippingCharges,
            "+ \$0",
            showInfoIcon: true,
          ),
          _priceRow(
            context,
            Languages.of(context).codCharges,
            "+ \$0",
          ),
          _priceRow(
            context,
            Languages.of(context).firstOrderDiscount,
            "- \$67",
            showInfoIcon: true,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(10)),
            child: Divider(thickness: 1, color: CustomAppColor.of(context).txtGrey.withOpacityPercent(0.5)),
          ),
          _priceRow(
            context,
            Languages.of(context).orderTotal,
            "\$232",
            isBold: true,
          ),
          _priceRow(
            context,
            Languages.of(context).finalCustomerPrice,
            "\$237",
            isBold: true,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(10)),
            child: Divider(thickness: 1, color: CustomAppColor.of(context).txtGrey.withOpacityPercent(0.5)),
          ),
          _priceRow(context, Languages.of(context).marginEarned, "\$5", isBold: true, isGreenColor: true),
        ],
      ),
    );
  }

  Widget _priceRow(BuildContext context, String label, String value, {bool isBold = false, bool showInfoIcon = false, bool isGreenColor = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CommonText(
                text: label,
                fontSize: AppSizes.setFontSize(14),
                fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
                textColor: isBold ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).txtGrey,
              ),
              if (showInfoIcon) ...[
                SizedBox(width: AppSizes.setWidth(4)),
                Icon(Icons.info_outline, size: AppSizes.setFontSize(14), color: Colors.grey),
              ]
            ],
          ),
          CommonText(
            text: value,
            textColor: isGreenColor ? CustomAppColor.of(context).green : CustomAppColor.of(context).txtBlack,
            fontSize: AppSizes.setFontSize(14),
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
          ),
        ],
      ),
    );
  }

  Widget _estimateDate(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).bgScaffold,
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(18)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.icEstimateDate,
                height: AppSizes.setHeight(37),
                width: AppSizes.setWidth(37),
              ),
              SizedBox(width: AppSizes.setWidth(6)),
              CommonText(
                text: Languages.of(context).estimatedDeliveryBy,
                fontSize: AppSizes.setFontSize(14),
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtGrey,
              )
            ],
          ),
          SizedBox(height: AppSizes.setWidth(10)),
          CommonText(
            text: AppStrings.saturdayMay,
            fontSize: AppSizes.setFontSize(24),
            fontWeight: FontWeight.w700,
          )
        ],
      ),
    );
  }

  Widget _senderInformation(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(12), horizontal: AppSizes.setWidth(22)),
      color: CustomAppColor.of(context).bgScaffold,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).senderInformation,
                fontSize: AppSizes.setFontSize(16),
                fontWeight: FontWeight.w700,
              ),
              CommonText(
                text: Languages.of(context).change.toUpperCase(),
                fontSize: AppSizes.setFontSize(14),
                fontWeight: FontWeight.w700,
                textColor: CustomAppColor.of(context).txtPurple,
              )
            ],
          ),
          SizedBox(height: AppSizes.setHeight(16)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: AppStrings.devin,
                fontSize: AppSizes.setFontSize(15),
                fontWeight: FontWeight.w600,
              ),
              CommonText(
                text: AppStrings.phoneNumber,
                fontSize: AppSizes.setFontSize(14),
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtGrey,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cartProducts(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(18), horizontal: AppSizes.setWidth(20)),
      color: CustomAppColor.of(context).bgScaffold,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  AppAssets.imgOrangeSaree6,
                  height: AppSizes.setHeight(89),
                  width: AppSizes.setWidth(89),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(width: AppSizes.setWidth(12)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: AppStrings.anniDesignerWomenArt,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w700,
                      fontSize: AppSizes.setFontSize(14),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: AppSizes.setHeight(8)),
                    _infoRow(context, Languages.of(context).price, "\$299"),
                    SizedBox(height: AppSizes.setHeight(8)),
                    _infoRow(context, Languages.of(context).mrp, "\$599", isStrikethrough: true),
                    SizedBox(height: AppSizes.setHeight(8)),
                    _infoRow(context, Languages.of(context).size, "M"),
                    SizedBox(height: AppSizes.setHeight(8)),
                    _infoRow(context, Languages.of(context).qty, "1"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoRow(BuildContext context, String label, String value, {bool isBold = false, bool isStrikethrough = false}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: AppSizes.setWidth(40),
          child: CommonText(
            text: label,
            fontWeight: FontWeight.w500,
            fontSize: AppSizes.setFontSize(16),
            textColor: CustomAppColor.of(context).txtGrey,
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(width: 12),
        CommonText(
          text: value,
          fontWeight: isBold ? FontWeight.w700 : FontWeight.w600,
          fontSize: AppSizes.setFontSize(16),
          textDecoration: isStrikethrough ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ],
    );
  }

  Widget _supplierDetail(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).bgScaffold,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(22), vertical: AppSizes.setHeight(24)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).supplier,
                textColor: CustomAppColor.of(context).txtGrey,
                fontWeight: FontWeight.w600,
                fontSize: AppSizes.setFontSize(15),
              ),
              CommonText(
                text: AppStrings.princeDyeingAndProcessing.toUpperCase(),
                fontWeight: FontWeight.w600,
                fontSize: AppSizes.setFontSize(15),
              )
            ],
          ),
          SizedBox(height: AppSizes.setHeight(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).paymentMethod,
                textColor: CustomAppColor.of(context).txtGrey,
                fontWeight: FontWeight.w600,
                fontSize: AppSizes.setFontSize(14),
              ),
              CommonText(
                text: Languages.of(context).cashOnDelivery,
                fontWeight: FontWeight.w600,
                fontSize: AppSizes.setFontSize(14),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _shippingAddress(BuildContext context) {
    return Container(
        width: AppSizes.fullWidth,
        padding: EdgeInsets.all(AppSizes.setWidth(16)),
        color: CustomAppColor.of(context).bgScaffold,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CommonText(
              text: Languages.of(context).shippingAddress,
              fontWeight: FontWeight.w700,
              fontSize: AppSizes.setFontSize(18),
            ),
            SizedBox(height: AppSizes.setHeight(24)),
            CommonText(
              text: AppStrings.devin,
              fontWeight: FontWeight.w500,
              fontSize: AppSizes.setFontSize(16),
              textColor: CustomAppColor.of(context).txtGrey,
            ),
            SizedBox(height: AppSizes.setHeight(16)),
            CommonText(
              text: AppStrings.address,
              fontWeight: FontWeight.w500,
              fontSize: AppSizes.setFontSize(16),
              textColor: CustomAppColor.of(context).txtGrey,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: AppSizes.setHeight(16)),
            CommonText(
              text: AppStrings.phoneNumber,
              fontWeight: FontWeight.w500,
              fontSize: AppSizes.setFontSize(16),
              textColor: CustomAppColor.of(context).txtGrey,
            ),
          ],
        ));
  }

  Widget _totalPrice(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgBlackWhiteScaffold,
        border: Border(
          top: BorderSide(
            color: CustomAppColor.of(context).txtGrey.withOpacityPercent(0.5),
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(16), horizontal: AppSizes.setWidth(18)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  CommonText(
                    text: "\$232 + ",
                    fontSize: AppSizes.setFontSize(18),
                    fontWeight: FontWeight.w700,
                  ),
                  CommonText(
                    text: "\$5",
                    fontSize: AppSizes.setFontSize(18),
                    fontWeight: FontWeight.w700,
                    textColor: CustomAppColor.of(context).green,
                  ),
                ],
              ),
              SizedBox(height: AppSizes.setHeight(6)),
              CommonText(
                text: Languages.of(context).viewPriceDetails.toUpperCase(),
                fontSize: AppSizes.setFontSize(18),
                fontWeight: FontWeight.w700,
                textColor: CustomAppColor.of(context).txtPurple,
              ),
            ],
          ),
          IgnorePointer(
            ignoring: true,
            child: CommonButton(
              width: AppSizes.setWidth(133),
              height: AppSizes.setHeight(44),
              radius: 4,
              btnText: Languages.of(context).txtContinue,
              onTap: () => orderSuccessBottomSheet(context),
            ),
          )
        ],
      ),
    );
  }

  void orderSuccessBottomSheet(BuildContext context) {
    customBottomSheet(
      isPaddingRequired: false,
      isDone: false,
      context: context,
      title: Languages.of(context).orderSuccess.toUpperCase(),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(25)),
            child: Image.asset(
              AppAssets.imgOrderSuccessfully,
              height: AppSizes.setHeight(194),
              width: AppSizes.setWidth(250),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20), vertical: AppSizes.setHeight(10)),
            child: CommonText(
              text: Languages.of(context).yourOrderIsSuccessfully,
              fontSize: AppSizes.setFontSize(20),
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.setWidth(20),
              vertical: AppSizes.setHeight(10),
            ),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "You can track the delivery in the ",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: AppSizes.setFontSize(18),
                  color: CustomAppColor.of(context).txtGrey,
                  fontFamily: Constant.fontFamilyUrbanist,
                ),
                children: [
                  TextSpan(
                    text: "\nOrder",
                    style: TextStyle(
                      color: CustomAppColor.of(context).borderPurple,
                      fontWeight: FontWeight.w500,
                      fontSize: AppSizes.setFontSize(18),
                      fontFamily: Constant.fontFamilyUrbanist,
                    ),
                  ),
                  TextSpan(
                    text: " section",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: AppSizes.setFontSize(18),
                      color: CustomAppColor.of(context).txtGrey,
                      fontFamily: Constant.fontFamilyUrbanist,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: AppSizes.setHeight(20), bottom: AppSizes.setHeight(10)), child: const Divider()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20), vertical: AppSizes.setHeight(6)),
            child: CommonButton(
                borderColor: CustomAppColor.of(context).borderPurple,
                buttonColor: CustomAppColor.of(context).bgScaffold,
                radius: 3,
                isButtonShadow: false,
                height: AppSizes.setHeight(44),
                child: CommonText(
                  text: Languages.of(context).goToOrderStatus,
                  textColor: CustomAppColor.of(context).txtPurple,
                  fontSize: AppSizes.setFontSize(16),
                  fontWeight: FontWeight.w600,
                ),
                onTap: () {
                  Navigator.pop(context);
                }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20), vertical: AppSizes.setHeight(6)),
            child: CommonButton(
                radius: 3,
                height: AppSizes.setHeight(44),
                btnText: Languages.of(context).continueShopping,
                onTap: () {
                  Navigator.pop(context);
                  paymentFailed(context);
                }),
          ),
        ],
      ),
    );
  }

  void paymentFailed(BuildContext context) {
    customBottomSheet(
      isPaddingRequired: false,
      isDone: false,
      context: context,
      title: Languages.of(context).paymentFailed.toUpperCase(),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(25)),
            child: Image.asset(
              AppAssets.imgPaymentFailed,
              height: AppSizes.setHeight(194),
              width: AppSizes.setWidth(250),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20), vertical: AppSizes.setHeight(5)),
            child: CommonText(
              text: Languages.of(context).somethingWentWrong,
              fontSize: AppSizes.setFontSize(20),
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20), vertical: AppSizes.setHeight(10)),
            child: CommonText(
              text: Languages.of(context).sorryWeWereNotAbleToProcess,
              fontSize: AppSizes.setFontSize(18),
              fontWeight: FontWeight.w500,
              textColor: CustomAppColor.of(context).txtGrey,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: AppSizes.setHeight(20), bottom: AppSizes.setHeight(10)), child: const Divider()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20), vertical: AppSizes.setHeight(6)),
            child: CommonButton(
                borderColor: CustomAppColor.of(context).borderPurple,
                buttonColor: CustomAppColor.of(context).bgScaffold,
                radius: 3,
                height: AppSizes.setHeight(44),
                isButtonShadow: false,
                child: CommonText(
                  text: Languages.of(context).viewOrderStatus,
                  textColor: CustomAppColor.of(context).txtPurple,
                  fontSize: AppSizes.setFontSize(16),
                  fontWeight: FontWeight.w600,
                ),
                onTap: () {
                  Navigator.pop(context);
                }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20), vertical: AppSizes.setHeight(6)),
            child: CommonButton(
                height: AppSizes.setHeight(44),
                radius: 3,
                btnText: Languages.of(context).tryAgainNow,
                onTap: () {
                  Navigator.pop(context);
                }),
          ),
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {String value = ""}) {
    if (name == AppStrings.back) {
      Navigator.pop(GoozzyECommerceScreensMyApp.navigatorKey.currentState!.context);
    }
  }
}
