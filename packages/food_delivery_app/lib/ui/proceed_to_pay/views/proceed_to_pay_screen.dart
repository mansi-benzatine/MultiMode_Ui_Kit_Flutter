import 'package:flutter/material.dart';
import 'package:food_delivery_app_package/interfaces/top_bar_click_listener.dart';
import 'package:food_delivery_app_package/localization/language/languages.dart';
import 'package:food_delivery_app_package/ui/add_card/views/add_card_screen.dart';
import 'package:food_delivery_app_package/ui/order_summary/views/order_smmary_screen.dart';
import 'package:food_delivery_app_package/ui/proceed_to_pay/datamodels/proceed_to_pay_data.dart';
import 'package:food_delivery_app_package/utils/app_assets.dart';
import 'package:food_delivery_app_package/utils/app_color.dart';
import 'package:food_delivery_app_package/utils/constant.dart';
import 'package:food_delivery_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_app_package/widgets/button/common_button.dart';
import 'package:food_delivery_app_package/widgets/top_bar/topbar.dart';

import '../../../widgets/text/common_text.dart';

class ProceedToPayScreen extends StatefulWidget {
  const ProceedToPayScreen({super.key});
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ProceedToPayScreen());
  }

  @override
  State<ProceedToPayScreen> createState() => _ProceedToPayScreenState();
}

class _ProceedToPayScreenState extends State<ProceedToPayScreen> implements TopBarClickListener {
  List<WalletsData> walletList = [];
  List<WalletsData> creditDebitCardsList = [];

  void fillData() {
    walletList = [
      WalletsData(
        walletImageUrl: AppAssets.imgLogoAmazonPay,
        walletName: "Amazon Pay",
      ),
      WalletsData(
        walletImageUrl: AppAssets.imgLogoPaytm,
        walletName: "Paytm",
      ),
      WalletsData(
        walletImageUrl: AppAssets.imgLogoPhonePay,
        walletName: "PhonePe",
      ),
      WalletsData(
        walletImageUrl: AppAssets.imgLogoFreeCharege,
        walletName: "FreeCharge",
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
  void initState() {
    super.initState();
    fillData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: "Bill Total : \$875",
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AddressView(),
                    CommonSectionHeader(
                      text: Languages.of(context).txtWallets.toUpperCase(),
                      backgroundColor: CustomAppColor.of(context).detailScreenBg,
                    ),
                    WalletsSelectionView(walletList: walletList),
                    CommonSectionHeader(
                      text: Languages.of(context).txtCreditDebitCards.toUpperCase(),
                      backgroundColor: CustomAppColor.of(context).detailScreenBg,
                    ),
                    CreditDebitCardsView(creditDebitCardsList: creditDebitCardsList),
                    CommonSectionHeader(
                      text: Languages.of(context).txtNetBanking.toUpperCase(),
                      backgroundColor: CustomAppColor.of(context).detailScreenBg,
                    ),
                    const NetBankingView(),
                    CommonSectionHeader(
                      text: Languages.of(context).txtUPI.toUpperCase(),
                      backgroundColor: CustomAppColor.of(context).detailScreenBg,
                    ),
                    const UpiView(),
                    CommonSectionHeader(
                      text: Languages.of(context).txtPayOnDelivery.toUpperCase(),
                      backgroundColor: CustomAppColor.of(context).detailScreenBg,
                    ),
                    const PayOnDeliveryView()
                  ],
                ),
              ),
            ),
            Container(
              color: CustomAppColor.of(context).detailScreenBg,
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
              child: CommonButton(
                text: Languages.of(context).txtContinue.toUpperCase(),
                onTap: () => Navigator.push(context, OrderSummaryScreen.route()),
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

class CommonSectionHeader extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Alignment alignment;
  final EdgeInsetsGeometry padding;

  const CommonSectionHeader({
    super.key,
    required this.text,
    this.backgroundColor,
    this.alignment = Alignment.topLeft,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: alignment,
      color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      padding: padding,
      child: CommonText(
        text: text,
        fontWeight: FontWeight.w700,
        fontSize: 16.setFontSize,
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
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 18.setHeight),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Image.asset(
                AppAssets.icRestaurant,
                width: 20.setWidth,
                height: 20.setHeight,
                color: CustomAppColor.of(context).icBlack,
              ),
              Container(
                width: 1,
                height: 30.setHeight,
                margin: EdgeInsets.symmetric(vertical: 4.setHeight),
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
                  text: "The Garden Restaurant",
                  fontWeight: FontWeight.w600,
                  fontSize: 14.setFontSize,
                ),
                SizedBox(height: 2.setHeight),
                CommonText(
                  text: "2 Items | ETA: 34 mins",
                  fontSize: 12.setFontSize,
                  fontWeight: FontWeight.w400,
                  textColor: CustomAppColor.of(context).txtGrey,
                ),
                SizedBox(height: 12.setHeight),
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

class WalletsSelectionView extends StatelessWidget {
  final List<WalletsData> walletList;
  const WalletsSelectionView({super.key, required this.walletList});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).bgScaffold,
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: walletList.length,
        itemBuilder: (context, index) {
          final wallet = walletList[index];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10.setHeight),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      wallet.walletImageUrl,
                      height: 40.setHeight,
                      width: 60.setWidth,
                    ),
                    SizedBox(width: 14.setWidth),
                    CommonText(
                      text: wallet.walletName,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.setFontSize,
                    ),
                  ],
                ),
                CommonText(
                  text: Languages.of(context).txtLinkAccount,
                  textColor: CustomAppColor.of(context).primary,
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w700,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class CreditDebitCardsView extends StatefulWidget {
  final List<WalletsData> creditDebitCardsList;
  const CreditDebitCardsView({super.key, required this.creditDebitCardsList});

  @override
  State<CreditDebitCardsView> createState() => _CreditDebitCardsViewState();
}

class _CreditDebitCardsViewState extends State<CreditDebitCardsView> {
  int? selectedCardIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).bgScaffold,
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.creditDebitCardsList.length,
            itemBuilder: (context, index) {
              final wallet = widget.creditDebitCardsList[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 14.setHeight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          wallet.walletImageUrl,
                          height: 40.setHeight,
                          width: 60.setWidth,
                        ),
                        SizedBox(width: 14.setWidth),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: wallet.walletName,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.setFontSize,
                            ),
                            CommonText(
                              text: wallet.walletCardNumber.toString(),
                              fontWeight: FontWeight.w500,
                              fontSize: 13.setFontSize,
                              textColor: CustomAppColor.of(context).txtGrey,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        radioTheme: RadioThemeData(
                          fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                            if (states.contains(WidgetState.selected)) {
                              return CustomAppColor.of(context).primary;
                            }
                            return CustomAppColor.of(context).grey;
                          }),
                        ),
                      ),
                      child: Radio<int>(
                        value: index,
                        groupValue: selectedCardIndex,
                        onChanged: (value) {
                          setState(() {
                            selectedCardIndex = value!;
                          });
                        },
                        visualDensity: const VisualDensity(horizontal: -4.0, vertical: -4.0),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          InkWell(
            onTap: () => Navigator.push(context, AddCardScreen.route()),
            child: CommonText(
              text: Languages.of(context).txtAdd.toUpperCase(),
              textColor: CustomAppColor.of(context).primary,
              fontWeight: FontWeight.w700,
              fontSize: 15.setFontSize,
            ),
          )
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
      padding: EdgeInsets.symmetric(horizontal: 6.setWidth, vertical: 16.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Image.asset(
                AppAssets.imgLogoBank1,
                height: 22.setHeight,
                width: 126.setWidth,
              ),
              SizedBox(width: 10.setWidth),
              Image.asset(
                AppAssets.imgLogoBank,
                height: 26.setHeight,
                width: 125.setWidth,
              ),
            ],
          ),
          SizedBox(height: 16.setHeight),
          Padding(
            padding: EdgeInsets.only(right: 20.setWidth),
            child: CommonText(
              text: Languages.of(context).txtMoreBanks.toUpperCase(),
              fontSize: 15.setFontSize,
              fontWeight: FontWeight.w700,
              textColor: CustomAppColor.of(context).primary,
            ),
          )
        ],
      ),
    );
  }
}

class UpiView extends StatelessWidget {
  const UpiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).bgScaffold,
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: Languages.of(context).txtAddANewUPI,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.setFontSize,
                ),
                CommonText(
                  text: Languages.of(context).txtYouNeedToHaveARegisteredUpiId,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.setFontSize,
                  textColor: CustomAppColor.of(context).txtGrey,
                ),
              ],
            ),
          ),
          CommonText(
            text: Languages.of(context).txtAdd.toUpperCase(),
            textColor: CustomAppColor.of(context).primary,
            fontWeight: FontWeight.w700,
            fontSize: 15.setFontSize,
          )
        ],
      ),
    );
  }
}

class PayOnDeliveryView extends StatefulWidget {
  const PayOnDeliveryView({super.key});

  @override
  State<PayOnDeliveryView> createState() => _PayOnDeliveryViewState();
}

class _PayOnDeliveryViewState extends State<PayOnDeliveryView> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).bgScaffold,
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
      child: Row(
        children: [
          Image.asset(
            AppAssets.icMoney,
            width: 43.setWidth,
            height: 25.setHeight,
          ),
          SizedBox(width: 30.setWidth),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: Languages.of(context).txtCash,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.setFontSize,
                ),
                CommonText(
                  text: Languages.of(context).txtCashDesc,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.setFontSize,
                  letterSpacing: -0.3,
                  height: 1.2,
                  textColor: CustomAppColor.of(context).txtGrey,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          SizedBox(width: 10.setWidth),
          GestureDetector(
            onTap: () {
              setState(() {
                isSelected = !isSelected;
              });
            },
            child: Container(
              width: 20.setWidth,
              height: 20.setWidth,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: CustomAppColor.of(context).primary, width: 2),
                color: isSelected ? CustomAppColor.of(context).primary : Colors.transparent,
              ),
              child: isSelected ? Icon(Icons.check, size: 16.setFontSize, color: Colors.white) : null,
            ),
          ),
        ],
      ),
    );
  }
}
