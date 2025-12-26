import 'package:bitx_screens_app/localization/language/languages.dart';
import 'package:bitx_screens_app/utils/app_color.dart';
import 'package:bitx_screens_app/utils/sizer_utils.dart';
import 'package:bitx_screens_app/widgets/button/common_button.dart';
import 'package:bitx_screens_app/widgets/top_bar/topbar.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

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
  final TextEditingController emailController = TextEditingController(text: "andrew15@yourdomain.com");
  final TextEditingController nameController = TextEditingController(text: "Andrew Oliver");
  final TextEditingController phoneNumberController = TextEditingController(text: "+204 87452 95091");
  final TextEditingController birthdayController = TextEditingController(text: "15/03/1995");
  final TextEditingController locationController = TextEditingController(text: "201 Washington Ave, Kentucky 39495");

  String dropdownValue = 'Male';

  var items = ['Male', 'Female', 'Other'];

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
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
                child: Column(
                  children: [
                    CommonTextFormField(
                      controller: nameController,
                      hintText: Languages.of(context).txtEnterYourName,
                      prefixIcon: AppAssets.icBottomProfile,
                    ),
                    SizedBox(height: 20.setHeight),
                    CommonTextFormField(
                      controller: emailController,
                      hintText: Languages.of(context).txtEnterYourEmail,
                      prefixIcon: AppAssets.icEmail,
                    ),
                    SizedBox(height: 20.setHeight),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: CustomAppColor.of(context).borderTextFormFeild, width: 0.5),
                        borderRadius: BorderRadius.circular(1000.setWidth),
                        gradient: CustomAppColor.of(context).linearGradiant,
                      ),
                      padding: EdgeInsets.only(right: 20.setWidth),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CountryCodePicker(
                            initialSelection: 'US',
                            showCountryOnly: true,
                            showOnlyCountryWhenClosed: true,
                            showFlag: true,
                            backgroundColor: CustomAppColor.of(context).bgScreen,
                            showFlagDialog: true,
                            showFlagMain: true,
                            flagWidth: 25.setWidth,
                            showDropDownButton: false,
                            dialogBackgroundColor: CustomAppColor.of(context).bgScreen,
                            /*  builder: (country) {
                                      return CommonTextFormField(
                                        controller: TextEditingController(text: country?.flagUri),
                                        hintText: Languages.of(context).txtCountryCode,
                                        labelText: Languages.of(context).txtCountryCode.toUpperCase(),
                                        readOnly: true,
                                      );
                                    }, */
                            hideMainText: false,
                            hideSearch: false,
                            hideCloseIcon: false,
                          ),
                          Transform.rotate(
                            angle: 3.14159 + 1.5708,
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 15.setHeight,
                              color: CustomAppColor.of(context).txtBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.setHeight),
                    CommonTextFormField(
                      controller: phoneNumberController,
                      hintText: Languages.of(context).txtEnterPhoneNumber,
                      prefixIcon: AppAssets.icPhone,
                    ),
                    SizedBox(height: 20.setHeight),
                    Container(
                      decoration: BoxDecoration(
                        gradient: CustomAppColor.of(context).linearGradiant,
                        border: Border.all(color: CustomAppColor.of(context).borderTextFormFeild, width: 0.5),
                        borderRadius: BorderRadius.circular(1000.setWidth),
                      ),
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: dropdownValue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: CommonText(
                                text: items,
                                textColor: CustomAppColor.of(context).txtBlack,
                                fontWeight: FontWeight.w600,
                              ),
                            );
                          }).toList(),
                          isExpanded: true,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20.setHeight),
                    CommonTextFormField(
                      controller: birthdayController,
                      hintText: Languages.of(context).txtEnterYourBirthDate,
                      prefixIcon: AppAssets.icSmallCalendar,
                    ),
                    SizedBox(height: 20.setHeight),
                    CommonTextFormField(
                      controller: locationController,
                      hintText: Languages.of(context).txtEnterYourLocation,
                      prefixIcon: AppAssets.icSmallLocation,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
              child: IgnorePointer(
                ignoring: true,
                child: CommonButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  text: Languages.of(context).txtUpdate,
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
