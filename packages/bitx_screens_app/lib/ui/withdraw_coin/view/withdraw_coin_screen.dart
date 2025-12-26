import 'package:bitx_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:bitx_screens_app/localization/language/languages.dart';
import 'package:bitx_screens_app/ui/home/view/home_screen.dart';
import 'package:bitx_screens_app/ui/payment_method/view/payment_method_screen.dart';
import 'package:bitx_screens_app/ui/withdraw_amount/view/withdraw_amount_screen.dart';
import 'package:bitx_screens_app/utils/app_assets.dart';
import 'package:bitx_screens_app/utils/app_color.dart';
import 'package:bitx_screens_app/utils/constant.dart';
import 'package:bitx_screens_app/utils/sizer_utils.dart';
import 'package:bitx_screens_app/widgets/text/common_text.dart';
import 'package:bitx_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../../widgets/button/common_button.dart';

class WithdrawCoinScreen extends StatefulWidget {
  final WishListItemData data;

  static Route<void> route({required WishListItemData data}) {
    return MaterialPageRoute(builder: (_) => WithdrawCoinScreen(data: data));
  }

  const WithdrawCoinScreen({super.key, required this.data});

  @override
  State<WithdrawCoinScreen> createState() => _WithdrawCoinScreenState();
}

class _WithdrawCoinScreenState extends State<WithdrawCoinScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtWithdraw,
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
                    SizedBox(height: 18.setHeight),
                    CommonText(
                      text: Languages.of(context).txtSelectAccountToWithdraw,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.setFontSize,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12.setHeight, horizontal: 15.setWidth),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border(
                          bottom: BorderSide(
                            color: CustomAppColor.of(context).bottomBorder,
                          ),
                        ),
                      ),
                      child: IgnorePointer(
                        ignoring: true,
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
                                  AppAssets.icPayPal,
                                  height: 20.setHeight,
                                  width: 20.setWidth,
                                ),
                              ),
                              SizedBox(width: 15.setWidth),
                              Expanded(
                                child: CommonText(
                                  text: Languages.of(context).txtPayPal,
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
                    ),
                    SizedBox(height: 20.setHeight),
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
                  child: IgnorePointer(
                    ignoring: true,
                    child: CommonButton(
                      text: Languages.of(context).txtContinue,
                      onTap: () => Navigator.push(context, WithdrawAmountScreen.route(data: widget.data)),
                    ),
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
