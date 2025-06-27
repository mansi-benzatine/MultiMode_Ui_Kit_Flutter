import 'package:flutter/material.dart';
import 'package:food_delivery_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:food_delivery_screens_app_package/localization/language/languages.dart';
import 'package:food_delivery_screens_app_package/ui/add_card/views/add_card_screen.dart';
import 'package:food_delivery_screens_app_package/ui/edit_card/views/edit_cards_screen.dart';
import 'package:food_delivery_screens_app_package/utils/app_color.dart';
import 'package:food_delivery_screens_app_package/utils/constant.dart';
import 'package:food_delivery_screens_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_screens_app_package/widgets/button/common_button.dart';
import 'package:food_delivery_screens_app_package/widgets/text/common_text.dart';
import 'package:food_delivery_screens_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';
import '../../proceed_to_pay/datamodels/proceed_to_pay_data.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const PaymentScreen());
  }

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> implements TopBarClickListener {
  List<WalletsData> walletList = [];
  List<WalletsData> creditDebitCardsList = [];

  void fillData() {
    walletList = [
      WalletsData(
        walletImageUrl: AppAssets.imgLogoAmazonPay,
        walletName: "Amazon Pay",
        isSelected: false,
      ),
      WalletsData(
        walletImageUrl: AppAssets.imgLogoPaytm,
        walletName: "Paytm",
        isSelected: true,
      ),
      WalletsData(
        walletImageUrl: AppAssets.imgLogoPhonePay,
        walletName: "PhonePe",
        isSelected: true,
      ),
      WalletsData(
        walletImageUrl: AppAssets.imgLogoFreeCharege,
        walletName: "FreeCharge",
        isSelected: false,
      ),
    ];
    creditDebitCardsList = [
      WalletsData(
        walletImageUrl: AppAssets.imgLogoMasterCard,
        walletName: "Credit Card",
        walletCardNumber: "**** **** **** 8978",
      ),
      WalletsData(
        walletImageUrl: AppAssets.imgLogoVisa,
        walletName: "Debit Card",
        walletCardNumber: "**** **** **** 8978",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtPayment,
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: IgnorePointer(
                  ignoring: true,
                  child: Column(
                    children: [
                      WalletListView(walletList: walletList),
                      Container(color: CustomAppColor.of(context).detailScreenBg, height: 8.setHeight),
                      CreditCardListView(creditCardList: creditDebitCardsList),
                      Container(color: CustomAppColor.of(context).detailScreenBg, height: 8.setHeight),
                      const NetBankingView()
                    ],
                  ),
                ),
              ),
            ),
            IgnorePointer(
              ignoring: true,
              child: Container(
                color: CustomAppColor.of(context).bgScaffold,
                padding: EdgeInsets.symmetric(vertical: 20.setHeight, horizontal: 24.setWidth),
                child: CommonButton(
                  text: Languages.of(context).txtAddNewCard.toUpperCase(),
                  borderColor: CustomAppColor.of(context).primary,
                  buttonTextColor: CustomAppColor.of(context).txtBlack,
                  buttonColor: CustomAppColor.of(context).transparent,
                  onTap: () => Navigator.push(context, AddCardScreen.route()),
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

class WalletListView extends StatelessWidget {
  final List<WalletsData> walletList;
  const WalletListView({super.key, required this.walletList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 14.setHeight),
      color: CustomAppColor.of(context).bgScaffold,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtWallets.toUpperCase(),
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 4.setHeight),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: walletList.length,
            itemBuilder: (context, index) {
              final item = walletList[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          item.walletImageUrl,
                          width: 60.setWidth,
                          height: 40.setHeight,
                        ),
                        SizedBox(width: 14.setWidth),
                        CommonText(
                          text: item.walletName,
                          fontSize: 16.setFontSize,
                          fontWeight: FontWeight.w600,
                        )
                      ],
                    ),
                    item.isSelected
                        ? CommonText(
                            text: "Linked",
                            fontSize: 16.setFontSize,
                            fontWeight: FontWeight.w700,
                            textColor: CustomAppColor.of(context).green,
                          )
                        : CommonText(
                            text: "Link Account",
                            fontSize: 16.setFontSize,
                            fontWeight: FontWeight.w700,
                            textColor: CustomAppColor.of(context).primary,
                          )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CreditCardListView extends StatelessWidget {
  final List<WalletsData> creditCardList;
  const CreditCardListView({super.key, required this.creditCardList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 14.setHeight),
      color: CustomAppColor.of(context).bgScaffold,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtCreditDebitCards.toUpperCase(),
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 10.setHeight),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: creditCardList.length,
            itemBuilder: (context, index) {
              final item = creditCardList[index];
              return InkWell(
                onTap: () => Navigator.push(context, EditCardScreen.route()),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            item.walletImageUrl,
                            width: 60.setWidth,
                            height: 40.setHeight,
                          ),
                          SizedBox(width: 14.setWidth),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: item.walletName,
                                fontSize: 16.setFontSize,
                                fontWeight: FontWeight.w600,
                              ),
                              CommonText(
                                text: item.walletCardNumber.toString(),
                                fontSize: 13.setFontSize,
                                fontWeight: FontWeight.w500,
                                textColor: CustomAppColor.of(context).txtGrey,
                              ),
                            ],
                          )
                        ],
                      ),
                      Icon(
                        Icons.navigate_next_rounded,
                        color: CustomAppColor.of(context).icBlack,
                        size: 20,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class NetBankingView extends StatelessWidget {
  const NetBankingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).bgScaffold,
      padding: EdgeInsets.symmetric(vertical: 14.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
            child: CommonText(
              text: Languages.of(context).txtNetBanking.toUpperCase(),
              fontSize: 18.setFontSize,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 20.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  AppAssets.imgLogoBank1,
                  height: 24.setHeight,
                  width: 90.setWidth,
                ),
                SizedBox(width: 30.setWidth),
                Image.asset(
                  AppAssets.imgLogoBank,
                  height: 24.setHeight,
                  width: 125.setWidth,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
