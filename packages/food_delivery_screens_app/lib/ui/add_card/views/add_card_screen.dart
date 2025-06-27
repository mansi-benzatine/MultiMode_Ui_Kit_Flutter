import 'package:flutter/material.dart';
import 'package:food_delivery_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:food_delivery_screens_app_package/localization/language/languages.dart';
import 'package:food_delivery_screens_app_package/utils/app_color.dart';
import 'package:food_delivery_screens_app_package/utils/constant.dart';
import 'package:food_delivery_screens_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_screens_app_package/widgets/button/common_button.dart';
import 'package:food_delivery_screens_app_package/widgets/text_field/text_form_field.dart';
import 'package:food_delivery_screens_app_package/widgets/top_bar/topbar.dart';

class AddCardScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const AddCardScreen());
  }

  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    final TextEditingController cardNumberController = TextEditingController();
    final TextEditingController expDateController = TextEditingController();
    final TextEditingController cvvController = TextEditingController();
    final TextEditingController cardHolderNameController = TextEditingController();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            TopBar(this, title: Languages.of(context).txtAddNewCard),
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
              ),
            ),
            IgnorePointer(
              ignoring: true,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
                child: CommonButton(
                  text: Languages.of(context).txtAddCard.toUpperCase(),
                  onTap: () => Navigator.pop(context),
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
