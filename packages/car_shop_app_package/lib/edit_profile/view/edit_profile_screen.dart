import 'package:car_shop_app_package/utils/sizer_utils.dart';
import 'package:car_shop_app_package/utils/utils.dart';
import 'package:car_shop_app_package/widgets/top_bar/topbar.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../interfaces/top_bar_click_listener.dart';
import '../../localization/language/languages.dart';
import '../../utils/app_color.dart';
import '../../utils/constant.dart';
import '../../widgets/button/common_button.dart';
import '../../widgets/text_field/text_form_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> implements TopBarClickListener {
  final TextEditingController _nameController = TextEditingController(text: "Mona Lisa");
  final TextEditingController _emailController = TextEditingController(text: "mona@gmail.com");
  final TextEditingController _phoneController = TextEditingController(text: "+1 12345 67890");
  final TextEditingController _addressController = TextEditingController(text: "123, Main St, Anytown, USA");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtEditProfile,
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                child: Column(
                  children: [
                    SizedBox(height: 20.setHeight),
                    CommonTextFormField(
                      controller: _nameController,
                      hintText: Languages.of(context).txtEnterYourName,
                      labelText: Languages.of(context).txtName.toUpperCase(),
                    ),
                    SizedBox(height: 20.setHeight),
                    CommonTextFormField(
                      controller: _emailController,
                      hintText: Languages.of(context).txtEnterYourEmail,
                      labelText: Languages.of(context).txtEmail.toUpperCase(),
                    ),
                    SizedBox(height: 20.setHeight),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: CustomAppColor.of(context).txtBlack, width: 1),
                            borderRadius: BorderRadius.circular(1000.setWidth),
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: 5.setWidth, right: 15.setWidth, top: 3.setHeight, bottom: 3.setHeight),
                          child: Row(
                            children: [
                              CountryCodePicker(
                                initialSelection: 'IN',
                                showCountryOnly: true,
                                showOnlyCountryWhenClosed: true,
                                showFlag: true,
                                barrierColor: CustomAppColor.of(context).black.withOpacityPercent(0.65),
                                backgroundColor: CustomAppColor.of(context).bgBottomSheet,
                                boxDecoration: BoxDecoration(
                                  color: CustomAppColor.of(context).bgBottomSheet,
                                ),
                                showFlagDialog: true,
                                showFlagMain: true,
                                flagWidth: 25.setWidth,
                                margin: EdgeInsets.zero,
                                showDropDownButton: false,
                                padding: EdgeInsets.zero,
                                /*  builder: (country) {
                                  return CommonTextFormField(
                                    controller: TextEditingController(text: country?.flagUri),
                                    hintText: Languages.of(context).txtCountryCode,
                                    labelText: Languages.of(context).txtCountryCode.toUpperCase(),
                                    readOnly: true,
                                  );
                                }, */
                                hideMainText: true,
                                hideSearch: true,
                                hideCloseIcon: true,
                              ),
                              Transform.rotate(
                                angle: 3.14159 + 1.5708, // 90 degrees in radians
                                child: Icon(Icons.arrow_back_ios_new_rounded, size: 15.setHeight, color: CustomAppColor.of(context).txtBlack),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10.setWidth),
                        Expanded(
                          child: CommonTextFormField(
                            controller: _phoneController,
                            hintText: Languages.of(context).txtEnterPhoneNumber,
                            labelText: Languages.of(context).txtPhoneNumber.toUpperCase(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.setHeight),
                    CommonTextFormField(
                      controller: _addressController,
                      hintText: Languages.of(context).txtEnterYourAddress,
                      labelText: Languages.of(context).txtAddress.toUpperCase(),
                    ),
                  ],
                ),
              ),
            ),
            CommonButton(
              text: Languages.of(context).txtUpdate,
              mLeft: 20.setWidth,
              mRight: 20.setWidth,
              mTop: 20.setHeight,
              mBottom: 20.setHeight,
              onTap: () {
                Navigator.pop(context);
              },
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
