import 'package:flutter/material.dart';
import 'package:furniture_app_package/interfaces/top_bar_click_listener.dart';
import 'package:furniture_app_package/localization/language/languages.dart';
import 'package:furniture_app_package/utils/app_color.dart';
import 'package:furniture_app_package/utils/sizer_utils.dart';
import 'package:furniture_app_package/widgets/button/common_button.dart';
import 'package:furniture_app_package/widgets/text_field/text_form_field.dart';
import 'package:furniture_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/constant.dart';

class AddNewAddressScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const AddNewAddressScreen());
  }

  const AddNewAddressScreen({super.key});

  @override
  State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> implements TopBarClickListener {
  final TextEditingController homeNumberController = TextEditingController(text: "");
  final TextEditingController addressNameController = TextEditingController(text: "");
  final TextEditingController streetNameController = TextEditingController(text: "");
  final TextEditingController landmarkController = TextEditingController(text: "");
  final TextEditingController cityController = TextEditingController(text: "");
  final TextEditingController pinCodeController = TextEditingController(text: "");
  final TextEditingController stateController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              isShowBack: true,
              title: Languages.of(context).txtAddNewAddress,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
                  child: Column(
                    children: [
                      CommonTextFormField(
                        controller: addressNameController,
                        hintText: Languages.of(context).txtEnterAddressName,
                        radius: 10,
                        titleText: "",
                        fillColor: CustomAppColor.of(context).primary,
                        hintTextColor: CustomAppColor.of(context).white,
                      ),
                      SizedBox(height: 20.setHeight),
                      CommonTextFormField(
                        controller: homeNumberController,
                        hintText: Languages.of(context).txtEnterYourHomeNumber,
                        titleText: Languages.of(context).txtHomeNumber,
                      ),
                      SizedBox(height: 20.setHeight),
                      CommonTextFormField(
                        controller: streetNameController,
                        hintText: Languages.of(context).txtEnterYourStreetName,
                        titleText: Languages.of(context).txtStreetName,
                      ),
                      SizedBox(height: 20.setHeight),
                      CommonTextFormField(
                        controller: landmarkController,
                        hintText: Languages.of(context).txtEnterYourLandmark,
                        titleText: Languages.of(context).txtLandmark,
                      ),
                      SizedBox(height: 20.setHeight),
                      CommonTextFormField(
                        controller: cityController,
                        hintText: Languages.of(context).txtEnterYourCity,
                        titleText: Languages.of(context).txtCity,
                      ),
                      SizedBox(height: 20.setHeight),
                      CommonTextFormField(
                        controller: pinCodeController,
                        hintText: Languages.of(context).txtEnterYourPINCode,
                        titleText: Languages.of(context).txtPinCode,
                      ),
                      SizedBox(height: 20.setHeight),
                      CommonTextFormField(
                        controller: stateController,
                        hintText: Languages.of(context).txtEnterYourState,
                        titleText: Languages.of(context).txtState,
                      ),
                      SizedBox(height: 20.setHeight),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 20.setHeight),
              child: CommonButton(
                text: Languages.of(context).txtAdd,
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
