import 'package:flutter/material.dart';
import 'package:taxi_booking_rider_app_package/interfaces/top_bar_click_listener.dart';
import 'package:taxi_booking_rider_app_package/localization/language/languages.dart';
import 'package:taxi_booking_rider_app_package/utils/app_color.dart';
import 'package:taxi_booking_rider_app_package/utils/constant.dart';
import 'package:taxi_booking_rider_app_package/utils/sizer_utils.dart';
import 'package:taxi_booking_rider_app_package/widgets/button/common_button.dart';
import 'package:taxi_booking_rider_app_package/widgets/top_bar/topbar.dart';

import '../../../widgets/text_field/text_form_field.dart';

class AddCardScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const AddCardScreen());
  }

  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen>
    implements TopBarClickListener {
  final cardNumberController = TextEditingController();
  final cardHolderNameController = TextEditingController();
  final expiryController = TextEditingController();
  final cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            TopBar(this, title: Languages.of(context).txtAddCard),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 22.setWidth, vertical: 10.setHeight),
                  child: Column(
                    children: [
                      CommonTextFormField(
                        controller: cardNumberController,
                        hintText: Languages.of(context).txtEnterAHolderCardName,
                        titleText: Languages.of(context).txtCardHolderNumber,
                      ),
                      SizedBox(height: 16.setHeight),
                      CommonTextFormField(
                        controller: cardHolderNameController,
                        hintText: Languages.of(context).txtEnterACardNumber,
                        titleText: Languages.of(context).txtCardNumber,
                      ),
                      SizedBox(height: 16.setHeight),
                      Row(
                        children: [
                          Expanded(
                            child: CommonTextFormField(
                              controller: expiryController,
                              hintText: "MM/YY",
                              titleText: Languages.of(context).txtExpDate,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: CommonTextFormField(
                              controller: cvvController,
                              hintText: "***",
                              titleText: Languages.of(context).txtCvv,
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
              padding: EdgeInsets.symmetric(
                  horizontal: 22.setWidth, vertical: 20.setHeight),
              child: CommonButton(
                text: Languages.of(context).txtAddCard,
                onTap: () => Navigator.pop(context),
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
