import 'package:bitx_app/interfaces/top_bar_click_listener.dart';
import 'package:bitx_app/localization/language/languages.dart';
import 'package:bitx_app/ui/home/view/home_screen.dart';
import 'package:bitx_app/ui/transfer_amount/view/transfer_amount_screen.dart';
import 'package:bitx_app/utils/app_color.dart';
import 'package:bitx_app/utils/constant.dart';
import 'package:bitx_app/utils/sizer_utils.dart';
import 'package:bitx_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../payment_method/view/payment_method_screen.dart';

class TransferCoinScreen extends StatefulWidget {
  final WishListItemData data;

  static Route<void> route({required WishListItemData data}) {
    return MaterialPageRoute(builder: (_) => TransferCoinScreen(data: data));
  }

  const TransferCoinScreen({super.key, required this.data});

  @override
  State<TransferCoinScreen> createState() => _TransferCoinScreenState();
}

class _TransferCoinScreenState extends State<TransferCoinScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtTransfer,
            isShowBack: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: CustomAppColor.of(context).linearGradiant,
                        border: Border.all(
                          color: CustomAppColor.of(context).border,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 12.setHeight),
                      child: Row(
                        children: [
                          Image.asset(
                            widget.data.stockIcon,
                            height: 45.setHeight,
                            width: 45.setWidth,
                          ),
                          SizedBox(width: 15.setWidth),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  text: widget.data.symbol,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.setFontSize,
                                ),
                                CommonText(
                                  text: widget.data.company,
                                  fontWeight: FontWeight.w500,
                                  textColor: CustomAppColor.of(context).txtGray,
                                )
                              ],
                            ),
                          ),
                          Image.asset(
                            AppAssets.icEdit,
                            width: 18.setHeight,
                            color: CustomAppColor.of(context).icBlack,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 15.setHeight),
                    CommonText(
                      text: Languages.of(context).txtPaymentMethod,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.setFontSize,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 14.setHeight, horizontal: 15.setWidth),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border(
                          bottom: BorderSide(
                            color: CustomAppColor.of(context).bottomBorder,
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.push(context, PaymentMethodScreen.route()),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: CustomAppColor.of(context).icRoundBg,
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                AppAssets.icWallet,
                                height: 20.setHeight,
                                width: 20.setWidth,
                                color: CustomAppColor.of(context).icBlack,
                              ),
                            ),
                            SizedBox(width: 15.setWidth),
                            Expanded(
                              child: CommonText(
                                text: Languages.of(context).txtMyWallet,
                                fontWeight: FontWeight.w600,
                                fontSize: 15.setFontSize,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Image.asset(
                              AppAssets.icEdit,
                              width: 18.setHeight,
                              color: CustomAppColor.of(context).icBlack,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.setHeight),
                    CommonText(
                      text: Languages.of(context).txtMyAddress,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.setFontSize,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 16.setHeight, horizontal: 15.setWidth),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border(
                          bottom: BorderSide(
                            color: CustomAppColor.of(context).bottomBorder,
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: CommonText(
                              text: "Taylor Square, New South Wales",
                              fontWeight: FontWeight.w600,
                              fontSize: 15.setFontSize,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Icon(
                            Icons.file_copy_outlined,
                            size: 16.setHeight,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.setWidth,
              bottom: 50.setHeight,
              right: 20.setWidth,
              top: 5.setHeight,
            ),
            child: Row(
              children: [
                Expanded(
                  child: CommonButton(
                    text: Languages.of(context).txtCancel,
                    buttonTextColor: CustomAppColor.of(context).txtBlack,
                    gradient: CustomAppColor.of(context).linearGradiant,
                  ),
                ),
                SizedBox(width: 12.setWidth),
                Expanded(
                  child: CommonButton(
                    text: Languages.of(context).txtContinue,
                    onTap: () => Navigator.push(context, TransferAmountScreen.route(data: widget.data)),
                  ),
                )
              ],
            ),
          )
        ],
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
