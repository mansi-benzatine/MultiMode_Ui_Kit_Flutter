import 'package:bitx_app/localization/language/languages.dart';
import 'package:bitx_app/utils/app_assets.dart';
import 'package:bitx_app/utils/app_color.dart';
import 'package:bitx_app/utils/constant.dart' show Constant;
import 'package:bitx_app/utils/sizer_utils.dart';
import 'package:bitx_app/widgets/text/common_text.dart';
import 'package:bitx_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../widgets/button/common_button.dart';
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
  late TextEditingController cardHolderNAmeController;
  late TextEditingController cardNumberController;
  late TextEditingController cardExpiryDateController;
  late TextEditingController cvvController;

  @override
  void initState() {
    super.initState();
    cardHolderNAmeController = TextEditingController();
    cardNumberController = TextEditingController();
    cardExpiryDateController = TextEditingController();
    cvvController = TextEditingController();

    cardHolderNAmeController.addListener(() {
      setState(() {});
    });
    cardNumberController.addListener(() {
      setState(() {});
    });
    cardExpiryDateController.addListener(() {
      setState(() {});
    });
  }

  String formatCard(String input) {
    if (!RegExp(r'^\d{16}$').hasMatch(input)) return input;

    return input
        .replaceAllMapped(
          RegExp(r".{4}"),
          (match) => "${match.group(0)} ",
        )
        .trim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtAddNewCard,
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.asset(AppAssets.imgDummyVisaCard),
                        Positioned(
                          left: 10.setWidth,
                          bottom: 30.setHeight,
                          right: 20.setWidth,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ValueListenableBuilder(
                                valueListenable: cardNumberController,
                                builder: (context, value, _) {
                                  return CommonText(
                                    text: value.text.isEmpty ? "**** **** **** ****" : formatCard(value.text),
                                    textColor: CustomAppColor.of(context).white,
                                    fontSize: 20.setFontSize,
                                    fontWeight: FontWeight.w600,
                                  );
                                },
                              ),
                              SizedBox(height: 10.setHeight),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ValueListenableBuilder(
                                    valueListenable: cardHolderNAmeController,
                                    builder: (context, value, _) {
                                      return Expanded(
                                        child: CommonText(
                                          text: value.text.isEmpty ? "CARD HOLDER" : value.text.toUpperCase(),
                                          textColor: CustomAppColor.of(context).white,
                                          fontSize: 14.setFontSize,
                                          fontWeight: FontWeight.w600,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                        ),
                                      );
                                    },
                                  ),
                                  ValueListenableBuilder(
                                    valueListenable: cardExpiryDateController,
                                    builder: (context, value, _) {
                                      return Row(
                                        children: [
                                          CommonText(
                                            text: "Expiry date",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.setFontSize,
                                            textColor: CustomAppColor.of(context).white,
                                          ),
                                          SizedBox(width: 5.setWidth),
                                          CommonText(
                                            text: value.text.isEmpty ? '00/00' : value.text,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.setFontSize,
                                            textColor: CustomAppColor.of(context).white,
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.setHeight),
                    CommonText(
                      text: Languages.of(context).txtCardDetails,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.setFontSize,
                    ),
                    SizedBox(height: 14.setHeight),
                    CommonTextFormField(
                      controller: cardHolderNAmeController,
                      hintText: Languages.of(context).txtEnterCardHolderName,
                    ),
                    SizedBox(height: 20.setHeight),
                    CommonTextFormField(
                      controller: cardNumberController,
                      hintText: Languages.of(context).txtEnterCardNumber,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CardNumberFormatter(),
                      ],
                    ),
                    SizedBox(height: 20.setHeight),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CommonTextFormField(
                            controller: cvvController,
                            hintText: Languages.of(context).txtEnterCVV,
                            obscureText: true,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(3),
                            ],
                          ),
                        ),
                        SizedBox(width: 10.setWidth),
                        Expanded(
                          flex: 2,
                          child: CommonTextFormField(
                            controller: cardExpiryDateController,
                            hintText: Languages.of(context).txtEnterExpiryDate,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              CardExpiryDateFormatter(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
              child: CommonButton(
                text: Languages.of(context).txtContinue,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
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

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text.replaceAll(' ', '');
    if (text.length > 16) {
      text = text.substring(0, 16);
    }
    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      if ((i + 1) % 4 == 0 && i + 1 != text.length) {
        buffer.write('  ');
      }
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(
        offset: buffer.length,
      ),
    );
  }
}

class CardExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text.replaceAll(" ", "");
    if (text.length > 4) {
      text = text.substring(0, 4);
    }
    final bufferString = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      bufferString.write(text[i]);
      if ((i + 1) % 2 == 0 && i + 1 != text.length) {
        bufferString.write('/');
      }
    }
    return TextEditingValue(
      text: bufferString.toString(),
      selection: TextSelection.collapsed(
        offset: bufferString.length,
      ),
    );
  }
}
