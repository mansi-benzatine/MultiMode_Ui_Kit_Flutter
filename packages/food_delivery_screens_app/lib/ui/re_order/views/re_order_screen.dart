import 'package:flutter/material.dart';
import 'package:food_delivery_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:food_delivery_screens_app_package/localization/language/languages.dart';
import 'package:food_delivery_screens_app_package/ui/confirm_order/views/confirm_order_screen.dart';
import 'package:food_delivery_screens_app_package/utils/constant.dart';
import 'package:food_delivery_screens_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_screens_app_package/widgets/dotted_divider/dotted_diveder.dart';
import 'package:food_delivery_screens_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';

class ReOrderScreen extends StatefulWidget {
  const ReOrderScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ReOrderScreen());
  }

  @override
  State<ReOrderScreen> createState() => _ReOrderScreenState();
}

class _ReOrderScreenState extends State<ReOrderScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
          top: false,
          child: Column(
            children: [
              TopBar(
                this,
                title: 'Order #34256842',
                isShowBack: true,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const AddressView(),
                      Container(color: CustomAppColor.of(context).detailScreenBg, height: 8.setHeight),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
                        color: CustomAppColor.of(context).bgScaffold,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.check,
                              color: CustomAppColor.of(context).green,
                            ),
                            SizedBox(width: 10.setWidth),
                            Expanded(
                              child: CommonText(
                                text: "${Languages.of(context).txtOrderDeliveredOn} February 26,12:10 PM \nby john brik",
                                fontSize: 14.setFontSize,
                                fontWeight: FontWeight.w400,
                                textColor: CustomAppColor.of(context).txtGrey,
                                letterSpacing: -0.3,
                                maxLines: 3,
                                textAlign: TextAlign.start,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(color: CustomAppColor.of(context).detailScreenBg, height: 8.setHeight),
                      const TotalAmountView(),
                    ],
                  ),
                ),
              ),
              IgnorePointer(
                ignoring: true,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
                  child: CommonButton(
                    text: Languages.of(context).txtReOrder.toUpperCase(),
                    onTap: () => Navigator.push(context, ConfirmOrderScreen.route()),
                  ),
                ),
              )
            ],
          )),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).bgScaffold,
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 18.setHeight),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Image.asset(
                AppAssets.icRestaurant,
                width: 19.setWidth,
                height: 19.setHeight,
                color: CustomAppColor.of(context).icBlack,
              ),
              Container(
                width: 1,
                height: 40.setHeight,
                margin: EdgeInsets.symmetric(vertical: 1.setHeight),
                color: CustomAppColor.of(context).containerBorder,
              ),
              Image.asset(
                AppAssets.icLocationBlack,
                width: 22.setWidth,
                height: 22.setHeight,
                color: CustomAppColor.of(context).icBlack,
              )
            ],
          ),
          SizedBox(width: 10.setWidth),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: "The Modern Restaurant",
                  fontWeight: FontWeight.w600,
                  fontSize: 16.setFontSize,
                  letterSpacing: -0.3,
                ),
                SizedBox(height: 2.setHeight),
                CommonText(
                  text: "2 Item",
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w400,
                  textColor: CustomAppColor.of(context).txtGrey,
                  letterSpacing: -0.3,
                ),
                SizedBox(height: 14.setHeight),
                CommonText(
                  text: "Home",
                  fontWeight: FontWeight.w600,
                  fontSize: 14.setFontSize,
                ),
                SizedBox(height: 2.setHeight),
                CommonText(
                  text: "47 W 13th St, New York, NY 10011, USA",
                  fontSize: 12.setFontSize,
                  fontWeight: FontWeight.w400,
                  textColor: CustomAppColor.of(context).txtGrey,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TotalAmountView extends StatelessWidget {
  const TotalAmountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    AppAssets.icVeg,
                    width: 18.setWidth,
                    height: 18.setHeight,
                  ),
                  SizedBox(width: 7.setWidth),
                  CommonText(
                    text: "Testy Burger x 2",
                    fontWeight: FontWeight.w600,
                    fontSize: 15.setFontSize,
                  )
                ],
              ),
              CommonText(
                text: "\$370",
                fontWeight: FontWeight.w600,
                fontSize: 15.setFontSize,
              )
            ],
          ),
          SizedBox(height: 18.setHeight),
          const DottedDivider(
            color: Color(0xFFB8BBC6),
            height: 2,
            dotWidth: 3,
            spacing: 4,
          ),
          SizedBox(height: 18.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtItemTotal,
                fontSize: 15.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtGrey,
              ),
              SizedBox(width: 7.setWidth),
              CommonText(
                text: "\$370.00",
                fontWeight: FontWeight.w600,
                fontSize: 15.setFontSize,
              )
            ],
          ),
          SizedBox(height: 8.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtDeliveryPartnerFee,
                fontSize: 15.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtGrey,
              ),
              SizedBox(width: 7.setWidth),
              CommonText(
                text: "+\$10.00",
                fontWeight: FontWeight.w600,
                fontSize: 15.setFontSize,
              )
            ],
          ),
          SizedBox(height: 8.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtDiscountApplied,
                fontSize: 15.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtGrey,
              ),
              SizedBox(width: 7.setWidth),
              CommonText(
                text: "-\$50.00",
                fontWeight: FontWeight.w600,
                fontSize: 15.setFontSize,
              )
            ],
          ),
          SizedBox(height: 8.setHeight),
          Divider(color: CustomAppColor.of(context).containerBorder),
          SizedBox(height: 8.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtPaidViaAmazonPay,
                fontSize: 15.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtGrey,
              ),
              SizedBox(width: 7.setWidth),
              CommonText(
                text: "Bill Amount \$330.00",
                fontWeight: FontWeight.w600,
                fontSize: 15.setFontSize,
              )
            ],
          ),
        ],
      ),
    );
  }
}
