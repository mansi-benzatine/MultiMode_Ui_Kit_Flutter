import 'package:flutter/material.dart';
import 'package:taxi_booking_rider_app_package/interfaces/top_bar_click_listener.dart';
import 'package:taxi_booking_rider_app_package/utils/constant.dart';
import 'package:taxi_booking_rider_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../../widgets/top_bar/topbar.dart';

class AddVoucherScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const AddVoucherScreen());
  }

  const AddVoucherScreen({super.key});

  @override
  State<AddVoucherScreen> createState() => _AddVoucherScreenState();
}

class _AddVoucherScreenState extends State<AddVoucherScreen>
    implements TopBarClickListener {
  final voucherCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            TopBar(this, title: Languages.of(context).txtAddVoucherCode),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 22.setWidth, vertical: 4.setHeight),
                child: Column(
                  children: [
                    CommonTextFormField(
                      controller: voucherCodeController,
                      hintText: Languages.of(context).txtEnterAVoucherCode,
                      titleText: Languages.of(context).txtVoucherCode,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 22.setWidth, vertical: 20.setHeight),
              child: CommonButton(
                text: Languages.of(context).txtAdd,
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
