import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:stoxy_app_package/localization/language/languages.dart';
import 'package:stoxy_app_package/utils/app_color.dart';
import 'package:stoxy_app_package/utils/sizer_utils.dart';
import 'package:stoxy_app_package/widgets/button/common_button.dart';
import 'package:stoxy_app_package/widgets/top_bar/topbar.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/constant.dart';
import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
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

  String dropdownvalue = 'Male';

  var items = ['Male', 'Female', 'Other'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Container(
        decoration: BoxDecoration(
          image: getIt.get<LocalStorageService>().getBool(LocalStorageService.isLightTheme, optionalValue: true)
              ? null
              : DecorationImage(
                  image: AssetImage(AppAssets.imgCommonBackground),
                  fit: BoxFit.fill,
                ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              TopBar(
                this,
                title: Languages.of(context).txtEditProfile,
                isShowBack: true,
              ),
              Expanded(
                child: ExcludeFocus(
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
                                    fontSize: 14.setFontSize,
                                    fontWeight: FontWeight.w600,
                                    textColor: CustomAppColor.of(context).txtBlack,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: CustomAppColor.of(context).textFieldFillColor,
                                    border: Border.all(color: CustomAppColor.of(context).borderTextFormFeild, width: 0.5),
                                    borderRadius: BorderRadius.circular(1000.setWidth),
                                  ),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(left: 10.setWidth, right: 15.setWidth, top: 0.setHeight, bottom: 0.setHeight),
                                  child: Row(
                                    children: [
                                      CountryCodePicker(
                                        initialSelection: 'IN',
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
                                    text: Languages.of(context).txtGender,
                                    fontSize: 14.setFontSize,
                                    fontWeight: FontWeight.w600,
                                    textColor: CustomAppColor.of(context).txtBlack,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: CustomAppColor.of(context).textFieldFillColor,
                                    border: Border.all(color: CustomAppColor.of(context).borderTextFormFeild, width: 0.5),
                                    borderRadius: BorderRadius.circular(1000.setWidth),
                                  ),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(left: 15.setWidth, right: 15.setWidth, top: 0.setHeight, bottom: 0.setHeight),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      value: dropdownvalue,
                                      icon: const Icon(Icons.keyboard_arrow_down),
                                      items: items.map((String items) {
                                        return DropdownMenuItem(
                                            value: items,
                                            child: CommonText(
                                              text: items,
                                              textColor: CustomAppColor.of(context).txtBlack,
                                              fontWeight: FontWeight.w600,
                                            ));
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownvalue = newValue!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 10.setWidth),
                            Expanded(
                              child: CommonTextFormField(
                                controller: birthdayController,
                                hintText: Languages.of(context).txtEnterYourBirthDate,
                                titleText: Languages.of(context).txtBirthDate,
                                prefixIcon: AppAssets.icSmallCalendar,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.setHeight),
                        CommonTextFormField(
                          controller: locationController,
                          hintText: Languages.of(context).txtEnterYourLocation,
                          titleText: Languages.of(context).txtLocation,
                          prefixIcon: AppAssets.icSmallLocation,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
                child: CommonButton(gradient: CustomAppColor.of(context).primaryGradient, onTap: () => Navigator.pop(context), text: Languages.of(context).txtUpdate),
              )
            ],
          ),
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
