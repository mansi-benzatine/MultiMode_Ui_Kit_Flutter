import 'package:flutter/material.dart';
import 'package:furniture_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:furniture_screens_app_package/localization/language/languages.dart';
import 'package:furniture_screens_app_package/utils/app_color.dart';
import 'package:furniture_screens_app_package/utils/sizer_utils.dart';
import 'package:furniture_screens_app_package/widgets/button/common_button.dart';
import 'package:furniture_screens_app_package/widgets/text/common_text.dart';
import 'package:furniture_screens_app_package/widgets/text_field/text_form_field.dart';
import 'package:furniture_screens_app_package/widgets/top_bar/topbar.dart';

import '../../../utils/constant.dart';

class EditAddressScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EditAddressScreen());
  }

  const EditAddressScreen({super.key});

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> implements TopBarClickListener {
  final TextEditingController homeNumberController = TextEditingController(text: "201");
  final TextEditingController addressNameController = TextEditingController(text: "Home");
  final TextEditingController streetNameController = TextEditingController(text: "Washington");
  final TextEditingController landmarkController = TextEditingController(text: "Washington");
  final TextEditingController cityController = TextEditingController(text: "Kentucky");
  final TextEditingController pinCodeController = TextEditingController(text: "39495");
  final TextEditingController stateController = TextEditingController(text: "United State America");

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
              title: Languages.of(context).txtEditAddress,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.setWidth),
                        child: CommonText(
                          text: Languages.of(context).txtAddressDetails,
                          textColor: CustomAppColor.of(context).txtGray,
                          fontSize: 18.setFontSize,
                          fontFamily: Constant.fontFamilyMedium500,
                        ),
                      ),
                      SizedBox(height: 12.setHeight),
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
              child: Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      text: Languages.of(context).txtDelete,
                      borderColor: CustomAppColor.of(context).red,
                      buttonTextColor: CustomAppColor.of(context).red,
                      buttonColor: CustomAppColor.of(context).transparent,
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                  SizedBox(width: 16.setWidth),
                  Expanded(
                    child: CommonButton(
                      text: Languages.of(context).txtUpdate,
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
