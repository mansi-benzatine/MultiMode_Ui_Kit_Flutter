import 'package:flutter/material.dart';
import 'package:mantra_yoga_screens_app_package/utils/sizer_utils.dart';
import 'package:mantra_yoga_screens_app_package/widgets/text_field/text_form_field.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class CardOrWalletDetailsScreen extends StatefulWidget {
  const CardOrWalletDetailsScreen({super.key, required this.isFromCard});

  final bool isFromCard;

  static Route<dynamic> route({bool isFromCard = false}) {
    return MaterialPageRoute(builder: (context) => CardOrWalletDetailsScreen(isFromCard: isFromCard));
  }

  @override
  State<CardOrWalletDetailsScreen> createState() => _CardOrWalletDetailsScreenState();
}

class _CardOrWalletDetailsScreenState extends State<CardOrWalletDetailsScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            TopBar(
              this,
              title: widget.isFromCard ? Languages.of(context).txtVisa : Languages.of(context).txtMyWallet,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  left: 15.setWidth,
                  right: 15.setWidth,
                  top: 10.setHeight,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 210.setHeight,
                      width: 0.screenWidth,
                      padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, top: 15.setHeight, bottom: 50.setHeight),
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).bgScreen,
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(AppAssets.imgBgCardVisa),
                          fit: BoxFit.fill,
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      child: CommonText(
                        text: "8888 8888 8888",
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w600,
                        fontFamily: Constant.fontFamilySemiBold600,
                        textColor: CustomAppColor.of(context).black,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15.setHeight),
                      width: 0.screenWidth,
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).bgScreen,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1), width: 1),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 15.setHeight),
                      child: Column(
                        children: [
                          CommonText(
                            text: Languages.of(context).txtDetails,
                            fontSize: 14.setFontSize,
                            fontWeight: FontWeight.w600,
                            fontFamily: Constant.fontFamilySemiBold600,
                            textColor: CustomAppColor.of(context).txtBlack,
                          ),
                          Divider(
                            color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
                            height: 25.setHeight,
                          ),
                          SizedBox(height: 10.setHeight),
                          CommonTextFormField(
                            controller: TextEditingController(text: "Kenneth Stive"),
                            hintText: Languages.of(context).txtCardName,
                            keyboardType: TextInputType.name,
                          ),
                          SizedBox(height: 15.setHeight),
                          CommonTextFormField(
                            controller: TextEditingController(text: "7595 8690 8702"),
                            hintText: Languages.of(context).txtCardNumber,
                            keyboardType: TextInputType.name,
                          ),
                          SizedBox(height: 15.setHeight),
                          Row(
                            children: [
                              Expanded(
                                child: CommonTextFormField(
                                  controller: TextEditingController(text: "05/07/2028"),
                                  hintText: Languages.of(context).txtExpireDate,
                                  keyboardType: TextInputType.name,
                                ),
                              ),
                              SizedBox(width: 10.setWidth),
                              Expanded(
                                child: CommonTextFormField(
                                  controller: TextEditingController(text: "1636"),
                                  hintText: Languages.of(context).txtCVV,
                                  keyboardType: TextInputType.name,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.setHeight),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(width: 20.setWidth),
                Expanded(
                  child: CommonButton(
                    text: Languages.of(context).txtDelete,
                    onTap: () {},
                    buttonColor: CustomAppColor.of(context).txtRed.withValues(alpha: 0.1),
                    borderColor: CustomAppColor.of(context).txtRed,
                    buttonTextColor: CustomAppColor.of(context).txtRed,
                    radius: 18,
                  ),
                ),
                SizedBox(width: 10.setWidth),
                Expanded(
                  child: CommonButton(
                    text: Languages.of(context).txtUpdate,
                    onTap: () {},
                    buttonColor: CustomAppColor.of(context).primary,
                    borderColor: CustomAppColor.of(context).borderColor,
                    borderWidth: 3,
                    radius: 18,
                  ),
                ),
                SizedBox(width: 20.setWidth),
              ],
            ),
            SizedBox(height: 60.setHeight),
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
}
