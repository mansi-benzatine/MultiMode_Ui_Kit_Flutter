import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grokit_app/interfaces/top_bar_click_listener.dart';
import 'package:grokit_app/ui/dashboard/view/dashboard_screen.dart';
import 'package:grokit_app/utils/sizer_utils.dart';
import 'package:lottie/lottie.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../home/datamodel/home_data.dart';

class PlaceOrderScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const PlaceOrderScreen());
  }

  const PlaceOrderScreen({super.key});

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> implements TopBarClickListener {
  List<ItemsData> veggieList = [];
  OverlayEntry? _overlayEntry;
  void _fillData() {
    veggieList = [
      ItemsData(
        itemName: "Fresh Potato",
        itemImage: AppAssets.imgVeggie,
        itemWeight: "500gm",
        itemDiscountPrice: 32,
        itemOriginalPrice: 49,
        itemDiscount: 20,
        cartCount: 2,
      ),
      ItemsData(
        itemName: "Hybrid Tomato",
        itemImage: AppAssets.imgVeggie1,
        itemWeight: "500gm",
        itemDiscountPrice: 27,
        itemOriginalPrice: 34,
        itemDiscount: 20,
        cartCount: 2,
      ),
      ItemsData(
        itemName: "Eye Beauty",
        itemImage: AppAssets.imgBeautyEyeBeauty,
        itemWeight: "500gm",
        itemDiscountPrice: 32,
        itemOriginalPrice: 49,
        itemDiscount: 20,
        cartCount: 2,
      ),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fillData();
  }

  Map<String, double> getTotalAmounts() {
    double discountedTotal = 0;
    double originalTotal = 0;

    for (var item in veggieList) {
      discountedTotal += item.baseDiscountPrice * item.cartCount;
      originalTotal += item.itemOriginalPrice * item.cartCount;
    }

    return {
      "discounted": discountedTotal,
      "original": originalTotal,
    };
  }

  void _showLottieOverlay() {
    try {
      _overlayEntry = OverlayEntry(
        builder: (context) => Container(
          color: Colors.black.withValues(alpha: 0.5),
          child: Stack(
            children: [
              Center(
                child: Lottie.asset(
                  AppAssets.jsAddToCart,
                  width: 120.setWidth,
                  height: 120.setHeight,
                  fit: BoxFit.contain,
                ),
              ),
              Center(
                child: Lottie.asset(
                  AppAssets.jsCrackers,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
        ),
      );

      Overlay.of(context).insert(_overlayEntry!);

      Future.delayed(const Duration(seconds: 3), () {
        _overlayEntry?.remove();
        _overlayEntry = null;
        Navigator.push(context, DashboardScreen.route());
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error displaying Lottie overlay: $e');
      }
    }
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
              title: Languages.of(context).txtPaymentMethod,
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _addressCardView(),
                    _addedItemsView(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: CustomAppColor.of(context).couponCard,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 10.setHeight),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Image.asset(
                                    AppAssets.icDiscount,
                                    height: 24.setHeight,
                                    width: 24.setWidth,
                                  ),
                                  SizedBox(width: 10.setWidth),
                                  CommonText(
                                    text: "First Order",
                                    fontFamily: Constant.fontFamilyBold700,
                                    textColor: CustomAppColor.of(context).txtOrange,
                                  )
                                ],
                              ),
                            ),
                            Image.asset(
                              AppAssets.icCheck,
                              height: 20.setHeight,
                              width: 20.setWidth,
                            )
                          ],
                        ),
                      ),
                    ),
                    _deliveryAddressView(),
                    _paymentMethodView(),
                    _billDetailsView(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
              child: CommonButton(
                height: 45.setHeight,
                onTap: () {
                  _showLottieOverlay();
                },
                text: Languages.of(context).txtPlaceOrder,
                borderColor: CustomAppColor.of(context).buttonPrimary,
                buttonColor: CustomAppColor.of(context).buttonPrimary,
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

  _addressCardView() {
    return Container(
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).unselectedCard,
      ),
      padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, top: 10.setHeight, bottom: 5.setHeight),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 0.setHeight),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      AppAssets.icDeliveryBoy,
                      height: 18.setHeight,
                      width: 18.setWidth,
                    ),
                    SizedBox(width: 5.setWidth),
                    const CommonText(
                      text: "Arrived In 10-12 Min",
                      fontFamily: Constant.fontFamilyBold700,
                    )
                  ],
                ),
                SizedBox(height: 4.setHeight),
                CommonText(
                  text: "Order ID: 7N45-430",
                  fontSize: 12.setFontSize,
                  fontFamily: Constant.fontFamilyMedium500,
                  textColor: CustomAppColor.of(context).txtGray,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _deliveryAddressView() {
    return Container(
      padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, top: 5.setHeight, bottom: 5.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtDeliveryAddress,
            fontFamily: Constant.fontFamilyBold700,
          ),
          SizedBox(height: 10.setHeight),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: CustomAppColor.of(context).unselectedCard),
            padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 10.setHeight),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                AppAssets.icLocation,
                                height: 18.setHeight,
                                width: 18.setWidth,
                                color: CustomAppColor.of(context).icBlackWhite,
                              ),
                              SizedBox(width: 5.setWidth),
                              Row(
                                children: [
                                  const CommonText(
                                    text: "Square Building",
                                    fontFamily: Constant.fontFamilyBold700,
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down_rounded,
                                    size: 25.setHeight,
                                  )
                                ],
                              )
                            ],
                          ),
                          CommonText(
                            text: "47 W 13th St, New York, NY 10011, USA ",
                            fontSize: 12.setFontSize,
                            textColor: CustomAppColor.of(context).txtGray,
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      AppAssets.icBoxEdit,
                      width: 20.setWidth,
                      height: 20.setHeight,
                      color: CustomAppColor.of(context).icBlackWhite,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _paymentMethodView() {
    return Container(
      padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, top: 10.setHeight, bottom: 5.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtPaymentMethod,
            fontFamily: Constant.fontFamilyBold700,
          ),
          SizedBox(height: 10.setHeight),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: CustomAppColor.of(context).unselectedCard),
            padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 12.setHeight),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: "Cash On Delivery",
                            fontFamily: Constant.fontFamilyBold700,
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      AppAssets.icBoxEdit,
                      width: 20.setWidth,
                      height: 20.setHeight,
                      color: CustomAppColor.of(context).icBlackWhite,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _addedItemsView() {
    return Container(
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).unselectedCard,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: veggieList.length,
        itemBuilder: (context, index) {
          final item = veggieList[index];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 6.setHeight, horizontal: 20.setWidth),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 10.setHeight),
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).bgScreen,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    item.itemImage,
                    width: 50.setWidth,
                    height: 50.setHeight,
                  ),
                  SizedBox(width: 10.setWidth),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonText(
                          text: item.itemName,
                          fontFamily: Constant.fontFamilyMedium500,
                        ),
                        SizedBox(height: 4.setHeight),
                        CommonText(
                          text: item.itemWeight,
                          fontSize: 12.setFontSize,
                          fontFamily: Constant.fontFamilyMedium500,
                          textColor: CustomAppColor.of(context).txtGray,
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CommonText(
                        text: "\$${item.itemDiscountPrice.toStringAsFixed(0)}",
                        textAlign: TextAlign.start,
                        fontSize: 13.setFontSize,
                        fontFamily: Constant.fontFamilySemiBold600,
                      ),
                      SizedBox(width: 5.setWidth),
                      Row(
                        children: [
                          CommonText(
                            text: "MRP \$",
                            fontSize: 12.setFontSize,
                            fontFamily: Constant.fontFamilyMedium500,
                            textColor: CustomAppColor.of(context).txtGray,
                          ),
                          CommonText(
                            text: item.itemOriginalPrice.toStringAsFixed(0),
                            fontSize: 12.setFontSize,
                            textDecoration: TextDecoration.lineThrough,
                            fontFamily: Constant.fontFamilyMedium500,
                            textColor: CustomAppColor.of(context).txtGray,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _billDetailsView() {
    final totals = getTotalAmounts();
    final discountedTotal = totals["discounted"]!;
    final originalTotal = totals["original"]!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 15.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtBillDetails,
            fontSize: 16.setFontSize,
            fontFamily: Constant.fontFamilyBold700,
          ),
          SizedBox(height: 5.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtItemsTotal,
                fontSize: 12.setFontSize,
                textColor: CustomAppColor.of(context).txtGray,
              ),
              Row(
                children: [
                  CommonText(
                    text: "\$${discountedTotal.toStringAsFixed(2)}",
                    fontSize: 12.setFontSize,
                    fontFamily: Constant.fontFamilyMedium500,
                  ),
                  SizedBox(width: 2.setWidth),
                  CommonText(
                    text: "\$${originalTotal.toStringAsFixed(2)}",
                    fontSize: 12.setFontSize,
                    textDecoration: TextDecoration.lineThrough,
                    textColor: CustomAppColor.of(context).txtGray,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 5.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtTax,
                fontSize: 12.setFontSize,
                textColor: CustomAppColor.of(context).txtGray,
              ),
              CommonText(
                text: "\$3",
                fontSize: 12.setFontSize,
                fontFamily: Constant.fontFamilyMedium500,
              ),
            ],
          ),
          SizedBox(height: 5.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtDeliveryCharge,
                fontSize: 12.setFontSize,
                textColor: CustomAppColor.of(context).txtGray,
              ),
              CommonText(
                text: "\$0.00",
                fontSize: 12.setFontSize,
                fontFamily: Constant.fontFamilyMedium500,
              ),
            ],
          ),
          SizedBox(height: 12.setHeight),
          Row(
            children: List.generate(60, (index) {
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 2.setWidth),
                  child: Container(
                    height: 1.setHeight,
                    width: 2.setWidth,
                    color: CustomAppColor.of(context).border,
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: 12.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtTotal,
                fontSize: 12.setFontSize,
                fontFamily: Constant.fontFamilySemiBold600,
                textColor: CustomAppColor.of(context).blue,
              ),
              CommonText(
                text: "\$${discountedTotal.toStringAsFixed(2)}",
                fontSize: 12.setFontSize,
                fontFamily: Constant.fontFamilySemiBold600,
                textColor: CustomAppColor.of(context).blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
