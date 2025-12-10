import 'package:flutter/material.dart';
import 'package:grokit_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:grokit_screens_app/localization/language/languages.dart';
import 'package:grokit_screens_app/ui/place_order/view/place_order_screen.dart';
import 'package:grokit_screens_app/utils/app_assets.dart';
import 'package:grokit_screens_app/utils/app_color.dart';
import 'package:grokit_screens_app/utils/constant.dart';
import 'package:grokit_screens_app/utils/sizer_utils.dart';
import 'package:grokit_screens_app/widgets/button/common_button.dart';
import 'package:grokit_screens_app/widgets/text/common_text.dart';
import 'package:grokit_screens_app/widgets/top_bar/topbar.dart';

class PaymentMethodScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const PaymentMethodScreen());
  }

  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> implements TopBarClickListener {
  String selectedPayment = 'Amazon Pay';

  final List<Map<String, dynamic>> wallets = [
    {'name': 'Amazon Pay', 'icon': AppAssets.icAmazonPay},
    {'name': 'PayPal', 'icon': AppAssets.icPayPal},
    {'name': 'Google Pay', 'icon': AppAssets.icSimpleGoogle},
    {'name': 'Apple Pay', 'icon': AppAssets.icApple1},
  ];

  final List<Map<String, dynamic>> cards = [
    {'name': 'MasterCard', 'icon': AppAssets.icMasterCard, 'number': '**** **** **** 56'},
    {'name': 'Visa', 'icon': AppAssets.icVisa, 'number': '**** **** **** 83'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).unselectedCard,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtPaymentMethod,
              isShowBack: true,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
                children: [
                  CommonText(
                    text: "WALLETS",
                    letterSpacing: 3,
                    textColor: CustomAppColor.of(context).txtGray,
                    fontFamily: Constant.fontFamilySemiBold600,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 10.setHeight),
                  ...wallets.map((wallet) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: _buildPaymentTile(wallet['name'], wallet['icon']),
                      )),
                  SizedBox(height: 10.setHeight),
                  CommonText(
                    text: "Cards".toUpperCase(),
                    letterSpacing: 3,
                    textColor: CustomAppColor.of(context).txtGray,
                    fontFamily: Constant.fontFamilySemiBold600,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 8.setHeight),
                  ...cards.map((card) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: _buildPaymentTile(card['name'], card['icon'], subtitle: card['number']),
                      )),
                  SizedBox(height: 10.setHeight),
                  CommonText(
                    text: "Pay on delivery".toUpperCase(),
                    letterSpacing: 3,
                    textColor: CustomAppColor.of(context).txtGray,
                    fontFamily: Constant.fontFamilySemiBold600,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 8.setHeight),
                  ListTile(
                    title: const CommonText(
                      text: "Cash On Delivery",
                      fontFamily: Constant.fontFamilySemiBold600,
                      textAlign: TextAlign.start,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    tileColor: CustomAppColor.of(context).cardBgBlackWhite,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    onTap: () {},
                  )
                ],
              ),
            ),
            Container(
              color: CustomAppColor.of(context).bgScreen,
              padding: EdgeInsets.only(left: 20.setWidth, bottom: 20.setHeight, right: 20.setWidth, top: 10.setWidth),
              child: IgnorePointer(
                ignoring: true,
                child: CommonButton(
                  text: Languages.of(context).txtContinue,
                  onTap: () => Navigator.push(context, PlaceOrderScreen.route()),
                  buttonColor: CustomAppColor.of(context).buttonPrimary,
                  borderColor: CustomAppColor.of(context).buttonPrimary,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentTile(String name, String iconPath, {String? subtitle}) {
    return ListTile(
      leading: Image.asset(
        iconPath,
        width: 20.setWidth,
        height: 20.setHeight,
      ),
      title: CommonText(
        text: name,
        fontFamily: Constant.fontFamilySemiBold600,
        textAlign: TextAlign.start,
      ),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: Radio<String>(
        value: name,
        visualDensity: VisualDensity.compact,
        activeColor: CustomAppColor.of(context).buttonPrimary,
        groupValue: selectedPayment,
        onChanged: (value) {
          setState(() {
            selectedPayment = value!;
          });
        },
      ),
      tileColor: CustomAppColor.of(context).cardBgBlackWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.setWidth),
      onTap: () {
        setState(() {
          selectedPayment = name;
        });
      },
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
