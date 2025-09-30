import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture_app_package/interfaces/top_bar_click_listener.dart';
import 'package:furniture_app_package/localization/language/languages.dart';
import 'package:furniture_app_package/utils/app_assets.dart';
import 'package:furniture_app_package/utils/app_color.dart';
import 'package:furniture_app_package/utils/constant.dart';
import 'package:furniture_app_package/utils/sizer_utils.dart';
import 'package:furniture_app_package/widgets/button/common_button.dart';
import 'package:furniture_app_package/widgets/text/common_text.dart';
import 'package:furniture_app_package/widgets/top_bar/topbar.dart';

import '../../../widgets/text_field/text_form_field.dart';

class AddNewCardScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const AddNewCardScreen());
  }

  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> implements TopBarClickListener {
  final TextEditingController cardNumberController = TextEditingController(text: "");
  final TextEditingController cardHolderNameController = TextEditingController(text: "");
  final TextEditingController cvvController = TextEditingController(text: "");
  final TextEditingController expireDateController = TextEditingController(text: "");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cardNumberController.addListener(() => setState(() {}));
    cardHolderNameController.addListener(() => setState(() {}));
    cvvController.addListener(() => setState(() {}));
    expireDateController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtAddNewCard,
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 10.setHeight),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              AppAssets.imgCardView,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 80.setHeight,
                            left: 20.setWidth,
                            child: CommonText(
                              text: cardNumberController.text.isEmpty ? "* * * *    * * * *    * * * *    1 2 3 4" : cardNumberController.text,
                              textColor: CustomAppColor.of(context).white,
                              fontSize: 22.setFontSize,
                              fontFamily: Constant.fontFamilySemiBold600,
                            ),
                          ),
                          Positioned(
                            bottom: 30.setHeight,
                            left: 20.setWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  text: "Card Holder Name".toUpperCase(),
                                  textColor: CustomAppColor.of(context).white,
                                  fontSize: 12.setFontSize,
                                ),
                                SizedBox(height: 5.setHeight),
                                CommonText(
                                  text: cardHolderNameController.text.isEmpty ? "CARD HOLDER" : cardHolderNameController.text.toUpperCase(),
                                  textColor: CustomAppColor.of(context).white,
                                  fontSize: 16.setFontSize,
                                  fontFamily: Constant.fontFamilyMedium500,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 30.setHeight,
                            right: 20.setWidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  text: "Expires".toUpperCase(),
                                  textColor: CustomAppColor.of(context).white,
                                  fontSize: 12.setFontSize,
                                ),
                                SizedBox(height: 5.setHeight),
                                CommonText(
                                  text: expireDateController.text.isEmpty ? "MM/YY" : expireDateController.text,
                                  textColor: CustomAppColor.of(context).white,
                                  fontSize: 16.setFontSize,
                                  fontFamily: Constant.fontFamilyMedium500,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25.setHeight),
                      SizedBox(height: 20.setHeight),
                      CommonTextFormField(
                        controller: cardHolderNameController,
                        hintText: Languages.of(context).txtEnterCardHolderName,
                        titleText: Languages.of(context).txtCardHolderName,
                      ),
                      SizedBox(height: 25.setHeight),
                      CommonTextFormField(
                        controller: cardNumberController,
                        keyboardType: TextInputType.number,
                        hintText: Languages.of(context).txtEnterCardNumber,
                        titleText: Languages.of(context).txtCardNumber,
                        inputFormatters: [
                          CustomInputFormatter(),
                        ],
                      ),
                      SizedBox(height: 25.setHeight),
                      Row(
                        children: [
                          Expanded(
                            child: CommonTextFormField(
                              obscureText: true,
                              controller: cvvController,
                              keyboardType: TextInputType.number,
                              hintText: Languages.of(context).txtEnterCvv,
                              titleText: Languages.of(context).txtCvv,
                            ),
                          ),
                          SizedBox(width: 16.setWidth),
                          Expanded(
                            flex: 2,
                            child: CommonTextFormField(
                              controller: expireDateController,
                              keyboardType: TextInputType.number,
                              hintText: Languages.of(context).txtEnterCardExpireDate,
                              titleText: Languages.of(context).txtExpireDate,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                ExpiryDateInputFormatter(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.setHeight, horizontal: 22.setWidth),
              child: CommonButton(text: Languages.of(context).txtAdd),
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
}

class ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (text.length > 4) {
      text = text.substring(0, 4);
    }

    StringBuffer buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      if (i == 2) buffer.write('/');
      buffer.write(text[i]);
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}

class CustomInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Extract only digits from the input
    var text = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (text.length > 16) {
      text = text.substring(0, 16);
    }

    StringBuffer buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      buffer.write(' ');

      if (i == 4 || i == 8 || i == 12) buffer.write('  ');
      buffer.write(text[i]);
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}
