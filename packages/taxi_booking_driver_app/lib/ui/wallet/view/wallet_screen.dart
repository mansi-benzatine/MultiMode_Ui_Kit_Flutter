import 'package:flutter/material.dart';
import 'package:taxi_booking_driver_app_package/interfaces/top_bar_click_listener.dart';
import 'package:taxi_booking_driver_app_package/localization/language/languages.dart';
import 'package:taxi_booking_driver_app_package/ui/add_card/view/add_card_screen.dart';
import 'package:taxi_booking_driver_app_package/utils/app_assets.dart';
import 'package:taxi_booking_driver_app_package/utils/app_color.dart';
import 'package:taxi_booking_driver_app_package/utils/constant.dart';
import 'package:taxi_booking_driver_app_package/utils/sizer_utils.dart';
import 'package:taxi_booking_driver_app_package/widgets/text/common_text.dart';
import 'package:taxi_booking_driver_app_package/widgets/top_bar/topbar.dart';

class WalletScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const WalletScreen());
  }

  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtWallet,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.account_balance_wallet,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  SizedBox(width: 12.setWidth),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: "Available Balance",
                        fontSize: 12.setFontSize,
                        textColor: CustomAppColor.of(context).txtGray,
                      ),
                      SizedBox(height: 4.setHeight),
                      CommonText(
                        text: "\$780.00",
                        fontSize: 20.setFontSize,
                        fontWeight: FontWeight.w700,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20.setHeight),
          Padding(
            padding: EdgeInsets.only(left: 20.setWidth, right: 10.setWidth),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: "Payment Method",
                  fontSize: 16.setFontSize,
                  fontWeight: FontWeight.w600,
                ),
                IconButton(
                  icon: const Icon(Icons.add_box_outlined),
                  onPressed: () {
                    Navigator.push(context, AddCardScreen.route());
                  },
                )
              ],
            ),
          ),
          SizedBox(height: 10.setHeight),
          _paymentMethodTile("Google pay", AppAssets.icGooglePay),
          _paymentMethodTile("PayPal", AppAssets.icPayPal),
          _paymentMethodTile("Apple Pay", AppAssets.icApple),
          _paymentMethodTile("**** **** 2748", AppAssets.icVisa),
        ],
      ),
    );
  }

  Widget _paymentMethodTile(String title, String iconPath) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 10.setHeight),
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: CustomAppColor.of(context).dividerColor,
              ),
            ),
            child: Image.asset(iconPath, width: 26, height: 26),
          ),
          title: CommonText(
            text: title,
            fontSize: 15.setFontSize,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w600,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: CustomAppColor.of(context).txtGray,
          ),
          onTap: () {},
        ),
        Divider(
          height: 1,
          color: CustomAppColor.of(context).dividerColor,
        ),
      ],
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
