import 'package:flutter/material.dart';
import 'package:food_delivery_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:food_delivery_screens_app_package/localization/language/languages.dart';
import 'package:food_delivery_screens_app_package/ui/confirm_order/views/confirm_order_screen.dart';
import 'package:food_delivery_screens_app_package/ui/manage_address/views/manage_address_screen.dart';
import 'package:food_delivery_screens_app_package/utils/app_assets.dart';
import 'package:food_delivery_screens_app_package/utils/app_color.dart';
import 'package:food_delivery_screens_app_package/utils/constant.dart';
import 'package:food_delivery_screens_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_screens_app_package/widgets/button/common_button.dart';
import 'package:food_delivery_screens_app_package/widgets/text/common_text.dart';
import 'package:food_delivery_screens_app_package/widgets/top_bar/topbar.dart';

import '../../home/datamodels/home_data.dart';

class OrderSummaryScreen extends StatefulWidget {
  const OrderSummaryScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const OrderSummaryScreen());
  }

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> implements TopBarClickListener {
  List<FoodDetailData> addedItemList = [];

  @override
  void initState() {
    super.initState();
    fillData();
  }

  void fillData() {
    addedItemList = [
      FoodDetailData(
        foodImageUrl: AppAssets.imgChickenSpeghetti,
        foodTypes: ["Burger", "American Food", "Desi Food"],
        price: 400,
        foodName: "Testy Burger",
      ),
      FoodDetailData(
        foodImageUrl: AppAssets.imgChickenSpeghetti,
        foodTypes: ["Sandwich", "American Food", "Desi Food"],
        price: 200,
        foodName: "Veg Hakka Noodles",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtOrderSummary,
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    OrderItemView(addedItemList: addedItemList),
                    Container(color: CustomAppColor.of(context).detailScreenBg, height: 8.setHeight),
                    const AddressView(),
                    Container(color: CustomAppColor.of(context).detailScreenBg, height: 8.setHeight),
                    const PaymentMethodView(),
                    Container(color: CustomAppColor.of(context).detailScreenBg, height: 8.setHeight),
                    BillDetailsView(foodList: addedItemList)
                  ],
                ),
              ),
            ),
            Container(
              color: CustomAppColor.of(context).bgScaffold,
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
              child: IgnorePointer(
                ignoring: true,
                child: CommonButton(
                  onTap: () => Navigator.push(context, ConfirmOrderScreen.route()),
                  text: Languages.of(context).txtConfirmOrder.toUpperCase(),
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
}

class OrderItemView extends StatelessWidget {
  final List<FoodDetailData> addedItemList;
  const OrderItemView({super.key, required this.addedItemList});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).bgScaffold,
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(height: 10.setHeight),
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
          SizedBox(height: 10.setHeight),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: addedItemList.length,
            itemBuilder: (context, index) {
              final item = addedItemList[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppAssets.icVeg,
                      width: 20.setWidth,
                      height: 20.setHeight,
                    ),
                    SizedBox(width: 10.setWidth),
                    CommonText(
                      text: item.foodName,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.setFontSize,
                    ),
                    const Spacer(),
                    CommonText(
                      text: "\$${item.price}",
                      fontWeight: FontWeight.w600,
                      fontSize: 15.setFontSize,
                      letterSpacing: -0.3,
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).bgScaffold,
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 14.setHeight),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtAddress,
                fontWeight: FontWeight.w600,
                fontSize: 18.setFontSize,
                letterSpacing: -0.3,
              ),
              IgnorePointer(
                ignoring: true,
                child: InkWell(
                  onTap: () => Navigator.push(context, ManageAddressScreen.route()),
                  child: Image.asset(
                    AppAssets.icEdit,
                    height: 20.setHeight,
                    width: 20.setWidth,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 14.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5.setHeight),
                child: Image.asset(
                  AppAssets.icLocationBlack,
                  height: 20.setHeight,
                  width: 20.setWidth,
                  color: CustomAppColor.of(context).icBlack,
                ),
              ),
              SizedBox(width: 15.setWidth),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CommonText(
                    text: Languages.of(context).txtHome,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.setFontSize,
                    letterSpacing: -0.3,
                  ),
                  SizedBox(height: 5.setHeight),
                  CommonText(
                    text: "47 W 13th St, New York, NY 10011, USA",
                    fontWeight: FontWeight.w400,
                    fontSize: 14.setFontSize,
                    letterSpacing: -0.3,
                    textColor: CustomAppColor.of(context).txtGrey,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class PaymentMethodView extends StatelessWidget {
  const PaymentMethodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).bgScaffold,
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 14.setHeight),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtPaymentMethod,
                fontWeight: FontWeight.w600,
                fontSize: 18.setFontSize,
                letterSpacing: -0.3,
              ),
              Image.asset(
                AppAssets.icEdit,
                height: 20.setHeight,
                width: 20.setWidth,
              )
            ],
          ),
          SizedBox(height: 14.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                AppAssets.icMoney,
                height: 25.setHeight,
                width: 43.setWidth,
              ),
              SizedBox(width: 35.setWidth),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CommonText(
                      text: Languages.of(context).txtCashOnDelivery,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.setFontSize,
                      letterSpacing: -0.3,
                    ),
                    SizedBox(height: 5.setHeight),
                    CommonText(
                      text: Languages.of(context).txtCashDesc,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.setFontSize,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      letterSpacing: -0.3,
                      textColor: CustomAppColor.of(context).txtGrey,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
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
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 14.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtBillDetails,
            fontWeight: FontWeight.w600,
            fontSize: 18.setFontSize,
          ),
          SizedBox(height: 20.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtItemTotal,
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w500,
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
                fontWeight: FontWeight.w500,
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
                fontWeight: FontWeight.w500,
                textColor: CustomAppColor.of(context).txtGrey,
              ),
              CommonText(
                text: "+ \$$taxAndCharges",
                fontSize: 16.setFontSize,
                fontWeight: FontWeight.w600,
              )
            ],
          ),
          SizedBox(height: 6.setHeight),
          Divider(color: CustomAppColor.of(context).containerBorder),
          SizedBox(height: 2.setHeight),
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
          SizedBox(height: 6.setHeight),
        ],
      ),
    );
  }
}
