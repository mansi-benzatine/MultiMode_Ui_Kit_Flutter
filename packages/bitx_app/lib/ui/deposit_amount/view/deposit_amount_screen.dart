import 'package:bitx_app/dialogs/bottom_sheet/deposit_details_bottom_sheet.dart';
import 'package:bitx_app/interfaces/top_bar_click_listener.dart';
import 'package:bitx_app/localization/language/languages.dart';
import 'package:bitx_app/ui/home/view/home_screen.dart';
import 'package:bitx_app/ui/payment_method/view/payment_method_screen.dart';
import 'package:bitx_app/utils/app_assets.dart';
import 'package:bitx_app/utils/app_color.dart';
import 'package:bitx_app/utils/constant.dart';
import 'package:bitx_app/utils/sizer_utils.dart';
import 'package:bitx_app/widgets/button/common_button.dart';
import 'package:bitx_app/widgets/text/common_text.dart';
import 'package:bitx_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

class DepositAmountScreen extends StatefulWidget {
  final WishListItemData data;

  static Route<void> route({required WishListItemData data}) {
    return MaterialPageRoute(builder: (_) => DepositAmountScreen(data: data));
  }

  const DepositAmountScreen({super.key, required this.data});

  @override
  State<DepositAmountScreen> createState() => _DepositAmountScreenState();
}

class _DepositAmountScreenState extends State<DepositAmountScreen> implements TopBarClickListener {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtDeposit,
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
                    _enterPriceView(),
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
            child: CommonButton(
              text: Languages.of(context).txtContinue,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (dialogContext) {
                    return DepositDetailsBottomSheet(
                      data: widget.data,
                      parentContext: context,
                      type: "Deposit",
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _enterPriceView() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.setHeight),
      child: TextFormField(
        controller: _controller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          prefixText: '',
          prefixStyle: TextStyle(
            fontSize: 24.setFontSize,
            color: CustomAppColor.of(context).txtBlack,
            fontWeight: FontWeight.w600,
            letterSpacing: 0,
            package: "bitx_app",
          ),
          hintText: "\$1000",
          hintStyle: TextStyle(
            fontSize: 24.setFontSize,
            color: CustomAppColor.of(context).txtGray,
            fontWeight: FontWeight.w600,
            letterSpacing: 0,
            package: "bitx_app",
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: CustomAppColor.of(context).primary,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: CustomAppColor.of(context).primary,
              width: 2,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          filled: true,
          fillColor: CustomAppColor.of(context).textFieldFillColor,
        ),
        style: TextStyle(
          fontSize: 24.setFontSize,
          color: CustomAppColor.of(context).txtBlack,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          package: "bitx_app",
        ),
        keyboardType: TextInputType.number,
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
