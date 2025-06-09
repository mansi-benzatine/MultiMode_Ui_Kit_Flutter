import 'package:flutter/material.dart';
import 'package:goozzy_e_commerce_screens_app_package/utils/utils.dart';

import '../../../../../../interfaces/top_bar_click_listener.dart';
import '../../../../../../ui/add_margin/views/add_margin_screen.dart';
import '../../../../../../utils/app_assets.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../utils/string_constant.dart';
import '../../../../../../widgets/button/common_button.dart';
import '../../../../../../widgets/text/common_text.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/topbar/topbar.dart';
import '../../app/my_app.dart';
import '../datamodel/cart_data.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  static Route route() {
    return MaterialPageRoute(builder: (context) => const CartScreen());
  }

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> implements TopBarClickListener {
  int selectedIndex = 0;

  List<PaymentModesData> paymentModeList = [];

  void fillData() {
    paymentModeList = [
      PaymentModesData(
        leadingIcon: AppAssets.imgMoney,
        label: Languages.of(context).cashOnDelivery,
        isSuffixIconSelect: true,
      ),
      PaymentModesData(
        leadingIcon: AppAssets.imgPaytm,
        label: Languages.of(context).paytm,
        description: Languages.of(context).walletDebitCard,
        isSuffixIconSelect: false,
      ),
      PaymentModesData(
        leadingIcon: AppAssets.imgCreditCard,
        label: Languages.of(context).online,
        description: Languages.of(context).debitCardCreditCard,
        isSuffixIconSelect: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
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
                title: Languages.of(context).cart,
                textColor: CustomAppColor.of(context).txtBlack,
                topBarColor: CustomAppColor.of(context).bgBlackWhiteScaffold,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _paymentMode(context),
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
                      child: _yourSafety(context),
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

  Widget _paymentMode(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).bgScaffold,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(22), vertical: AppSizes.setHeight(16)),
            child: CommonText(
              text: Languages.of(context).selectPaymentMethod.toUpperCase(),
              fontSize: AppSizes.setFontSize(17),
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.start,
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: paymentModeList.length,
            itemBuilder: (context, index) {
              bool isSelected = selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: AppSizes.setHeight(16),
                        horizontal: AppSizes.setWidth(16),
                      ),
                      decoration: BoxDecoration(
                        color: isSelected ? CustomAppColor.of(context).green.withOpacityPercent(0.1) : CustomAppColor.of(context).bgScaffold,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            paymentModeList[index].leadingIcon,
                            width: AppSizes.setWidth(50),
                            height: AppSizes.setHeight(34),
                          ),
                          SizedBox(width: AppSizes.setWidth(34)),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  text: paymentModeList[index].label,
                                  fontSize: AppSizes.setFontSize(16),
                                  fontWeight: FontWeight.w600,
                                ),
                                if (paymentModeList[index].description != null)
                                  Padding(
                                    padding: EdgeInsets.only(top: AppSizes.setHeight(4)),
                                    child: CommonText(
                                      text: paymentModeList[index].description!,
                                      fontSize: AppSizes.setFontSize(10),
                                      fontWeight: FontWeight.w400,
                                      textColor: CustomAppColor.of(context).txtGrey,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Image.asset(
                            isSelected ? AppAssets.icCheck : AppAssets.icNotCheck,
                            height: AppSizes.setHeight(26),
                            width: AppSizes.setWidth(26),
                          ),
                        ],
                      ),
                    ),
                    if (index < paymentModeList.length - 1)
                      Divider(
                        color: CustomAppColor.of(context).dividerGrey,
                        thickness: 2,
                        height: 1,
                      ),
                  ],
                ),
              );
            },
          ),
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
              SizedBox(width: AppSizes.setWidth(10)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: AppStrings.anniDesignerWomenArt,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w600,
                      fontSize: AppSizes.setFontSize(14),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: AppSizes.setHeight(5)),
                    CommonText(
                      text: "\$ 299",
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w400,
                      fontSize: AppSizes.setFontSize(15),
                    ),
                    SizedBox(height: AppSizes.setHeight(5)),
                    Row(
                      children: [
                        CommonText(
                          text: Languages.of(context).mrp,
                          fontWeight: FontWeight.w500,
                          fontSize: AppSizes.setFontSize(15),
                          textColor: CustomAppColor.of(context).txtGrey,
                        ),
                        SizedBox(width: AppSizes.setWidth(2)),
                        CommonText(
                          text: " \$599",
                          fontWeight: FontWeight.w500,
                          fontSize: AppSizes.setFontSize(16),
                          textColor: CustomAppColor.of(context).txtGrey,
                          textDecoration: TextDecoration.lineThrough,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: AppSizes.setHeight(25)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: Languages.of(context).remove.toUpperCase(),
                  textColor: CustomAppColor.of(context).txtPurple,
                  fontSize: AppSizes.setFontSize(14),
                  fontWeight: FontWeight.w600,
                ),
                Row(
                  children: [
                    CommonText(
                      text: Languages.of(context).size.toUpperCase(),
                      textColor: CustomAppColor.of(context).txtGrey,
                      fontSize: AppSizes.setFontSize(12),
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(width: AppSizes.setWidth(17)),
                    Container(
                      height: AppSizes.setHeight(24),
                      width: AppSizes.setWidth(48),
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).dividerGrey,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(2),
                        ),
                        border: Border.all(
                          color: CustomAppColor.of(context).borderGrey,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CommonText(
                            text: "M",
                            fontWeight: FontWeight.w600,
                            fontSize: AppSizes.setFontSize(12),
                          ),
                          Image.asset(
                            AppAssets.icDownArrow,
                            width: AppSizes.setWidth(13),
                            height: AppSizes.setHeight(13),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    CommonText(
                      text: Languages.of(context).qty.toUpperCase(),
                      textColor: CustomAppColor.of(context).txtGrey,
                      fontSize: AppSizes.setFontSize(12),
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(width: AppSizes.setWidth(14)),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(2)),
                      height: AppSizes.setHeight(24),
                      width: AppSizes.setWidth(73),
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).dividerGrey,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(3),
                        ),
                        border: Border.all(
                          color: CustomAppColor.of(context).borderGrey,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            AppAssets.icMinus,
                            width: AppSizes.setWidth(10),
                            height: AppSizes.setHeight(10),
                          ),
                          const VerticalDivider(),
                          CommonText(
                            text: "1",
                            fontWeight: FontWeight.w600,
                            fontSize: AppSizes.setFontSize(12),
                          ),
                          const VerticalDivider(),
                          Image.asset(
                            AppAssets.icPlus,
                            width: AppSizes.setWidth(10),
                            height: AppSizes.setHeight(10),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _supplierDetail(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).bgScaffold,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(22), vertical: AppSizes.setHeight(18)),
      child: Row(
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
                Icon(Icons.info_outline, size: AppSizes.setFontSize(14), color: CustomAppColor.of(context).txtGrey),
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

  Widget _yourSafety(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(0)),
      padding: EdgeInsets.only(left: AppSizes.setWidth(16)),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScaffold,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppAssets.icTrust,
                        height: AppSizes.setHeight(24),
                        width: AppSizes.setWidth(22),
                      ),
                      SizedBox(width: AppSizes.setWidth(8)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: CustomAppColor.of(context).btnPurple,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: CommonText(
                          text: Languages.of(context).goozzeySafe,
                          fontWeight: FontWeight.w500,
                          fontSize: AppSizes.setFontSize(12),
                          textColor: CustomAppColor.of(context).white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizes.setHeight(8)),
                  CommonText(
                    text: Languages.of(context).yourSafetyOurPriority,
                    fontWeight: FontWeight.w700,
                    fontSize: AppSizes.setFontSize(16),
                    textColor: CustomAppColor.of(context).txtBlack,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: AppSizes.setHeight(8)),
                  CommonText(
                    text: Languages.of(context).weMakeSureThatYourPackageIs,
                    fontWeight: FontWeight.w400,
                    fontSize: AppSizes.setFontSize(12),
                    maxLines: 3,
                    textColor: CustomAppColor.of(context).txtBlack,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Image.asset(
              AppAssets.imgDeliveryMan,
              width: AppSizes.setWidth(161),
              height: AppSizes.setHeight(161),
              fit: BoxFit.cover,
            ),
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
          top: BorderSide(color: CustomAppColor.of(context).txtGrey.withOpacityPercent(0.5)),
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
              CommonText(
                text: "\$232",
                fontSize: AppSizes.setFontSize(18),
                fontWeight: FontWeight.w700,
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
              onTap: () => Navigator.push(context, AddMarginScreen.route()),
            ),
          )
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
