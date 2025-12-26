import 'package:bitx_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:bitx_screens_app/ui/home/view/home_screen.dart';
import 'package:bitx_screens_app/utils/app_color.dart';
import 'package:bitx_screens_app/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../enter_pin/view/enter_pin_screen.dart';

class SellScreen extends StatefulWidget {
  final WishListItemData data;

  static Route<void> route({required WishListItemData data}) {
    return MaterialPageRoute(builder: (_) => SellScreen(data: data));
  }

  const SellScreen({super.key, required this.data});

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> implements TopBarClickListener {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.text.isNotEmpty && !_controller.text.startsWith("\$")) {
        final newText = "\$${_controller.text.replaceAll("\$", "")}";
        _controller.value = _controller.value.copyWith(
          text: newText,
          selection: TextSelection.collapsed(offset: newText.length),
        );
      }
    });
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
              isShowBack: true,
              title: Languages.of(context).txtSell,
            ),
            Expanded(
              child: Column(
                children: [
                  _stockDetailsView(),
                  SizedBox(height: 10.setHeight),
                  _enterPriceView(),
                  SizedBox(height: 10.setHeight),
                  CommonText(
                    text: "${Languages.of(context).txtAvailableBalance} : \$25,901",
                    fontSize: 14.setFontSize,
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
              child: IgnorePointer(
                ignoring: true,
                child: CommonButton(
                  onTap: () => Navigator.push(context, EnterPinScreen.route(data: widget.data)),
                  text: Languages.of(context).txtContinue,
                ),
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

  Widget _stockDetailsView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 5.setHeight),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 17.setHeight),
        decoration: BoxDecoration(
          gradient: CustomAppColor.of(context).linearGradiant,
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          border: Border.all(
            color: CustomAppColor.of(context).border,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
                  children: [
                    CommonText(
                      text: widget.data.symbol,
                      fontSize: 16.setFontSize,
                      fontWeight: FontWeight.w700,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                    SizedBox(height: 4.setHeight),
                    CommonText(
                      text: widget.data.company,
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).txtGray,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CommonText(
                  text: Languages.of(context).txtMarketPrice,
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w500,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
                SizedBox(height: 4.setHeight),
                CommonText(
                  text: widget.data.price,
                  fontSize: 16.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _enterPriceView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 5.setHeight),
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
            package: "bitx_screens_app",
          ),
          hintText: "\$1000",
          hintStyle: TextStyle(
            fontSize: 24.setFontSize,
            color: CustomAppColor.of(context).txtGray,
            fontWeight: FontWeight.w600,
            letterSpacing: 0,
            package: "bitx_screens_app",
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: CustomAppColor.of(context).primary2,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: CustomAppColor.of(context).primary2,
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
          package: "bitx_screens_app",
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
