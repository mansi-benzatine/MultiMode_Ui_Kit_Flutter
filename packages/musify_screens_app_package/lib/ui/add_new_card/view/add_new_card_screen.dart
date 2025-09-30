import 'package:flutter/material.dart';
import 'package:musify_screens_app_package/localization/language/languages.dart';
import 'package:musify_screens_app_package/utils/app_color.dart';
import 'package:musify_screens_app_package/utils/constant.dart' show Constant;
import 'package:musify_screens_app_package/utils/sizer_utils.dart';
import 'package:musify_screens_app_package/widgets/button/common_button.dart';
import 'package:musify_screens_app_package/widgets/top_bar/topbar.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../utils/app_assets.dart';
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
  final TextEditingController cardHolderNAmeController = TextEditingController(text: "Stilva Larsen");
  final TextEditingController cardNumberController = TextEditingController(text: "1234 5678 9012 3456");
  final TextEditingController cardExpiryDateController = TextEditingController(text: "12/12");
  final TextEditingController cvvController = TextEditingController(text: "123");

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
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
                child: Column(
                  children: [
                    Image.asset(
                      AppAssets.imgDummyCard,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      height: 40.setHeight,
                    ),
                    CommonTextFormField(
                      controller: cardHolderNAmeController,
                      hintText: Languages.of(context).txtEnterCardHolderName,
                      titleText: Languages.of(context).txtCardHolderName,
                    ),
                    SizedBox(
                      height: 20.setHeight,
                    ),
                    CommonTextFormField(
                      controller: cardNumberController,
                      hintText: Languages.of(context).txtEnterCardNumber,
                      titleText: Languages.of(context).txtCardNumber,
                    ),
                    SizedBox(
                      height: 20.setHeight,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CommonTextFormField(
                            controller: cvvController,
                            hintText: Languages.of(context).txtEnterCVV,
                            titleText: Languages.of(context).txtCVV,
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
                            titleText: Languages.of(context).txtExpiryDate,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40.setHeight,
                    ),
                    CommonButton(
                      text: Languages.of(context).txtAddNewCard,
                      onTap: () {},
                    ),
                  ],
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
}
