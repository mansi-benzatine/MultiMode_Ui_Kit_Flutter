import 'package:bitx_app/dialogs/alerts/order_received_dialog.dart';
import 'package:bitx_app/ui/home/view/home_screen.dart';
import 'package:bitx_app/utils/app_color.dart';
import 'package:bitx_app/utils/sizer_utils.dart';
import 'package:bitx_app/utils/utils.dart';
import 'package:bitx_app/widgets/button/common_button.dart';
import 'package:bitx_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

class DepositDetailsBottomSheet extends StatefulWidget {
  final WishListItemData data;
  final BuildContext parentContext;
  final String type;

  const DepositDetailsBottomSheet({
    super.key,
    required this.data,
    required this.parentContext,
    required this.type,
  });
  @override
  State<DepositDetailsBottomSheet> createState() => _DepositDetailsBottomSheetState();
}

class _DepositDetailsBottomSheetState extends State<DepositDetailsBottomSheet> {
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
              text: "${widget.type} Details",
              fontSize: 20.setFontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: Divider(height: 24.setHeight),
          ),
          Image.asset(
            widget.data.stockIcon,
            width: 60.setWidth,
            height: 60.setHeight,
          ),
          SizedBox(height: 15.setHeight),
          CommonText(
            text: widget.data.symbol,
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w700,
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
                        text: "Total Deposit",
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
                        text: "Amount To Withdraw",
                        fontWeight: FontWeight.w500,
                      ),
                      CommonText(
                        text: "Paypal",
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
            child: CommonButton(
              text: "Continue ${widget.type}",
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: widget.parentContext,
                  barrierColor: CustomAppColor.of(context).black.withOpacityPercent(0.3),
                  builder: (context) => OrderReceivedDialog(
                    title: widget.data.company,
                    icon: widget.data.stockIcon,
                    onComplete: () {},
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
