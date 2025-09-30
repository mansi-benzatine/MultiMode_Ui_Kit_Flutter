import 'package:flutter/material.dart';
import 'package:stoxy_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:stoxy_screens_app_package/localization/language/languages.dart';
import 'package:stoxy_screens_app_package/ui/home/view/home_screen.dart';
import 'package:stoxy_screens_app_package/ui/preview_exchange/view/preview_exchange_screen.dart';
import 'package:stoxy_screens_app_package/utils/app_assets.dart';
import 'package:stoxy_screens_app_package/utils/app_color.dart';
import 'package:stoxy_screens_app_package/utils/constant.dart';
import 'package:stoxy_screens_app_package/utils/sizer_utils.dart';
import 'package:stoxy_screens_app_package/widgets/button/common_button.dart';
import 'package:stoxy_screens_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
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
      symbol: "TWTR",
      company: "Twitter Inc.",
      price: "\$131.58",
      percentage: "2.5%",
      isPositive: true,
      color: Colors.blue,
      stockIcon: AppAssets.icStockTwitter,
    ),
    WishListItemData(
      symbol: "AWS",
      company: "Amazon Inc.",
      price: "\$126.76",
      percentage: "1.2%",
      isPositive: false,
      color: Colors.orange,
      stockIcon: AppAssets.icStockAmazon,
    ),
    WishListItemData(
      symbol: "MDM",
      company: "Medium Inc",
      price: "\$148.40",
      percentage: "2.1%",
      isPositive: false,
      color: Colors.black,
      stockIcon: AppAssets.icStockMedium,
    ),
    WishListItemData(
      symbol: "NFLX",
      company: "Netflix Inc.",
      price: "\$254.48",
      percentage: "1.5%",
      isPositive: true,
      color: Colors.red,
      stockIcon: AppAssets.icStockNetflix,
    ),
    WishListItemData(
      symbol: "MCST",
      company: "Microsoft Inc.",
      price: "\$254.48",
      percentage: "1.5%",
      isPositive: true,
      color: Colors.blue,
      stockIcon: AppAssets.icStockMicrosoft,
    ),
    WishListItemData(
      symbol: "PNTS",
      company: "Pinterest Inc.",
      price: "\$204.48",
      percentage: "2.1%",
      isPositive: true,
      color: Colors.red,
      stockIcon: AppAssets.icStockPintrest,
    ),
    WishListItemData(
      symbol: "HST",
      company: "Hotstar Inc.",
      price: "\$148.40",
      percentage: "1.2%",
      isPositive: false,
      color: Colors.blue,
      stockIcon: AppAssets.icStockDisney,
    ),
    WishListItemData(
      symbol: "PYPL",
      company: "Paypal Inc.",
      price: "\$254.48",
      percentage: "1.5%",
      isPositive: true,
      color: Colors.blue,
      stockIcon: AppAssets.icStockPayPal,
    ),
    WishListItemData(
      symbol: "YUTB",
      company: "Youtube Inc.",
      price: "\$148.40",
      percentage: "2.1%",
      isPositive: false,
      color: Colors.red,
      stockIcon: AppAssets.icStockYoutube,
    ),
    WishListItemData(
      symbol: "ADB",
      company: "Adobe Inc.",
      price: "\$148.40",
      percentage: "1.2%",
      isPositive: false,
      color: Colors.red,
      stockIcon: AppAssets.icStockAdobe,
    ),
    WishListItemData(
      symbol: "SPOT",
      company: "Spotify Inc.",
      price: "\$254.48",
      percentage: "1.5%",
      isPositive: true,
      color: Colors.green,
      stockIcon: AppAssets.icStockSpotify,
    ),
  ];
  WishListItemData? selectedFrom;
  WishListItemData? selectedTo;
  final TextEditingController _selectedFromController = TextEditingController();
  final TextEditingController _selectedToController = TextEditingController();

  @override
  void initState() {
    super.initState();

    selectedFrom = portfolioItems.firstWhere((e) => e.symbol == "NFLX");
    selectedTo = portfolioItems.firstWhere((e) => e.symbol == "SPOT");
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
      builder: (_) {
        return ListView.separated(
          padding: EdgeInsets.only(top: 0.setHeight, right: 16.setWidth, left: 16.setWidth, bottom: 35.setHeight),
          itemCount: portfolioItems.length,
          separatorBuilder: (_, __) => Divider(
            color: CustomAppColor.of(context).txtDescriptionGray,
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
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              subtitle: CommonText(
                text: item.company,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.w600,
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
        body: Container(
          decoration: BoxDecoration(
            image: getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: true)
                ? null
                : DecorationImage(
                    image: AssetImage(AppAssets.imgCommonBackground),
                    fit: BoxFit.fill,
                  ),
          ),
          child: Column(
            children: [
              TopBar(
                this,
                title: Languages.of(context).txtSelectExchangeStocks,
                isShowMore: true,
                isShowBack: true,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                  child: Column(
                    children: [
                      SizedBox(height: 16.setHeight),
                      _stockSelectorCard(selectedFrom!, () => _selectStock(true), false, _selectedFromController),
                      SizedBox(height: 20.setHeight),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: CustomAppColor.of(context).greyIndicator,
                            ),
                          ),
                          SizedBox(width: 10.setWidth),
                          GestureDetector(
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
                                color: CustomAppColor.of(context).primary.withValues(alpha: 0.2),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: const Icon(
                                Icons.swap_vert,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.setWidth),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: CustomAppColor.of(context).greyIndicator,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25.setHeight),
                      _stockSelectorCard(selectedTo!, () => _selectStock(false), true, _selectedToController),
                    ],
                  ),
                ),
              ),
              IgnorePointer(
                ignoring: true,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
                  child: CommonButton(
                    gradient: CustomAppColor.of(context).primaryGradient,
                    text: Languages.of(context).txtContinue,
                    onTap: () => Navigator.push(context, PreviewExchangeScreen.route()),
                  ),
                ),
              )
            ],
          ),
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

  Widget _stockSelectorCard(WishListItemData item, VoidCallback onTap, bool isSecondDropDown, TextEditingController controller) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18.setHeight, horizontal: 16.setWidth),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgCard,
          borderRadius: BorderRadius.circular(20),
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
                      fontFamily: Constant.fontFamily,
                      letterSpacing: 0,
                      package: "stoxy_screens_app_package",
                    ),
                    hintText: "\$1000",
                    hintStyle: TextStyle(
                      fontSize: 18.setFontSize,
                      color: CustomAppColor.of(context).txtGray,
                      fontWeight: FontWeight.w600,
                      fontFamily: Constant.fontFamily,
                      letterSpacing: 0,
                      package: "stoxy_screens_app_package",
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
                    fillColor: CustomAppColor.of(context).textFieldFillColor,
                  ),
                  style: TextStyle(
                    fontSize: 18.setFontSize,
                    color: CustomAppColor.of(context).txtBlack,
                    fontWeight: FontWeight.w600,
                    fontFamily: Constant.fontFamily,
                    letterSpacing: 0,
                    package: "stoxy_screens_app_package",
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
                          fontWeight: FontWeight.w600,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                        SizedBox(height: 2.setHeight),
                        CommonText(
                          text: item.company,
                          maxLines: 1,
                          fontSize: 12.setFontSize,
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
                ))
          ],
        ),
      ),
    );
  }
}
