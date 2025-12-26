import 'package:bitx_screens_app/ui/home/view/home_screen.dart';
import 'package:bitx_screens_app/utils/sizer_utils.dart';
import 'package:bitx_screens_app/utils/utils.dart';
import 'package:bitx_screens_app/widgets/button/common_button.dart';
import 'package:bitx_screens_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../alerts/order_exchange_received_dialog.dart';

class ExchangeDetailsBottomSheet extends StatefulWidget {
  final WishListItemData from;
  final WishListItemData to;
  final BuildContext parentContext;

  const ExchangeDetailsBottomSheet({
    super.key,
    required this.from,
    required this.to,
    required this.parentContext,
  });
  @override
  State<ExchangeDetailsBottomSheet> createState() => _ExchangeDetailsBottomSheetState();
}

class _ExchangeDetailsBottomSheetState extends State<ExchangeDetailsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.setHeight),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bottomSheetBg,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Center(
            child: Container(
              width: 40.setWidth,
              height: 3.setHeight,
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Center(
            child: CommonText(
              text: "Exchange Details",
              fontSize: 20.setFontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: Divider(height: 24.setHeight),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(
                    widget.from.stockIcon,
                    width: 55.setWidth,
                    height: 55.setHeight,
                  ),
                  SizedBox(height: 15.setHeight),
                  CommonText(
                    text: widget.from.symbol,
                    fontSize: 16.setFontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.setWidth),
                child: const Icon(
                  Icons.swap_horiz_rounded,
                  size: 35,
                ),
              ),
              Column(
                children: [
                  Image.asset(
                    widget.to.stockIcon,
                    width: 55.setWidth,
                    height: 55.setHeight,
                  ),
                  SizedBox(height: 15.setHeight),
                  CommonText(
                    text: widget.to.symbol,
                    fontSize: 16.setFontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 15.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: CustomAppColor.of(context).greyIndicator.withValues(alpha: 0.5),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        text: "Fee",
                        fontWeight: FontWeight.w500,
                        fontSize: 12.setFontSize,
                      ),
                      const CommonText(
                        text: "-",
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.setHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        text: "Total (USD)",
                        fontWeight: FontWeight.w500,
                        fontSize: 12.setFontSize,
                      ),
                      const CommonText(
                        text: "\$1000",
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.setHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        text: "Total USDT",
                        fontWeight: FontWeight.w500,
                        fontSize: 12.setFontSize,
                      ),
                      const CommonText(
                        text: "0.016342576",
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  SizedBox(height: 5.setHeight),
                  const Divider(),
                  SizedBox(height: 5.setHeight),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        text: "Total Exchange",
                        fontWeight: FontWeight.w500,
                      ),
                      CommonText(
                        text: "\$1000",
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: IgnorePointer(
              ignoring: true,
              child: CommonButton(
                text: "Continue Exchange",
                onTap: () {
                  Navigator.pop(context);
                  showDialog(
                    context: widget.parentContext,
                    barrierColor: CustomAppColor.of(context).black.withOpacityPercent(0.3),
                    builder: (context) => OrderExchangeDialog(
                      icon1: widget.to.stockIcon,
                      icon2: widget.from.stockIcon,
                      title1: widget.to.symbol,
                      title2: widget.from.symbol,
                      onComplete: () {},
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
