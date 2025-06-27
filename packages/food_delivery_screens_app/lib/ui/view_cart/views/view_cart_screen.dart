import 'package:flutter/material.dart';
import 'package:food_delivery_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:food_delivery_screens_app_package/localization/language/languages.dart';
import 'package:food_delivery_screens_app_package/ui/apply_coupon/views/apply_coupon_screen.dart';
import 'package:food_delivery_screens_app_package/ui/manage_address/views/manage_address_screen.dart';
import 'package:food_delivery_screens_app_package/ui/proceed_to_pay/views/proceed_to_pay_screen.dart';
import 'package:food_delivery_screens_app_package/utils/app_color.dart';
import 'package:food_delivery_screens_app_package/utils/constant.dart';
import 'package:food_delivery_screens_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_screens_app_package/widgets/button/common_button.dart';
import 'package:food_delivery_screens_app_package/widgets/text/common_text.dart';
import 'package:food_delivery_screens_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';
import '../../home/datamodels/home_data.dart';

class ViewCartScreen extends StatefulWidget {
  final bool isFromDashBoard;
  final bool isFromEmptyCart;

  const ViewCartScreen({super.key, required this.isFromDashBoard, required this.isFromEmptyCart});

  static Route<void> route({required bool isFromDashboard, required bool isFromEmptyCart}) {
    return MaterialPageRoute(builder: (_) => ViewCartScreen(isFromDashBoard: isFromDashboard, isFromEmptyCart: isFromDashboard));
  }

  @override
  State<ViewCartScreen> createState() => _ViewCartScreenState();
}

class _ViewCartScreenState extends State<ViewCartScreen> implements TopBarClickListener {
  List<FoodDetailData> addedItemList = [];
  int quantity = 0;
  @override
  void initState() {
    super.initState();
    fillData();
  }

  bool get isCartEmpty => addedItemList.every((item) => item.quantity == 0);

  void fillData() {
    addedItemList = [
      FoodDetailData(
        foodImageUrl: AppAssets.imgComboBurger,
        foodTypes: ["Burger", "American Food", "Desi Food"],
        price: 200,
        foodName: "Testy Burger",
        quantity: 1,
      ),
      FoodDetailData(
        foodImageUrl: AppAssets.imgComboBurger,
        foodTypes: ["Sandwich", "American Food", "Desi Food"],
        price: 200,
        foodName: "Veg Hakka Noodles",
        quantity: 1,
      ),
    ];
  }

  void onQuantityChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            Visibility(
              visible: !(widget.isFromDashBoard),
              child: TopBar(
                this,
                title: (isCartEmpty) ? "" : "The Garden Restaurant",
                isShowBack: true,
              ),
            ),
            Expanded(
              child: isCartEmpty || widget.isFromEmptyCart
                  ? const EmptyCartView()
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Visibility(
                            visible: widget.isFromDashBoard,
                            child: Container(
                              color: CustomAppColor.of(context).bgScaffold,
                              padding: EdgeInsets.only(left: 24.setWidth, top: 30.setHeight, right: 24.setWidth),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.asset(
                                          AppAssets.imgChickenSpeghetti,
                                          height: 75.setHeight,
                                          width: 75.setWidth,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      SizedBox(width: 18.setWidth),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CommonText(
                                              text: "The Garden Restaurant",
                                              fontSize: 22.setFontSize,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: -0.3,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            CommonText(
                                              text: "Broadway NY",
                                              fontSize: 14.setFontSize,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: -0.3,
                                              textColor: CustomAppColor.of(context).txtGrey,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          AddedItemListView(
                            foodList: addedItemList,
                            onQuantityChanged: onQuantityChanged,
                          ),
                          Container(height: 8.setHeight, color: CustomAppColor.of(context).detailScreenBg),
                          const ApplyCouponView(),
                          Container(height: 8.setHeight, color: CustomAppColor.of(context).detailScreenBg),
                          BillDetailsView(foodList: addedItemList),
                          Container(height: 8.setHeight, color: CustomAppColor.of(context).detailScreenBg),
                          const SelectAddressView()
                        ],
                      ),
                    ),
            ),
            if ((!isCartEmpty) && (!widget.isFromEmptyCart)) ProceedToPayView(foodList: addedItemList),
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
}

class AddedItemListView extends StatefulWidget {
  final List<FoodDetailData> foodList;
  final VoidCallback onQuantityChanged;
  const AddedItemListView({super.key, required this.foodList, required this.onQuantityChanged});

  @override
  State<AddedItemListView> createState() => _AddedItemListViewState();
}

class _AddedItemListViewState extends State<AddedItemListView> {
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).bgScaffold,
      padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 22.setWidth),
      child: Column(
        children: [
          ListView.builder(
            itemCount: widget.foodList.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final food = widget.foodList[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 15.setHeight),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            AppAssets.icVeg,
                            height: 24.setHeight,
                            width: 24.setHeight,
                          ),
                          SizedBox(width: 8.setWidth),
                          Flexible(
                            child: CommonText(
                              text: food.foodName,
                              fontWeight: FontWeight.w600,
                              fontSize: 15.setFontSize,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            constraints: BoxConstraints(maxHeight: 24.setHeight),
                            decoration: BoxDecoration(
                              border: Border.all(color: CustomAppColor.of(context).containerBorder),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (food.quantity > 1) {
                                        food.quantity--;
                                      } else {
                                        food.quantity = 0;
                                      }
                                      widget.onQuantityChanged();
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 4.setWidth),
                                    child: Icon(
                                      Icons.remove,
                                      size: 18,
                                      color: CustomAppColor.of(context).txtGrey,
                                    ),
                                  ),
                                ),
                                VerticalDivider(width: 2.setWidth, color: CustomAppColor.of(context).containerBorder),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
                                  child: CommonText(
                                    text: food.quantity.toString(),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.setFontSize,
                                    textColor: CustomAppColor.of(context).primary,
                                  ),
                                ),
                                VerticalDivider(width: 2.setWidth, color: CustomAppColor.of(context).containerBorder),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      food.quantity++;
                                      widget.onQuantityChanged();
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 4.setWidth),
                                    child: Icon(
                                      Icons.add,
                                      size: 18,
                                      color: CustomAppColor.of(context).txtGrey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 15.setWidth),
                          CommonText(
                            text: "\$${(food.price ?? 0) * (food.quantity)}",
                            fontWeight: FontWeight.w600,
                            fontSize: 15.setFontSize,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 6.setHeight),
          Row(
            children: [
              Image.asset(
                AppAssets.icDocument,
                width: 24.setWidth,
                height: 24.setHeight,
              ),
              SizedBox(width: 10.setWidth),
              Expanded(
                child: CommonText(
                  text: Languages.of(context).txtAnyRestaurantRequest,
                  textColor: CustomAppColor.of(context).txtGrey,
                  fontSize: 13.setFontSize,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.3,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                ),
              )
            ],
          ),
          SizedBox(height: 6.setHeight),
        ],
      ),
    );
  }
}

class ApplyCouponView extends StatelessWidget {
  const ApplyCouponView({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: InkWell(
        onTap: () => Navigator.push(context, ApplyCouponScreen.route()),
        child: Container(
          color: CustomAppColor.of(context).bgScaffold,
          padding: EdgeInsets.symmetric(vertical: 16.setHeight, horizontal: 24.setWidth),
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
                    SizedBox(width: 14.setWidth),
                    CommonText(
                      text: Languages.of(context).txtApplyCoupon.toUpperCase(),
                      fontWeight: FontWeight.w600,
                      fontSize: 18.setFontSize,
                      letterSpacing: -0.3,
                    )
                  ],
                ),
              ),
              const Icon(Icons.navigate_next_rounded)
            ],
          ),
        ),
      ),
    );
  }
}

class BillDetailsView extends StatefulWidget {
  final List<FoodDetailData> foodList;
  const BillDetailsView({super.key, required this.foodList});

  @override
  State<BillDetailsView> createState() => _BillDetailsViewState();
}

class _BillDetailsViewState extends State<BillDetailsView> {
  final int deliveryFee = 58;
  final int taxAndCharges = 15;

  int getItemTotal() {
    return widget.foodList.fold(0, (sum, item) => sum + ((item.price ?? 0) * item.quantity));
  }

  int getOrderTotal() {
    return getItemTotal() + deliveryFee + taxAndCharges;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).bgScaffold,
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtBillDetails,
            fontWeight: FontWeight.w600,
            fontSize: 18.setFontSize,
          ),
          SizedBox(height: 10.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtItemTotal,
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtGrey,
              ),
              CommonText(
                text: "\$${getItemTotal()}",
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w600,
              )
            ],
          ),
          SizedBox(height: 6.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: "${Languages.of(context).txtDeliveryFeeFor} 9.71 kms",
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtGrey,
              ),
              CommonText(
                text: "+ \$$deliveryFee",
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w600,
              )
            ],
          ),
          SizedBox(height: 6.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtTaxAndCharge,
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtGrey,
              ),
              CommonText(
                text: "+ \$$taxAndCharges",
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w600,
              )
            ],
          ),
          SizedBox(height: 5.setHeight),
          Divider(color: CustomAppColor.of(context).containerBorder),
          SizedBox(height: 5.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtOrderTotal,
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).primary,
              ),
              CommonText(
                text: "\$${getOrderTotal()}",
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).primary,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SelectAddressView extends StatelessWidget {
  const SelectAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.setHeight, horizontal: 24.setWidth),
      color: CustomAppColor.of(context).bgScaffold,
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).bgScaffold,
                  borderRadius: BorderRadius.circular(1),
                  border: Border.all(
                    color: CustomAppColor.of(context).containerBorder,
                    width: 1,
                  ),
                ),
                child: Image.asset(
                  AppAssets.imgSmallMap,
                  fit: BoxFit.fill,
                  width: 90.setWidth,
                  height: 90.setHeight,
                ),
              ),
              Positioned(
                left: 78.setWidth,
                bottom: 78.setHeight,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 2.setWidth, vertical: 2.setHeight),
                  decoration: BoxDecoration(shape: BoxShape.circle, color: CustomAppColor.of(context).primary),
                  child: Icon(
                    Icons.check,
                    color: CustomAppColor.of(context).white,
                    size: 19,
                  ),
                ),
              )
            ],
          ),
          SizedBox(width: 20.setWidth),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: Languages.of(context).txtDeliverToOther,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.setFontSize,
                ),
                CommonText(
                  text: "47 W 13th St, New York, NY 10011, USA",
                  fontWeight: FontWeight.w400,
                  fontSize: 12.setFontSize,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textColor: CustomAppColor.of(context).txtGrey,
                ),
                SizedBox(height: 6.setHeight),
                CommonText(
                  text: "46 mins".toUpperCase(),
                  fontWeight: FontWeight.w600,
                  fontSize: 12.setFontSize,
                ),
                SizedBox(height: 16.setHeight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IgnorePointer(
                      ignoring: true,
                      child: InkWell(
                        onTap: () => Navigator.push(context, ManageAddressScreen.route()),
                        child: CommonText(
                          text: Languages.of(context).txtChangeAddress.toUpperCase(),
                          fontWeight: FontWeight.w700,
                          fontSize: 14.setFontSize,
                          textAlign: TextAlign.end,
                          textColor: CustomAppColor.of(context).primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProceedToPayView extends StatelessWidget {
  final List<FoodDetailData> foodList;

  const ProceedToPayView({super.key, required this.foodList});
  int getItemTotal() {
    return foodList.fold(0, (sum, item) => sum + ((item.price ?? 0) * item.quantity));
  }

  int getTotalAmount() {
    const int deliveryFee = 58;
    const int taxAndCharges = 15;
    return getItemTotal() + deliveryFee + taxAndCharges;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScaffold,
        border: Border(
          top: BorderSide(color: CustomAppColor.of(context).divider),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 13.setHeight),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: "\$${getTotalAmount()}",
                  fontSize: 18.setFontSize,
                  fontWeight: FontWeight.w700,
                ),
                CommonText(
                  text: Languages.of(context).txtViewPriceDetails.toUpperCase(),
                  fontSize: 15.setFontSize,
                  fontWeight: FontWeight.w700,
                  textColor: CustomAppColor.of(context).primary,
                ),
              ],
            ),
          ),
          Expanded(
            child: IgnorePointer(
              ignoring: true,
              child: CommonButton(
                onTap: () => Navigator.push(context, ProceedToPayScreen.route()),
                text: Languages.of(context).txtProceedToPay.toUpperCase(),
                height: 44.setHeight,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
      color: CustomAppColor.of(context).bgScaffold,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.imgEmptyCart,
            width: 148.setWidth,
            height: 182.setHeight,
          ),
          SizedBox(height: 25.setHeight),
          CommonText(
            text: Languages.of(context).txtEmptyCart,
            fontSize: 22.setFontSize,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 6.setHeight),
          CommonText(
            text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtGrey,
          )
        ],
      ),
    );
  }
}
