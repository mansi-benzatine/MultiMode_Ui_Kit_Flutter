import 'package:bitx_app/interfaces/top_bar_click_listener.dart';
import 'package:bitx_app/localization/language/languages.dart';
import 'package:bitx_app/ui/home/view/home_screen.dart';
import 'package:bitx_app/ui/search/view/searh_screen.dart';
import 'package:bitx_app/utils/app_assets.dart';
import 'package:bitx_app/utils/app_color.dart';
import 'package:bitx_app/utils/constant.dart';
import 'package:bitx_app/utils/sizer_utils.dart';
import 'package:bitx_app/widgets/button/common_button.dart';
import 'package:bitx_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../../dialogs/bottom_sheet/exchange_details_bottom_sheet.dart';
import '../../../widgets/text/common_text.dart';

class SelectExchangeStocksScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SelectExchangeStocksScreen());
  }

  const SelectExchangeStocksScreen({super.key});

  @override
  State<SelectExchangeStocksScreen> createState() => _SelectExchangeStocksScreenState();
}

class _SelectExchangeStocksScreenState extends State<SelectExchangeStocksScreen> implements TopBarClickListener {
  final portfolioItems = [
    WishListItemData(
      symbol: "BTC",
      company: "Bitcoin",
      price: "\$13,458",
      percentage: "2.53%",
      isPositive: true,
      color: Colors.blue,
      stockIcon: AppAssets.icBtBtc,
    ),
    WishListItemData(
      symbol: "ETH",
      company: "Ethereum",
      price: "\$12,276",
      percentage: "1.72%",
      isPositive: false,
      color: Colors.orange,
      stockIcon: AppAssets.icBtEth,
    ),
    WishListItemData(
      symbol: "LTC",
      company: "Litecoin",
      price: "\$14,540",
      percentage: "2.81%",
      isPositive: false,
      color: Colors.black,
      stockIcon: AppAssets.icBtItc,
    ),
    WishListItemData(
      symbol: "USDT",
      company: "Tether",
      price: "\$25,548",
      percentage: "1.51%",
      isPositive: true,
      color: Colors.red,
      stockIcon: AppAssets.icBtUsdt,
    ),
    WishListItemData(
      symbol: "DASH",
      company: "Dash",
      price: "\$25,448",
      percentage: "1.5%",
      isPositive: true,
      color: Colors.blue,
      stockIcon: AppAssets.icBtDash,
    ),
    WishListItemData(
      symbol: "ZEC",
      company: "Zcash",
      price: "\$20,548",
      percentage: "2.1%",
      isPositive: true,
      color: Colors.red,
      stockIcon: AppAssets.icBtZec,
    ),
    WishListItemData(
      symbol: "MASH",
      company: "Mash",
      price: "\$14,440",
      percentage: "1.2%",
      isPositive: false,
      color: Colors.blue,
      stockIcon: AppAssets.icBtMash,
    ),
    WishListItemData(
      symbol: "BNB",
      company: "Binance Coin",
      price: "\$25,948",
      percentage: "1.5%",
      isPositive: true,
      color: Colors.blue,
      stockIcon: AppAssets.icBtBnb,
    ),
  ];
  WishListItemData? selectedFrom;
  WishListItemData? selectedTo;
  final TextEditingController _selectedFromController = TextEditingController();
  final TextEditingController _selectedToController = TextEditingController();

  @override
  void initState() {
    super.initState();

    selectedFrom = portfolioItems.firstWhere((e) => e.symbol == "BTC");
    selectedTo = portfolioItems.firstWhere((e) => e.symbol == "ETH");
    _selectedFromController.addListener(() {
      if (_selectedFromController.text.isNotEmpty && !_selectedFromController.text.startsWith("\$")) {
        final newText = "\$${_selectedFromController.text.replaceAll("\$", "")}";
        _selectedFromController.value = _selectedFromController.value.copyWith(
          text: newText,
          selection: TextSelection.collapsed(offset: newText.length),
        );
      }
    });
    _selectedToController.addListener(() {
      if (_selectedToController.text.isNotEmpty && !_selectedToController.text.startsWith("\$")) {
        final newText = "\$${_selectedToController.text.replaceAll("\$", "")}";
        _selectedToController.value = _selectedToController.value.copyWith(
          text: newText,
          selection: TextSelection.collapsed(offset: newText.length),
        );
      }
    });
  }

  void _selectStock(bool isFrom) async {
    final result = await showModalBottomSheet<WishListItemData>(
      context: context,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(23)),
      ),
      backgroundColor: CustomAppColor.of(context).bottomSheetBg,
      builder: (_) {
        return ListView.separated(
          padding: EdgeInsets.only(top: 0.setHeight, right: 16.setWidth, left: 16.setWidth, bottom: 35.setHeight),
          itemCount: portfolioItems.length,
          separatorBuilder: (_, __) => Divider(
            color: CustomAppColor.of(context).greyIndicator,
            thickness: 0.5,
            height: 10,
          ),
          itemBuilder: (context, index) {
            final item = portfolioItems[index];
            return ListTile(
              leading: Image.asset(item.stockIcon, width: 40.setWidth, height: 40.setHeight),
              title: CommonText(
                textAlign: TextAlign.start,
                text: item.symbol,
                fontWeight: FontWeight.w700,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              subtitle: CommonText(
                text: item.company,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.w500,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              onTap: () => Navigator.pop(context, item),
            );
          },
        );
      },
    );

    if (result != null) {
      setState(() {
        if (isFrom) {
          selectedFrom = result;
        } else {
          selectedTo = result;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtExchange,
              isShowSearch: true,
              isShowBack: true,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      children: [
                        _stockSelectorCard(selectedFrom!, () => _selectStock(true), false, _selectedFromController),
                        SizedBox(height: 15.setHeight),
                        _stockSelectorCard(selectedTo!, () => _selectStock(false), true, _selectedToController),
                      ],
                    ),
                    Positioned(
                      top: 70,
                      left: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            final temp = selectedFrom;
                            selectedFrom = selectedTo;
                            selectedTo = temp;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomAppColor.of(context).border,
                            border: Border.all(
                              color: CustomAppColor.of(context).icRoundBg,
                              width: 5,
                            ),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(
                            Icons.swap_vert,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
              child: CommonButton(
                text: Languages.of(context).txtContinue,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (dialogContext) {
                      return ExchangeDetailsBottomSheet(
                        from: selectedFrom ??
                            WishListItemData(
                              symbol: "BTC",
                              company: "Bitcoin",
                              price: "\$13,458",
                              percentage: "2.53%",
                              isPositive: true,
                              color: Colors.blue,
                              stockIcon: AppAssets.icBtBtc,
                            ),
                        to: selectedTo ??
                            WishListItemData(
                              symbol: "ETH",
                              company: "Ethereum",
                              price: "\$12,276",
                              percentage: "1.72%",
                              isPositive: false,
                              color: Colors.orange,
                              stockIcon: AppAssets.icBtEth,
                            ),
                        parentContext: context,
                      );
                    },
                  );
                },
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
    if (name == Constant.strSearch) {
      Navigator.push(context, SearchScreen.route());
    }
  }

  Widget _stockSelectorCard(WishListItemData item, VoidCallback onTap, bool isSecondDropDown, TextEditingController controller) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18.setHeight, horizontal: 16.setWidth),
        decoration: BoxDecoration(
          gradient: CustomAppColor.of(context).linearGradiant,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: CustomAppColor.of(context).border,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.setWidth),
                child: TextFormField(
                  controller: controller,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    prefixText: '',
                    prefixStyle: TextStyle(
                      fontSize: 18.setFontSize,
                      color: CustomAppColor.of(context).txtBlack,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0,
                      package: "bitx_app",
                    ),
                    hintText: "\$1000",
                    hintStyle: TextStyle(
                      fontSize: 18.setFontSize,
                      color: CustomAppColor.of(context).txtGray,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0,
                      package: "bitx_app",
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: CustomAppColor.of(context).greyIndicator.withValues(alpha: 0.5),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: CustomAppColor.of(context).primary2,
                        width: 1,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 20),
                    filled: true,
                    fillColor: CustomAppColor.of(context).bgScreen,
                  ),
                  style: TextStyle(
                    fontSize: 18.setFontSize,
                    color: CustomAppColor.of(context).txtBlack,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0,
                    package: "bitx_app",
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            SizedBox(width: 25.setWidth),
            Expanded(
              child: Row(
                children: [
                  Image.asset(
                    item.stockIcon,
                    width: 45.setHeight,
                    height: 45.setHeight,
                  ),
                  SizedBox(width: 12.setWidth),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: item.symbol,
                          fontSize: 16.setFontSize,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w700,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                        SizedBox(height: 2.setHeight),
                        CommonText(
                          text: item.company,
                          maxLines: 1,
                          fontSize: 12.setFontSize,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Transform.rotate(
              angle: 3.14 + 4.70,
              child: Image.asset(
                AppAssets.icArrowRight,
                height: 18.setHeight,
                width: 18.setWidth,
                color: CustomAppColor.of(context).txtBlack,
              ),
            )
          ],
        ),
      ),
    );
  }
}
