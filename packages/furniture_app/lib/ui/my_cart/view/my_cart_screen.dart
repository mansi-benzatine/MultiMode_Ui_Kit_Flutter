import 'package:flutter/material.dart';
import 'package:furniture_app_package/interfaces/top_bar_click_listener.dart';
import 'package:furniture_app_package/localization/language/languages.dart';
import 'package:furniture_app_package/ui/checkout/view/checkout_screen.dart';
import 'package:furniture_app_package/ui/product_details/view/product_details_screen.dart';
import 'package:furniture_app_package/ui/search/view/search_screen.dart';
import 'package:furniture_app_package/utils/app_assets.dart';
import 'package:furniture_app_package/utils/app_color.dart';
import 'package:furniture_app_package/utils/constant.dart';
import 'package:furniture_app_package/utils/sizer_utils.dart';
import 'package:furniture_app_package/widgets/button/common_button.dart';
import 'package:furniture_app_package/widgets/text/common_text.dart';
import 'package:furniture_app_package/widgets/top_bar/topbar.dart';

import '../datamodels/my_cart_data.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> implements TopBarClickListener {
  List<CartItem> cartItems = [
    CartItem(
      name: "Lolita Sofa",
      price: 299.0,
      color: "Orange",
      image: AppAssets.imgDummySofa,
    ),
    CartItem(
      name: "Wood Chair",
      price: 299.0,
      color: "Orange",
      image: AppAssets.imgDummyLamp,
    ),
    CartItem(
      name: "Stylish Lamp",
      price: 299.0,
      color: "Orange",
      image: AppAssets.imgDummyChair,
    ),
    CartItem(
      name: "Swing Chair",
      price: 299.0,
      color: "Orange",
      image: AppAssets.imgDummySofa,
    ),
    CartItem(
      name: "Lolita Sofa",
      price: 299.0,
      color: "Orange",
      image: AppAssets.imgDummySofa,
    ),
    CartItem(
      name: "Wood Chair",
      price: 299.0,
      color: "Orange",
      image: AppAssets.imgDummyLamp,
    ),
    CartItem(
      name: "Stylish Lamp",
      price: 299.0,
      color: "Orange",
      image: AppAssets.imgDummyChair,
    ),
    CartItem(
      name: "Swing Chair",
      price: 299.0,
      color: "Orange",
      image: AppAssets.imgDummySofa,
    ),
  ];
  bool selectionMode = false;

  void toggleSelection(int index) {
    setState(() {
      cartItems[index].isSelected = !cartItems[index].isSelected;
    });
  }

  void toggleSelectionMode() {
    setState(() {
      if (!selectionMode || cartItems.every((item) => !item.isSelected)) {
        // Enable selection mode and select all
        selectionMode = true;
        for (var item in cartItems) {
          item.isSelected = true;
        }
      } else {
        // Deselect all
        for (var item in cartItems) {
          item.isSelected = false;
        }
        selectionMode = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtMyCart,
            isShowSearch: true,
            isShowSelectAll: true,
            textAlign: TextAlign.start,
            alignment: Alignment.centerLeft,
          ),
          Expanded(
            child: cartItems.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 220.setHeight),
                      Image.asset(
                        AppAssets.imgEmptyCart,
                        color: CustomAppColor.of(context).emptyViewIcon,
                        height: 120.setHeight,
                      ),
                      SizedBox(height: 20.setHeight),
                      CommonText(
                        text: "Empty Cart",
                        fontSize: 18.setFontSize,
                        fontFamily: Constant.fontFamilySemiBold600,
                      ),
                      SizedBox(height: 10.setHeight),
                      CommonText(
                        text: "You have nothing on your cart yet.\nIt's never too late to change it :)",
                        fontSize: 14.setFontSize,
                        textColor: CustomAppColor.of(context).txtGray,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, bottom: selectionMode ? 20.setHeight : 110.setHeight),
                    itemCount: cartItems.length,
                    separatorBuilder: (context, index) {
                      return Divider(color: CustomAppColor.of(context).dividerColor);
                    },
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return GestureDetector(
                        onLongPress: () => toggleSelectionMode(),
                        onTap: () {
                          if (selectionMode) {
                            toggleSelection(index);
                          } else {
                            Navigator.push(context, ProductDetailsScreen.route());
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 0.setWidth, vertical: 12.setHeight),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadiusGeometry.circular(12),
                                    child: Image.asset(
                                      item.image,
                                      height: 110.setHeight,
                                      width: 100.setHeight,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(width: 20.setWidth),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            CommonText(
                                              text: item.name,
                                              fontSize: 18.setFontSize,
                                              fontFamily: Constant.fontFamilySemiBold600,
                                            ),
                                            if (selectionMode)
                                              SizedBox(
                                                height: 20.setHeight,
                                                width: 20.setHeight,
                                                child: Checkbox(
                                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                  visualDensity: VisualDensity.compact,
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(3)),
                                                  checkColor: CustomAppColor.of(context).white,
                                                  value: item.isSelected,
                                                  onChanged: (_) => toggleSelection(index),
                                                  activeColor: CustomAppColor.of(context).primary,
                                                ),
                                              ),
                                          ],
                                        ),
                                        CommonText(
                                          text: "\$${item.price}",
                                          fontSize: 20.setFontSize,
                                          fontFamily: Constant.fontFamilyBold700,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: 4.setHeight),
                                          child: CommonText(
                                            text: "1 : Qty",
                                            fontSize: 14.setFontSize,
                                            fontFamily: Constant.fontFamilyMedium500,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const CircleAvatar(radius: 4, backgroundColor: Colors.orange),
                                                SizedBox(width: 4.setWidth),
                                                CommonText(
                                                  text: item.color,
                                                  fontSize: 14.setFontSize,
                                                  fontFamily: Constant.fontFamilyMedium500,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                InkWell(
                                                  child: Image.asset(
                                                    AppAssets.icEdit,
                                                    height: 20.setHeight,
                                                    width: 20.setWidth,
                                                    color: CustomAppColor.of(context).icBlackWhite,
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(context, ProductDetailsScreen.route());
                                                  },
                                                ),
                                                SizedBox(width: 20.setWidth),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      cartItems.removeAt(index);
                                                    });
                                                  },
                                                  child: Image.asset(
                                                    AppAssets.icTrash,
                                                    height: 20.setHeight,
                                                    width: 20.setWidth,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          if (selectionMode)
            CommonButton(
              mLeft: 22.setWidth,
              mRight: 22.setWidth,
              mTop: 10.setHeight,
              mBottom: 110.setHeight,
              text: Languages.of(context).txtContinueToPayment,
              onTap: () => Navigator.push(context, CheckoutScreen.route()),
            )
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strSearch) {
      Navigator.push(context, SearchScreen.route());
    }
    if (name == Constant.strSelectAll) {
      toggleSelectionMode();
    }
  }
}
