import 'package:flutter/material.dart';
import 'package:grokit_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:grokit_screens_app/localization/language/languages.dart';
import 'package:grokit_screens_app/ui/all_coupon/view/all_coupons_screen.dart';
import 'package:grokit_screens_app/ui/home/datamodel/home_data.dart';
import 'package:grokit_screens_app/ui/payment_method/view/payment_method_screen.dart';
import 'package:grokit_screens_app/utils/app_color.dart';
import 'package:grokit_screens_app/utils/constant.dart';
import 'package:grokit_screens_app/utils/sizer_utils.dart';
import 'package:grokit_screens_app/widgets/button/common_button.dart';
import 'package:grokit_screens_app/widgets/item_card/itme_card_view.dart';
import 'package:grokit_screens_app/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';
import '../../../widgets/text/common_text.dart';

class ViewCartScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ViewCartScreen());
  }

  const ViewCartScreen({super.key});

  @override
  State<ViewCartScreen> createState() => _ViewCartScreenState();
}

class _ViewCartScreenState extends State<ViewCartScreen> implements TopBarClickListener {
  List<ItemsData> veggieList = [];
  List<ItemsData> youMayAlsoLikeList = [];

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
        itemName: "Beauty Nails",
        itemImage: AppAssets.imgBeautyEyeBeauty,
        itemWeight: "500gm",
        itemDiscountPrice: 32,
        itemOriginalPrice: 49,
        itemDiscount: 20,
        cartCount: 2,
      ),
    ];
    youMayAlsoLikeList = [
      ItemsData(
        itemName: "Fresh Potato",
        itemImage: AppAssets.imgVeggie5,
        itemWeight: "500gm",
        itemDiscountPrice: 32,
        itemOriginalPrice: 49,
        itemDiscount: 20,
      ),
      ItemsData(
        itemName: "Hybrid Tomato",
        itemImage: AppAssets.imgVeggie4,
        itemWeight: "500gm",
        itemDiscountPrice: 27,
        itemOriginalPrice: 34,
        itemDiscount: 20,
        isAddedToCart: false,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtViewCart,
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _addressCardView(),
                    _addedItemsView(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 15.setHeight),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonText(
                            text: Languages.of(context).txtYouMayAlsoLike,
                            fontSize: 16.setFontSize,
                            fontFamily: Constant.fontFamilyBold700,
                          ),
                          const Icon(Icons.navigate_next_rounded),
                        ],
                      ),
                    ),
                    ItemCardView(items: youMayAlsoLikeList),
                    IgnorePointer(
                      ignoring: true,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
                        child: GestureDetector(
                          onTap: () => Navigator.push(context, AllCouponsScreen.route()),
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
                                        text: Languages.of(context).txtUseCoupons,
                                        fontFamily: Constant.fontFamilyBold700,
                                        textColor: CustomAppColor.of(context).txtOrange,
                                      )
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.navigate_next_rounded,
                                  color: CustomAppColor.of(context).txtOrange,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    _billDetailsView(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
              child: IgnorePointer(
                ignoring: true,
                child: CommonButton(
                  height: 45.setHeight,
                  text: Languages.of(context).txtProcessToPay,
                  onTap: () => Navigator.push(context, PaymentMethodScreen.route()),
                  borderColor: CustomAppColor.of(context).buttonPrimary,
                  buttonColor: CustomAppColor.of(context).buttonPrimary,
                ),
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
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: CustomAppColor.of(context).bgScreen),
        padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 10.setHeight),
        child: Column(
          children: [
            Column(
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
          ],
        ),
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      item.itemImage,
                      width: 50.setWidth,
                      height: 50.setHeight,
                      fit: BoxFit.fill,
                    ),
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
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: CustomAppColor.of(context).borderOtp),
                          color: CustomAppColor.of(context).buttonPrimary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 4.setHeight, horizontal: 10.setWidth),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (item.cartCount > 1) {
                                    item.cartCount--;
                                    item.itemDiscountPrice = item.baseDiscountPrice * item.cartCount;
                                    item.itemOriginalPrice = ((item.itemOriginalPrice / (item.cartCount + 1)) * item.cartCount); // optional
                                  } else {
                                    item.isAddedToCart = false;
                                    item.cartCount = 0;
                                  }
                                });
                              },
                              child: const Icon(
                                Icons.remove_rounded,
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 2.setHeight),
                              child: CommonText(
                                text: "${item.cartCount}",
                                fontSize: 12.setFontSize,
                                fontFamily: Constant.fontFamilySemiBold600,
                                textColor: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  item.cartCount++;
                                  item.itemDiscountPrice = item.baseDiscountPrice * item.cartCount;
                                  item.itemOriginalPrice = ((item.itemOriginalPrice / (item.cartCount - 1)) * item.cartCount);
                                });
                              },
                              child: const Icon(
                                Icons.add_rounded,
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.setHeight),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 0.setHeight),
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
                    text: "\$${discountedTotal.toStringAsFixed(0)}",
                    fontSize: 12.setFontSize,
                    fontFamily: Constant.fontFamilyMedium500,
                  ),
                  SizedBox(width: 4.setWidth),
                  CommonText(
                    text: "\$${originalTotal.toStringAsFixed(0)}",
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
