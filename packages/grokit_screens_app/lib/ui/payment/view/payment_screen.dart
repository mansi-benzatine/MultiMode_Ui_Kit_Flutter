import 'package:flutter/material.dart';
import 'package:grokit_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:grokit_screens_app/ui/add_new_card/view/add_new_card_screen.dart';
import 'package:grokit_screens_app/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../edit_card/view/edit_card_screen.dart';

class PaymentScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const PaymentScreen());
  }

  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> implements TopBarClickListener {
  String selectedPayment = 'Amazon Pay';

  final List<Map<String, dynamic>> wallets = [
    {
      'name': 'Amazon Pay',
      'icon': AppAssets.icAmazonPay,
      'isLinked': true,
    },
    {
      'name': 'PayPal',
      'icon': AppAssets.icPayPal,
      'isLinked': true,
    },
    {
      'name': 'Google Pay',
      'icon': AppAssets.icSimpleGoogle,
      'isLinked': false,
    },
    {
      'name': 'Apple Pay',
      'icon': AppAssets.icApple1,
      'isLinked': false,
    },
  ];

  final List<Map<String, dynamic>> cards = [
    {
      'name': 'MasterCard',
      'icon': AppAssets.icMasterCard,
      'number': '**** **** **** 56',
    },
    {
      'name': 'Visa',
      'icon': AppAssets.icVisa,
      'number': '**** **** **** 83',
    },
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
              title: Languages.of(context).txtPayment,
              isShowBack: true,
            ),
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
              children: [
                CommonText(
                  text: "WALLETS",
                  textColor: CustomAppColor.of(context).txtGray,
                  fontFamily: Constant.fontFamilySemiBold600,
                  textAlign: TextAlign.start,
                  letterSpacing: 3,
                ),
                SizedBox(height: 10.setHeight),
                ...wallets.map((wallet) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: _buildPaymentTile(
                        wallet['name'],
                        wallet['icon'],
                        isLinked: wallet['isLinked'],
                      ),
                    )),
                SizedBox(height: 10.setHeight),
                CommonText(
                  text: "Cards".toUpperCase(),
                  textColor: CustomAppColor.of(context).txtGray,
                  fontFamily: Constant.fontFamilySemiBold600,
                  textAlign: TextAlign.start,
                  letterSpacing: 3,
                ),
                SizedBox(height: 8.setHeight),
                ...cards.map((card) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: _buildCardTile(
                        card['name'],
                        card['icon'],
                        subtitle: card['number'],
                      ),
                    )),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 20.setWidth, bottom: 20.setHeight, right: 20.setWidth, top: 10.setWidth),
              child: IgnorePointer(
                ignoring: true,
                child: CommonButton(
                  text: Languages.of(context).txtAddNewCard,
                  onTap: () => Navigator.push(context, AddNewCardScreen.route()),
                  buttonColor: CustomAppColor.of(context).transparent,
                  buttonTextColor: CustomAppColor.of(context).txtBlack,
                  borderColor: CustomAppColor.of(context).txtBlack,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentTile(String name, String iconPath, {String? subtitle, required bool isLinked}) {
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
      trailing: CommonText(
        text: isLinked ? "Linked" : "Link Account",
        fontFamily: Constant.fontFamilySemiBold600,
        textColor: isLinked ? CustomAppColor.of(context).txtPrimary : CustomAppColor.of(context).txtBlack,
        fontSize: 12.setFontSize,
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

  Widget _buildCardTile(String name, String iconPath, {String? subtitle}) {
    return IgnorePointer(
      ignoring: true,
      child: GestureDetector(
        onTap: () => Navigator.push(context, EditCardScreen.route()),
        child: ListTile(
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
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 14.setHeight,
          ),
          tileColor: CustomAppColor.of(context).cardBgBlackWhite,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.setWidth),
          onTap: () {
            setState(() {
              selectedPayment = name;
            });
          },
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
