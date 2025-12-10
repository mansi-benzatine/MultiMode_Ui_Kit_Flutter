import 'package:flutter/material.dart';
import 'package:grokit_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:grokit_screens_app/localization/language/languages.dart';
import 'package:grokit_screens_app/ui/home/datamodel/home_data.dart';
import 'package:grokit_screens_app/ui/track_order/view/track_order_screen.dart';
import 'package:grokit_screens_app/utils/app_color.dart';
import 'package:grokit_screens_app/utils/sizer_utils.dart';
import 'package:grokit_screens_app/widgets/button/common_button.dart';
import 'package:grokit_screens_app/widgets/item_card/itme_card_view.dart';
import 'package:grokit_screens_app/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';

class MyCartScreen extends StatefulWidget {
  final bool isForEmptyView;

  static Route<void> route({bool isForEmptyView = false}) {
    return MaterialPageRoute(
      builder: (_) => MyCartScreen(isForEmptyView: isForEmptyView),
    );
  }

  const MyCartScreen({super.key, this.isForEmptyView = false});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> implements TopBarClickListener {
  List<ItemsData> ourBestSellersList = [];
  bool isEmptyCart = false;
  void fillData() {
    ourBestSellersList = [
      ItemsData(
        itemName: "Amul Cheese Slices",
        itemImage: AppAssets.imgDairy,
        itemWeight: "500gm",
        itemDiscountPrice: 32,
        itemOriginalPrice: 49,
        itemDiscount: 20,
      ),
      ItemsData(
        itemName: "Hybrid Tomato",
        itemImage: AppAssets.imgDairy1,
        itemWeight: "500gm",
        itemDiscountPrice: 27,
        itemOriginalPrice: 34,
        itemDiscount: 20,
        isAddedToCart: false,
      ),
      ItemsData(
        itemName: "Lays Cream & Onion Chips",
        itemImage: AppAssets.imgSnack1,
        itemWeight: "48gm",
        itemDiscountPrice: 20,
        itemOriginalPrice: 24,
        itemDiscount: 20,
        isAddedToCart: false,
      ),
      ItemsData(
        itemName: "Onion Kodubale",
        itemImage: AppAssets.imgSnack,
        itemWeight: "500gm",
        itemDiscountPrice: 99,
        itemOriginalPrice: 104,
        itemDiscount: 20,
      ),
      ItemsData(
        itemName: "Fresh Potato",
        itemImage: AppAssets.imgVeggie,
        itemWeight: "500gm",
        itemDiscountPrice: 32,
        itemOriginalPrice: 49,
        itemDiscount: 20,
      ),
      ItemsData(
        itemName: "Hybrid Tomato",
        itemImage: AppAssets.imgVeggie1,
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
    super.initState();
    fillData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            isShowBack: false,
            title: Languages.of(context).txtMyCart,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  !widget.isForEmptyView
                      ? Column(
                          children: [
                            _addressCardView(),
                            _cartContentView(),
                          ],
                        )
                      : Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.setWidth),
                            child: Column(
                              children: [
                                Image.asset(
                                  AppAssets.imgEmptyCart,
                                  width: 125.setWidth,
                                ),
                                CommonText(
                                  text: Languages.of(context).txtOrderingWillBeEasy,
                                  fontFamily: Constant.fontFamilyBold700,
                                  fontSize: 16.setFontSize,
                                ),
                                CommonText(
                                  text: Languages.of(context).txtEmptyCartDesc,
                                  fontSize: 14.setFontSize,
                                  textColor: CustomAppColor.of(context).txtGray,
                                ),
                                SizedBox(height: 5.setHeight),
                                Divider(color: CustomAppColor.of(context).border),
                                SizedBox(height: 5.setHeight),
                              ],
                            ),
                          ),
                        ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 12.setHeight),
                    child: CommonText(
                      text: Languages.of(context).txtOurBestSellers,
                      fontFamily: Constant.fontFamilyBold700,
                      textAlign: TextAlign.start,
                      fontSize: 16.setFontSize,
                    ),
                  ),
                  ItemCardView(items: ourBestSellersList),
                  SizedBox(height: 15.setHeight)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _addressCardView() {
    return Container(
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).unselectedCard,
      ),
      padding: EdgeInsets.only(left: 18.setWidth, right: 12.setWidth, top: 10.setHeight),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.setWidth),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
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
                      CommonText(
                        text: "Delivered In 10-12 Min",
                        fontFamily: Constant.fontFamilyBold700,
                        textColor: CustomAppColor.of(context).txtPrimary,
                      )
                    ],
                  ),
                  SizedBox(height: 4.setHeight),
                  CommonText(
                    text: "Order ID: 7N45-430",
                    fontSize: 12.setFontSize,
                    fontFamily: Constant.fontFamilyMedium500,
                  ),
                ],
              ),
            ),
            IgnorePointer(
              ignoring: true,
              child: CommonButton(
                height: 30.setHeight,
                width: 105.setWidth,
                image: AppAssets.icLocation,
                imageColor: CustomAppColor.of(context).white,
                imageSize: 13,
                buttonTextSize: 10.setFontSize,
                text: Languages.of(context).txtTrackOrder,
                onTap: () => Navigator.push(context, TrackOrderScreen.route()),
              ),
            )
          ],
        ),
      ),
    );
  }

  _cartContentView() {
    return Container(
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).unselectedCard,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: CustomAppColor.of(context).bgScreen,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      AppAssets.imgVeggie1,
                      width: 50.setWidth,
                      height: 50.setHeight,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 8.setWidth,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      AppAssets.imgVeggie5,
                      width: 50.setWidth,
                      height: 50.setHeight,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 8.setWidth,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      AppAssets.imgVeggie4,
                      width: 50.setWidth,
                      height: 50.setHeight,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CommonText(
                  text: Languages.of(context).txtTotalAmount,
                  fontSize: 12.setFontSize,
                  textColor: CustomAppColor.of(context).txtGray,
                ),
                SizedBox(height: 5.setHeight),
                CommonText(
                  text: "\$${187.00}",
                  fontSize: 12.setFontSize,
                  fontFamily: Constant.fontFamilyBold700,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {}
}
