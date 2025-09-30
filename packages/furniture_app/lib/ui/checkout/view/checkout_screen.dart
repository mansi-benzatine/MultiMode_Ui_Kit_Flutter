import 'package:flutter/material.dart';
import 'package:furniture_app_package/interfaces/top_bar_click_listener.dart';
import 'package:furniture_app_package/localization/language/languages.dart';
import 'package:furniture_app_package/ui/payment/view/payment_screen.dart';
import 'package:furniture_app_package/ui/product_details/view/product_details_screen.dart';
import 'package:furniture_app_package/utils/app_assets.dart';
import 'package:furniture_app_package/utils/app_color.dart';
import 'package:furniture_app_package/utils/constant.dart';
import 'package:furniture_app_package/utils/sizer_utils.dart';
import 'package:furniture_app_package/widgets/button/common_button.dart';
import 'package:furniture_app_package/widgets/text/common_text.dart';
import 'package:furniture_app_package/widgets/text_field/text_form_field.dart';
import 'package:furniture_app_package/widgets/top_bar/topbar.dart';

import '../../../widgets/bottom_sheet/remove_from_cart_bottom_sheet.dart';
import '../../address/views/address_screen.dart';
import '../../category_details/datamodel/catergory_details_data.dart';

class CheckoutScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const CheckoutScreen());
  }

  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> implements TopBarClickListener {
  final TextEditingController promoCodeController = TextEditingController();
  final List<ProductItem> productItems = [
    ProductItem(
      name: "Lolita Sofa",
      description: "Lolita Sofa",
      image: AppAssets.imgDummySofa,
      rating: 4.5,
      price: 299.00,
      category: "Sofa",
      color: "Orange",
      quantity: 1,
    ),
    ProductItem(
      name: "Night Lamp ",
      description: "Luxury Lamp",
      image: AppAssets.imgDummyLamp,
      rating: 4.5,
      price: 299.00,
      category: "Sofa",
      color: "Orange",
      quantity: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            TopBar(
              this,
              isShowBack: true,
              title: Languages.of(context).txtCheckout,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _addMoreOrderView(),
                      SizedBox(height: 5.setHeight),
                      _orderItemView(orderProducts: productItems),
                      _shippingAddressView(),
                      _promoCodeView(),
                      SizedBox(height: 20.setHeight),
                      _amountView(),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 20.setWidth),
              child: CommonButton(
                text: Languages.of(context).txtContinueToPayment,
                onTap: () => Navigator.push(context, PaymentScreen.route()),
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

  Widget _addMoreOrderView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommonText(
          text: Languages.of(context).txtOrderList,
          fontSize: 20.setFontSize,
          fontFamily: Constant.fontFamilyBold700,
        ),
        InkWell(
          onTap: () => Navigator.push(context, ProductDetailsScreen.route()),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4.setWidth, vertical: 4.setHeight),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CustomAppColor.of(context).primary,
            ),
            child: const Icon(Icons.add, color: Colors.white, size: 18),
          ),
        )
      ],
    );
  }

  Widget _orderItemView({required List<ProductItem> orderProducts}) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 20.setHeight),
      itemCount: orderProducts.length,
      itemBuilder: (context, index) {
        final items = orderProducts[index];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(12),
              child: Image.asset(
                items.image,
                width: 110.setHeight,
                height: 110.setHeight,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(width: 16.setWidth),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: items.name,
                    fontFamily: Constant.fontFamilySemiBold600,
                    fontSize: 18.setFontSize,
                  ),
                  CommonText(
                    text: "\$${items.price.toStringAsFixed(2)}",
                    fontFamily: Constant.fontFamilyBold700,
                    fontSize: 18.setFontSize,
                  ),
                  SizedBox(height: 5.setHeight),
                  CommonText(
                    text: "${items.quantity.toString()} : Qty",
                    fontFamily: Constant.fontFamilyMedium500,
                    fontSize: 14.setFontSize,
                  ),
                  SizedBox(height: 5.setHeight),
                  Row(
                    children: [
                      Container(
                        height: 10.setHeight,
                        width: 10.setWidth,
                        decoration: BoxDecoration(color: items.color == "Orange" ? const Color(0xFFF19E5B) : null, shape: BoxShape.circle),
                      ),
                      SizedBox(width: 8.setWidth),
                      CommonText(
                        text: items.color ?? "Orange",
                        fontFamily: Constant.fontFamilyMedium500,
                        fontSize: 14.setFontSize,
                      )
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      useSafeArea: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (_) => RemoveFromCartBottomSheet(item: items),
                    );
                  },
                  child: Image.asset(
                    AppAssets.icTrash,
                    width: 20.setWidth,
                    height: 20.setHeight,
                  ),
                ),
                SizedBox(height: 15.setHeight),
                Image.asset(
                  AppAssets.icEdit,
                  width: 20.setWidth,
                  height: 20.setHeight,
                  color: CustomAppColor.of(context).icBlackWhite,
                ),
              ],
            )
          ],
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 55.setHeight,
          color: CustomAppColor.of(context).dividerColor,
        );
      },
    );
  }

  Widget _shippingAddressView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.setHeight),
        CommonText(
          text: Languages.of(context).txtShippingAddress,
          fontSize: 20.setFontSize,
          fontFamily: Constant.fontFamilyBold700,
        ),
        SizedBox(height: 15.setHeight),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomAppColor.of(context).containerBg,
              ),
              child: Image.asset(
                AppAssets.icHome,
                height: 18.setHeight,
                width: 18.setHeight,
                color: CustomAppColor.of(context).icBlackWhite,
              ),
            ),
            SizedBox(width: 14.setWidth),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: "Home",
                    fontSize: 18.setFontSize,
                    fontFamily: Constant.fontFamilyBold700,
                  ),
                  CommonText(
                    text: "201 Washingtone ave, kentucky \n39495",
                    fontSize: 14.setFontSize,
                    textAlign: TextAlign.start,
                    height: 0,
                    textColor: CustomAppColor.of(context).txtGray,
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(context, AddressScreen.route()),
              child: Image.asset(
                AppAssets.icEdit,
                width: 20.setHeight,
                height: 20.setHeight,
                color: CustomAppColor.of(context).icBlackWhite,
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _promoCodeView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.setHeight),
        CommonText(
          text: Languages.of(context).txtPromoCode,
          fontSize: 20.setFontSize,
          fontFamily: Constant.fontFamilyBold700,
        ),
        SizedBox(height: 10.setHeight),
        CommonTextFormField(
          controller: promoCodeController,
          hintText: "Enter Promo Code",
          fillColor: CustomAppColor.of(context).additionalTextFormField,
          borderColor: CustomAppColor.of(context).additionalTextFormField,
          radius: 12,
        )
      ],
    );
  }

  Widget _amountView() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
              text: Languages.of(context).txtAmount,
              textColor: CustomAppColor.of(context).txtLightGrey,
              fontSize: 16.setFontSize,
              fontFamily: Constant.fontFamilyMedium500,
            ),
            CommonText(
              text: "\$448.00",
              textColor: CustomAppColor.of(context).txtLightGrey,
              fontSize: 16.setFontSize,
              fontFamily: Constant.fontFamilyMedium500,
            )
          ],
        ),
        SizedBox(height: 5.setHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
              text: Languages.of(context).txtShipping,
              textColor: CustomAppColor.of(context).txtLightGrey,
              fontSize: 16.setFontSize,
              fontFamily: Constant.fontFamilyMedium500,
            ),
            CommonText(
              text: "\$8.00",
              textColor: CustomAppColor.of(context).txtLightGrey,
              fontSize: 16.setFontSize,
              fontFamily: Constant.fontFamilyMedium500,
            )
          ],
        ),
        Divider(
          color: CustomAppColor.of(context).dividerColor,
          height: 35.setHeight,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
              text: Languages.of(context).txtTotalAmount,
              fontSize: 16.setFontSize,
              fontFamily: Constant.fontFamilySemiBold600,
            ),
            CommonText(
              text: "\$458.00",
              fontSize: 16.setFontSize,
              fontFamily: Constant.fontFamilySemiBold600,
            )
          ],
        ),
        SizedBox(height: 10.setHeight)
      ],
    );
  }
}
