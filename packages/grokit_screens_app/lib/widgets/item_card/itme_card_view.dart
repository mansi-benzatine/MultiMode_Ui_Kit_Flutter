import 'package:flutter/material.dart';
import 'package:grokit_screens_app/utils/sizer_utils.dart';

import '../../ui/home/datamodel/home_data.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../utils/constant.dart';
import '../text/common_text.dart';

class ItemCardView extends StatefulWidget {
  final List<ItemsData> items;

  const ItemCardView({
    super.key,
    required this.items,
  });

  @override
  State<ItemCardView> createState() => _ItemCardViewState();
}

class _ItemCardViewState extends State<ItemCardView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Wrap(
        spacing: 11.setWidth,
        runSpacing: 11.setHeight,
        children: widget.items.map((item) {
          return SizedBox(
            width: (MediaQuery.of(context).size.width - 10 * 2 - 40) / 2,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    border: Border.all(
                      color: CustomAppColor.of(context).itemCardBorder,
                      width: 0.5,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 10.setHeight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: CustomAppColor.of(context).unselectedCard,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                item.itemImage,
                                height: 138.setHeight,
                                width: 138.setWidth,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10.setWidth,
                            top: 8.setHeight,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  item.isFavourite = !item.isFavourite;
                                });
                              },
                              child: Icon(
                                item.isFavourite ? Icons.favorite_rounded : Icons.favorite_outline_rounded,
                                size: 20,
                                color: item.isFavourite ? Colors.red : CustomAppColor.of(context).txtGray,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.setHeight),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CommonText(
                              text: item.itemName,
                              textAlign: TextAlign.start,
                              fontSize: 14.setFontSize,
                              fontFamily: Constant.fontFamilyMedium500,
                              textColor: CustomAppColor.of(context).txtBlack,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: 2.setWidth),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.setHeight),
                            child: CommonText(
                              text: item.itemWeight,
                              fontSize: 10.setFontSize,
                              fontFamily: Constant.fontFamilyMedium500,
                              textColor: const Color(0xFF2B70E8),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.setHeight),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CommonText(
                            text: "\$${item.itemDiscountPrice.toStringAsFixed(0)}",
                            textAlign: TextAlign.start,
                            fontSize: 16.setFontSize,
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
                      SizedBox(height: 20.setHeight),

                      // ADD TO CART / CART COUNTER
                      if (!item.isAddedToCart)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              item.isAddedToCart = true;
                              item.cartCount = 1;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: CustomAppColor.of(context).borderOtp),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 8.setHeight,
                              horizontal: 18.setWidth,
                            ),
                            child: CommonText(
                              text: "Add To Cart",
                              fontSize: 12.setFontSize,
                              fontFamily: Constant.fontFamilySemiBold600,
                              textColor: CustomAppColor.of(context).txtPrimary,
                            ),
                          ),
                        ),
                      if (item.isAddedToCart)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: CustomAppColor.of(context).borderOtp),
                              color: CustomAppColor.of(context).buttonPrimary,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 4.setHeight,
                              horizontal: 10.setWidth,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (item.cartCount > 1) {
                                        item.cartCount--;
                                      } else {
                                        item.isAddedToCart = false;
                                        item.cartCount = 0;
                                      }
                                    });
                                  },
                                  child: const Icon(Icons.remove_rounded, color: Colors.white),
                                ),
                                CommonText(
                                  text: "${item.cartCount}",
                                  fontSize: 13.setFontSize,
                                  fontFamily: Constant.fontFamilySemiBold600,
                                  textColor: Colors.white,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      item.cartCount++;
                                    });
                                  },
                                  child: const Icon(Icons.add_rounded, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                // DISCOUNT TAG
                Positioned(
                  left: 16.setWidth,
                  child: Stack(
                    children: [
                      Image.asset(
                        AppAssets.imgDiscountCard,
                        height: 32.setHeight,
                        width: 25.setWidth,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 3.setWidth,
                          vertical: 4.setHeight,
                        ),
                        child: CommonText(
                          text: "${item.itemDiscount}%\nOff",
                          textAlign: TextAlign.start,
                          fontSize: 10.setFontSize,
                          fontFamily: Constant.fontFamilyMedium500,
                          textColor: CustomAppColor.of(context).white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
