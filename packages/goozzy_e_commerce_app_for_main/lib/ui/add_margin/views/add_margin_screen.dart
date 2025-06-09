import 'package:flutter/material.dart';
import 'package:goozzy_e_commerce_app_package/utils/utils.dart';

import '../../../../../interfaces/top_bar_click_listener.dart';
import '../../../../../ui/add_delivery_address/views/add_delivery_address_screen.dart';
import '../../../../../widgets/textfield/common_textformfield.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../utils/string_constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/topbar/topbar.dart';
import '../../app/my_app.dart';

class AddMarginScreen extends StatelessWidget implements TopBarClickListener {
  const AddMarginScreen({super.key});
  static Route route() {
    return MaterialPageRoute(builder: (context) => const AddMarginScreen());
  }

  @override
  Widget build(BuildContext context) {
    List<String> amounts = ["\$0", "\$5", "\$10", "\$15"];
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgTopBar,
        body: Column(
          children: [
            TopBar(
              this,
              isShowBack: false,
              title: Languages.of(context).addMargin,
              textColor: CustomAppColor.of(context).txtBlack,
              topBarColor: CustomAppColor.of(context).bgTopBar,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _totalOrder(context),
                    Padding(
                      padding: EdgeInsets.only(top: AppSizes.setHeight(10)),
                      child: _cashOnCollection(context, amounts),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: AppSizes.setHeight(10)),
                      child: _margin(context),
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
                  ],
                ),
              ),
            ),
            _totalPrice(context)
          ],
        ),
      ),
    );
  }

  Widget _totalOrder(BuildContext context) {
    return Container(
        color: CustomAppColor.of(context).bgScaffold,
        padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(16), vertical: AppSizes.setHeight(18)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
              text: Languages.of(context).orderTotal,
              fontWeight: FontWeight.w600,
              fontSize: AppSizes.setFontSize(18),
            ),
            CommonText(
              text: "\$232",
              fontWeight: FontWeight.w700,
              fontSize: AppSizes.setFontSize(18),
            )
          ],
        ));
  }

  Widget _cashOnCollection(BuildContext context, List<String> amount) {
    return Container(
        color: CustomAppColor.of(context).bgScaffold,
        padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(16), vertical: AppSizes.setHeight(22)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CommonText(
                    text: Languages.of(context).cashOnCollectDuringDelivery,
                    fontWeight: FontWeight.w600,
                    fontSize: AppSizes.setFontSize(16),
                    textAlign: TextAlign.start,
                  ),
                ),
                CommonText(
                  text: Languages.of(context).knowMore.toUpperCase(),
                  fontWeight: FontWeight.w600,
                  fontSize: AppSizes.setFontSize(15),
                  textColor: CustomAppColor.of(context).txtPurple,
                )
              ],
            ),
            SizedBox(height: AppSizes.setHeight(40)),
            const CommonTextFormField(
              labelText: "Order Total (\$232) + Your Margin",
              radius: 4,
            ),
            SizedBox(height: AppSizes.setHeight(24)),
            Wrap(
              spacing: AppSizes.setWidth(12),
              children: amount.map((amount) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.setWidth(12),
                    vertical: AppSizes.setHeight(4),
                  ),
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).dividerGrey,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: CustomAppColor.of(context).dividerGrey,
                      width: 1,
                    ),
                  ),
                  child: CommonText(
                    text: amount,
                    fontWeight: FontWeight.w600,
                    fontSize: AppSizes.setFontSize(14),
                    textColor: CustomAppColor.of(context).txtGrey,
                  ),
                );
              }).toList(),
            ),
          ],
        ));
  }

  Widget _margin(BuildContext context) {
    return Container(
      width: AppSizes.fullWidth,
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(22), horizontal: AppSizes.setWidth(15)),
      color: CustomAppColor.of(context).green.withOpacityPercent(0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CommonText(
            text: "${Languages.of(context).yourMargin} \$5",
            textColor: CustomAppColor.of(context).green,
            fontWeight: FontWeight.w700,
            fontSize: AppSizes.setFontSize(18),
          ),
          SizedBox(height: AppSizes.setHeight(10)),
          CommonText(
            text: Languages.of(context).marginWillBeDirectlyTransferred,
            fontWeight: FontWeight.w500,
            fontSize: AppSizes.setFontSize(13),
            textAlign: TextAlign.start,
          )
        ],
      ),
    );
  }

  Widget _cartProducts(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(18), horizontal: AppSizes.setWidth(18)),
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
                      fontWeight: FontWeight.w600,
                      fontSize: AppSizes.setFontSize(15),
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
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(22), vertical: AppSizes.setHeight(18)),
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
          SizedBox(height: AppSizes.setHeight(18)),
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
        ],
      ),
    );
  }

  Widget _priceRow(BuildContext context, String label, String value, {bool isBold = false, bool showInfoIcon = false}) {
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
            fontSize: AppSizes.setFontSize(14),
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
          ),
        ],
      ),
    );
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
          CommonButton(
            width: AppSizes.setWidth(133),
            height: AppSizes.setHeight(44),
            radius: 4,
            btnText: Languages.of(context).txtContinue,
            onTap: () => Navigator.push(context, AddDeliveryAddressScreen.route()),
          )
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {String value = ""}) {
    if (name == AppStrings.back) {
      Navigator.pop(GoozzyECommerceMyApp.navigatorKey.currentState!.context);
    }
  }
}
