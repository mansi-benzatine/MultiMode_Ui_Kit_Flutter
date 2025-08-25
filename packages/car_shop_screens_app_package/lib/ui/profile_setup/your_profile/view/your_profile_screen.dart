import 'package:car_shop_screens_app_package/utils/sizer_utils.dart';
import 'package:car_shop_screens_app_package/widgets/text_field/text_form_field.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../../../interfaces/top_bar_click_listener.dart';
import '../../../../localization/language/languages.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/constant.dart';
import '../../../../widgets/button/common_button.dart';
import '../../../../widgets/top_bar/topbar.dart';
import '../../create_new_pin/view/create_new_pin_screen.dart';

class YourProfileScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const YourProfileScreen());
  }

  const YourProfileScreen({super.key});

  @override
  State<YourProfileScreen> createState() => _YourProfileScreenState();
}

class _YourProfileScreenState extends State<YourProfileScreen> implements TopBarClickListener {
  final TextEditingController _nameController = TextEditingController(text: "Mona Lisa");
  final TextEditingController _emailController = TextEditingController(text: "monalisa@yourdomain.com");
  final TextEditingController _phoneController = TextEditingController(text: "+1 12345 67890");
  final TextEditingController _addressController = TextEditingController(text: "1 E 2nd St, New York, NY 10003, USA");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(this, title: Languages.of(context).txtYourProfile, isShowBack: true),
            SizedBox(height: 20.setHeight),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                child: Column(
                  children: [
                    SizedBox(height: 20.setHeight),
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100.setWidth),
                          child: Image.asset(
                            AppAssets.imgDummyGirl,
                            height: 130.setHeight,
                            width: 130.setWidth,
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: Container(
                            height: 25.setHeight,
                            width: 25.setWidth,
                            decoration: BoxDecoration(
                              border: Border.all(color: CustomAppColor.of(context).txtWhite, width: 1.5.setWidth),
                              borderRadius: BorderRadius.circular(5.setWidth),
                              gradient: CustomAppColor.of(context).primaryGradient,
                            ),
                            padding: EdgeInsets.all(3.setWidth),
                            child: Image.asset(
                              AppAssets.icProfileEdit,
                              height: 16.setHeight,
                              width: 16.setWidth,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 80.setHeight),
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
                                initialSelection: 'US',
                                showCountryOnly: true,
                                showOnlyCountryWhenClosed: true,
                                showFlag: true,
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
                    SizedBox(height: 80.setHeight),
                    IgnorePointer(
                      ignoring: true,
                      child: Row(
                        children: [
                          Expanded(
                            child: CommonButton(
                              text: Languages.of(context).txtSkip,
                              buttonTextColor: CustomAppColor.of(context).primary,
                              borderColor: CustomAppColor.of(context).primary,
                              buttonGradient: LinearGradient(colors: [
                                CustomAppColor.of(context).transparent,
                                CustomAppColor.of(context).transparent,
                              ]),
                              onTap: () {},
                            ),
                          ),
                          SizedBox(width: 10.setWidth),
                          Expanded(
                              child: CommonButton(
                            text: Languages.of(context).txtContinue,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CreateNewPinScreen(),
                                ),
                              );
                            },
                          )),
                        ],
                      ),
                    )
                  ],
                ),
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
