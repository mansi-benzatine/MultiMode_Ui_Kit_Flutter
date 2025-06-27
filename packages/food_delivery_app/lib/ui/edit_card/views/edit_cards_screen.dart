import 'package:flutter/material.dart';
import 'package:food_delivery_app_package/interfaces/top_bar_click_listener.dart';
import 'package:food_delivery_app_package/localization/language/languages.dart';
import 'package:food_delivery_app_package/utils/app_color.dart';
import 'package:food_delivery_app_package/utils/constant.dart';
import 'package:food_delivery_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_app_package/widgets/button/common_button.dart';
import 'package:food_delivery_app_package/widgets/text_field/text_form_field.dart';
import 'package:food_delivery_app_package/widgets/top_bar/topbar.dart';

class EditCardScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EditCardScreen());
  }

  const EditCardScreen({super.key});

  @override
  State<EditCardScreen> createState() => _EditCardScreenState();
}

class _EditCardScreenState extends State<EditCardScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    final TextEditingController cardNumberController = TextEditingController(text: "1234 5678 9012 3456");
    final TextEditingController expDateController = TextEditingController(text: "05/28");
    final TextEditingController cvvController = TextEditingController(text: "123");
    final TextEditingController cardHolderNameController = TextEditingController(text: "Bryaden");
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            TopBar(this, title: Languages.of(context).txtEditCart),
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
                child: Column(
                  children: [
                    CommonTextFormField(
                      titleText: Languages.of(context).txtCardHolderName,
                      controller: cardHolderNameController,
                      hintText: Languages.of(context).txtEnterCardHolderName,
                    ),
                    SizedBox(height: 20.setHeight),
                    CommonTextFormField(
                      titleText: Languages.of(context).txtCardNumber,
                      controller: cardNumberController,
                      hintText: Languages.of(context).txtEnterCardNumber,
                    ),
                    SizedBox(height: 20.setHeight),
                    Row(
                      children: [
                        Expanded(
                          child: CommonTextFormField(
                            titleText: Languages.of(context).txtExpDate,
                            controller: expDateController,
                            hintText: Languages.of(context).txtMonthYear,
                          ),
                        ),
                        SizedBox(width: 20.setWidth),
                        Expanded(
                          child: CommonTextFormField(
                            titleText: Languages.of(context).txtCVV,
                            controller: cvvController,
                            hintText: "123",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
              child: Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      text: Languages.of(context).txtDelete.toUpperCase(),
                      onTap: () => Navigator.pop(context),
                      borderColor: CustomAppColor.of(context).primary,
                      buttonTextColor: CustomAppColor.of(context).primary,
                      buttonColor: CustomAppColor.of(context).transparent,
                    ),
                  ),
                  SizedBox(width: 12.setWidth),
                  Expanded(
                    child: CommonButton(
                      text: Languages.of(context).txtUpdate.toUpperCase(),
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                ],
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
