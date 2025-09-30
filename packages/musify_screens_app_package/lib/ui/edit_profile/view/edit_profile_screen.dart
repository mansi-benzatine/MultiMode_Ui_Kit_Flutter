import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:musify_screens_app_package/localization/language/languages.dart';
import 'package:musify_screens_app_package/utils/app_color.dart';
import 'package:musify_screens_app_package/utils/sizer_utils.dart';
import 'package:musify_screens_app_package/widgets/top_bar/topbar.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text_field/text_form_field.dart';

class EditProfileScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EditProfileScreen());
  }

  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> implements TopBarClickListener {
  final TextEditingController emailController = TextEditingController(text: "stilva@yourdomain.com");
  final TextEditingController nameController = TextEditingController(text: "Stilva Larsen");
  final TextEditingController phoneNumberController = TextEditingController(text: "12345 67890");

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
          ExcludeFocus(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
              child: Column(
                children: [
                  CommonTextFormField(
                    controller: emailController,
                    hintText: Languages.of(context).txtEnterYourEmail,
                    prefixIcon: AppAssets.icEmail,
                    titleText: Languages.of(context).txtEmail,
                  ),
                  SizedBox(height: 20.setHeight),
                  CommonTextFormField(
                    controller: nameController,
                    hintText: Languages.of(context).txtEnterYourName,
                    prefixIcon: AppAssets.icUserName,
                    titleText: Languages.of(context).txtName,
                  ),
                  SizedBox(height: 20.setHeight),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 5.setHeight,
                              left: 5.setWidth,
                            ),
                            child: CommonText(
                              text: Languages.of(context).txtCountry,
                              fontSize: 16.setFontSize,
                              fontWeight: FontWeight.w400,
                              textColor: CustomAppColor.of(context).txtBlack,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: CustomAppColor.of(context).borderTextFormFeild, width: 0.5),
                              borderRadius: BorderRadius.circular(1000.setWidth),
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 8.setWidth, right: 12.setWidth, top: 1.setHeight, bottom: 1.setHeight),
                            child: Row(
                              children: [
                                CountryCodePicker(
                                  initialSelection: 'US',
                                  showCountryOnly: true,
                                  showOnlyCountryWhenClosed: true,
                                  showFlag: true,
                                  showFlagDialog: true,
                                  showFlagMain: true,
                                  flagWidth: 30.setWidth,
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
                        ],
                      ),
                      SizedBox(width: 10.setWidth),
                      Expanded(
                        child: CommonTextFormField(
                          controller: phoneNumberController,
                          hintText: Languages.of(context).txtEnterPhoneNumber,
                          titleText: Languages.of(context).txtPhoneNumber,
                          prefixIcon: AppAssets.icPhone,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
