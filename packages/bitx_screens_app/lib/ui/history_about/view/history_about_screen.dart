import 'package:bitx_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:bitx_screens_app/localization/language/languages.dart';
import 'package:bitx_screens_app/ui/deposite_coin/view/deposite_coin_screen.dart';
import 'package:bitx_screens_app/ui/exchange_stock/view/exchange_stock_screen.dart';
import 'package:bitx_screens_app/ui/history_about/datamodel/history_about_data.dart';
import 'package:bitx_screens_app/ui/transfer_coin/view/transfer_coin_screen.dart';
import 'package:bitx_screens_app/ui/withdraw_coin/view/withdraw_coin_screen.dart';
import 'package:bitx_screens_app/utils/app_assets.dart';
import 'package:bitx_screens_app/utils/app_color.dart';
import 'package:bitx_screens_app/utils/constant.dart';
import 'package:bitx_screens_app/utils/sizer_utils.dart';
import 'package:bitx_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../../widgets/text/common_text.dart';
import '../../home/view/home_screen.dart';

class HistoryAboutScreen extends StatefulWidget {
  final WishListItemData data;

  static Route<void> route({required WishListItemData data}) {
    return MaterialPageRoute(builder: (_) => HistoryAboutScreen(data: data));
  }

  const HistoryAboutScreen({super.key, required this.data});

  @override
  State<HistoryAboutScreen> createState() => _HistoryAboutScreenState();
}

class _HistoryAboutScreenState extends State<HistoryAboutScreen> implements TopBarClickListener {
  List<RecentHistory> recentHistory = [
    RecentHistory(
      company: "BTC",
      type: "Buy",
      status: "Complete",
      amount: "\$100",
      price: "\$32,165",
      total: "\$445.96",
    ),
    RecentHistory(
      company: "BTC",
      type: "Sell",
      status: "Complete",
      amount: "\$100",
      price: "\$32,165",
      total: "\$445.96",
    ),
    RecentHistory(
      company: "BTC",
      type: "Sell",
      status: "Complete",
      amount: "\$100",
      price: "\$32,165",
      total: "\$445.96",
    ),
    RecentHistory(
      company: "BTC",
      type: "Buy",
      status: "Complete",
      amount: "\$100",
      price: "\$32,165",
      total: "\$445.96",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: "${widget.data.symbol} - ${widget.data.company}",
            isShowBack: true,
            isShowMore: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                child: Column(
                  children: [
                    _stockDetailsView(),
                    SizedBox(height: 15.setHeight),
                    actionView(),
                    SizedBox(height: 20.setHeight),
                    Row(
                      children: [
                        Expanded(
                          child: optionsView(
                            bgColor: const Color(0xFFF8F6B2),
                            icon: AppAssets.icDeposit,
                            title: Languages.of(context).txtDeposit,
                            onTap: () => Navigator.push(context, DepositeCoinScreen.route(data: widget.data)),
                          ),
                        ),
                        SizedBox(width: 10.setWidth),
                        Expanded(
                          child: optionsView(
                            bgColor: const Color(0xFFE5C5FD),
                            icon: AppAssets.icWithdraw,
                            title: Languages.of(context).txtWithdraw,
                            onTap: () => Navigator.push(context, WithdrawCoinScreen.route(data: widget.data)),
                          ),
                        ),
                        SizedBox(width: 10.setWidth),
                        Expanded(
                          child: optionsView(
                            bgColor: const Color(0xFFC4DEF1),
                            icon: AppAssets.icExchange,
                            title: Languages.of(context).txtExchange,
                            onTap: () => Navigator.push(context, ExchangeStockScreen.route()),
                          ),
                        ),
                        SizedBox(width: 10.setWidth),
                        Expanded(
                          child: optionsView(
                            bgColor: const Color(0xFFFFA9A7),
                            icon: AppAssets.icTransfer,
                            title: Languages.of(context).txtTransfer,
                            onTap: () => Navigator.push(context, TransferCoinScreen.route(data: widget.data)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10.setHeight),
                    Divider(color: CustomAppColor.of(context).greyIndicator.withValues(alpha: 0.5)),
                    SizedBox(height: 5.setHeight),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                          text: Languages.of(context).txtRecentHistory,
                          fontWeight: FontWeight.w700,
                          fontSize: 15.setFontSize,
                        ),
                        CommonText(
                          text: Languages.of(context).txtViewMore,
                          fontWeight: FontWeight.w500,
                        )
                      ],
                    ),
                    SizedBox(height: 5.setHeight),
                    historyListView(),
                    SizedBox(height: 45.setHeight),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _stockDetailsView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonText(
              text: Languages.of(context).txtMarketPrice,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).txtGray,
            ),
            const CommonText(
              text: ": \$32,165.10",
              fontWeight: FontWeight.w700,
            )
          ],
        ),
        SizedBox(height: 15.setHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.data.stockIcon,
              width: 48.setWidth,
              height: 48.setHeight,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 12.setWidth),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CommonText(
                  text: widget.data.symbol,
                  fontSize: 18.setFontSize,
                  fontWeight: FontWeight.w700,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
                SizedBox(width: 8.setWidth),
                CommonText(
                  text: widget.data.company,
                  fontSize: 13.setFontSize,
                  fontWeight: FontWeight.w400,
                  textColor: CustomAppColor.of(context).txtGray,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 12.setHeight),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 3.setHeight),
            Column(
              children: [
                CommonText(
                  text: widget.data.price,
                  fontSize: 18.setFontSize,
                  fontWeight: FontWeight.w700,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
                SizedBox(height: 8.setHeight),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      widget.data.isPositive ? AppAssets.icArrowUp : AppAssets.icArrowDown,
                      height: 18.setHeight,
                      width: 18.setWidth,
                    ),
                    SizedBox(width: 6.setWidth),
                    CommonText(
                      text: widget.data.isPositive ? "+${widget.data.percentage}" : "-${widget.data.percentage}",
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w600,
                      fontFamily: Constant.fontFamily,
                      textColor: (widget.data.isPositive) ? CustomAppColor.of(context).green : CustomAppColor.of(context).red,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _actionTile({
    required String icon,
    required String title,
    required String amount,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            const Color(0xFFCFD7FB),
            const Color(0xFFCFD7FB).withValues(alpha: 0.3),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 12.setHeight),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).white,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  icon,
                  width: 17.setHeight,
                  height: 17.setHeight,
                ),
              ),
              SizedBox(width: 12.setWidth),
              CommonText(
                text: title,
                fontSize: 14.setFontSize,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          SizedBox(height: 6.setHeight),
          CommonText(
            text: amount,
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }

  Widget actionView() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _actionTile(
                icon: AppAssets.icAvailable,
                title: "Available BTC",
                amount: "\$3.46508",
              ),
            ),
            SizedBox(width: 10.setWidth),
            Expanded(
              child: _actionTile(
                icon: AppAssets.icInOrder,
                title: "In Order",
                amount: "0",
              ),
            ),
          ],
        ),
        SizedBox(height: 10.setHeight),
        Row(
          children: [
            Expanded(
              child: _actionTile(
                icon: AppAssets.icEquity,
                title: "Equity (USDT)",
                amount: "\$13.465.08",
              ),
            ),
            SizedBox(width: 10.setWidth),
            Expanded(
              child: _actionTile(
                icon: AppAssets.icDollar,
                title: "Equity (USD)",
                amount: "\$13.465.08",
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget optionsView({required Color bgColor, required String icon, required String title, required void Function() onTap}) {
    return Column(
      children: [
        IgnorePointer(
          ignoring: true,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(12),
                gradient: RadialGradient(
                  colors: [
                    bgColor.withValues(alpha: 0.5),
                    bgColor,
                  ],
                  focalRadius: 2,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 16.setHeight),
              child: Image.asset(
                icon,
                width: 22.setHeight,
                height: 22.setHeight,
              ),
            ),
          ),
        ),
        SizedBox(height: 10.setHeight),
        CommonText(
          text: title,
          fontSize: 13.setFontSize,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }

  Widget historyListView() {
    return Column(
      children: recentHistory.map((e) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10.setHeight),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: CustomAppColor.of(context).greyIndicator.withValues(alpha: 0.3),
              ),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: "${e.type.toUpperCase()} - ${e.company}",
                    fontWeight: FontWeight.w600,
                    fontSize: 13.setFontSize,
                  ),
                  CommonText(
                    text: "(${e.status})",
                    textColor: CustomAppColor.of(context).green,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              SizedBox(height: 6.setHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: Languages.of(context).txtPrice,
                        fontSize: 11.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtGray,
                      ),
                      SizedBox(height: 3.setHeight),
                      CommonText(
                        text: e.price,
                        fontWeight: FontWeight.w600,
                        fontSize: 13.setFontSize,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      CommonText(
                        text: Languages.of(context).txtAmount,
                        fontSize: 11.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtGray,
                      ),
                      SizedBox(height: 3.setHeight),
                      CommonText(
                        text: e.amount,
                        fontWeight: FontWeight.w600,
                        fontSize: 13.setFontSize,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CommonText(
                        text: Languages.of(context).txtTotalCost.replaceAll("Cost", ""),
                        fontSize: 11.setFontSize,
                        fontWeight: FontWeight.w600,
                        textColor: CustomAppColor.of(context).txtGray,
                      ),
                      SizedBox(height: 3.setHeight),
                      CommonText(
                        text: e.total,
                        fontWeight: FontWeight.w600,
                        fontSize: 13.setFontSize,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
