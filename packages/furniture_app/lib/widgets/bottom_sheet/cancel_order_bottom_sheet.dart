import 'package:flutter/material.dart';
import 'package:furniture_app_package/utils/sizer_utils.dart';

import '../../localization/language/languages.dart';
import '../../ui/my_orders/datamodel/my_order_data.dart';
import '../../utils/app_color.dart';
import '../../utils/constant.dart';
import '../button/common_button.dart';
import '../text/common_text.dart';

class CancelOrderSheet extends StatefulWidget {
  final OrderModel item;
  const CancelOrderSheet({super.key, required this.item});

  @override
  State<CancelOrderSheet> createState() => _CancelOrderSheetState();
}

class _CancelOrderSheetState extends State<CancelOrderSheet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bottomSheetBg,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: ListView(
          shrinkWrap: true,
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
            SizedBox(height: 10.setHeight),
            Center(
              child: CommonText(
                text: Languages.of(context).txtCancelOrder,
                fontSize: 24.setFontSize,
                fontFamily: Constant.fontFamilyBold700,
              ),
            ),
            Divider(height: 35.setHeight),
            SizedBox(height: 10.setHeight),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    widget.item.imageUrl,
                    height: 110.setHeight,
                    width: 110.setHeight,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(width: 16.setWidth),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: widget.item.productName,
                      fontFamily: Constant.fontFamilySemiBold600,
                      fontSize: 18.setFontSize,
                    ),
                    CommonText(
                      text: "\$${widget.item.price.toStringAsFixed(2)}",
                      fontFamily: Constant.fontFamilyBold700,
                      fontSize: 20.setFontSize,
                    ),
                    CommonText(
                      text: "${widget.item.quantity.toString()} : Qty",
                      fontFamily: Constant.fontFamilyMedium500,
                      fontSize: 14.setFontSize,
                    ),
                    SizedBox(height: 5.setHeight),
                    Row(
                      children: [
                        Container(
                          height: 10.setHeight,
                          width: 10.setWidth,
                          decoration: BoxDecoration(color: widget.item.color == "Orange" ? const Color(0xFFF19E5B) : null, shape: BoxShape.circle),
                        ),
                        SizedBox(width: 8.setWidth),
                        CommonText(
                          text: widget.item.color,
                          fontFamily: Constant.fontFamilyMedium500,
                          fontSize: 14.setFontSize,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 25.setHeight),
            Row(
              children: [
                Expanded(
                  child: CommonButton(
                    onTap: () => Navigator.pop(context, false),
                    text: "Don't Cancel",
                    borderColor: CustomAppColor.of(context).txtLightGrey.withValues(alpha: 0.5),
                    buttonColor: CustomAppColor.of(context).bottomSheetBg,
                    buttonTextColor: CustomAppColor.of(context).txtLightGrey.withValues(alpha: 0.5),
                  ),
                ),
                SizedBox(width: 12.setWidth),
                Expanded(
                  child: CommonButton(
                    onTap: () => Navigator.pop(context, true),
                    text: Languages.of(context).txtCancelOrder,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
