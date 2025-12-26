import 'package:bitx_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:bitx_screens_app/localization/language/languages.dart';
import 'package:bitx_screens_app/ui/add_new_card/view/add_new_card_screen.dart';
import 'package:bitx_screens_app/utils/app_color.dart';
import 'package:bitx_screens_app/utils/constant.dart';
import 'package:bitx_screens_app/utils/sizer_utils.dart';
import 'package:bitx_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/app_assets.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text_field/text_form_field.dart';

class EditCardScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EditCardScreen());
  }

  const EditCardScreen({super.key});

  @override
  State<EditCardScreen> createState() => _EditCardScreenState();
}

class _EditCardScreenState extends State<EditCardScreen> implements TopBarClickListener {
  late TextEditingController cardHolderNAmeController;
  late TextEditingController cardNumberController;
  late TextEditingController cardExpiryDateController;
  late TextEditingController cvvController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    cardHolderNAmeController = TextEditingController(text: "Andrew Oliver");
    cardNumberController = TextEditingController(text: "1234 4567 7890 0123");
    cardExpiryDateController = TextEditingController(text: "08/25");
    cvvController = TextEditingController(text: "***");

    cardHolderNAmeController.addListener(() {
      setState(() {});
    });

    cardNumberController.addListener(() {
      setState(() {});
    });

    cardExpiryDateController.addListener(() {
      setState(() {});
    });

    cvvController.addListener(() {
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
              title: Languages.of(context).txtEditCard,
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
                    SizedBox(height: 25.setHeight),
                    CommonText(
                      text: Languages.of(context).txtCardDetails,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.setFontSize,
                    ),
                    SizedBox(height: 10.setHeight),
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
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(3),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.setWidth,
                        ),
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
                    SizedBox(
                      height: 40.setHeight,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
              child: Row(
                children: [
                  Expanded(
                    child: IgnorePointer(
                      ignoring: true,
                      child: CommonButton(
                        buttonColor: CustomAppColor.of(context).red.withValues(alpha: 0.2),
                        text: Languages.of(context).txtDelete,
                        buttonTextColor: CustomAppColor.of(context).red,
                        onTap: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.setWidth),
                  Expanded(
                    child: IgnorePointer(
                      ignoring: true,
                      child: CommonButton(
                        text: Languages.of(context).txtUpdate,
                        onTap: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ],
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
