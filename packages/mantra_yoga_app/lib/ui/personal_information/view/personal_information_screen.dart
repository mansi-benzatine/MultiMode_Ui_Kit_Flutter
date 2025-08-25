import 'package:country_picker/country_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:mantra_yoga_app_package/interfaces/top_bar_click_listener.dart';
import 'package:mantra_yoga_app_package/utils/app_assets.dart';
import 'package:mantra_yoga_app_package/utils/sizer_utils.dart';
import 'package:mantra_yoga_app_package/widgets/text_field/text_form_field.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/debug.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (context) => const PersonalInformationScreen());
  }

  @override
  State<PersonalInformationScreen> createState() => _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> implements TopBarClickListener {
  late final Country defaultCountry;
  late final ValueNotifier<String> selectedCountry;

  @override
  void initState() {
    super.initState();
    defaultCountry = CountryParser.parseCountryCode('US');
    selectedCountry = ValueNotifier(
      defaultCountry.flagEmoji,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtPersonalInformation,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 15.setWidth,
                right: 15.setWidth,
                top: 10.setHeight,
                bottom: MediaQuery.of(context).padding.bottom + 10.setHeight,
              ),
              child: Column(
                children: [
                  CommonTextFormFieldWithPrefix(
                    controller: TextEditingController(text: "Kenneth"),
                    hintText: Languages.of(context).txtName,
                    prefixIcon: AppAssets.icUsername,
                  ),
                  SizedBox(height: 15.setHeight),
                  CommonTextFormFieldWithPrefix(
                    controller: TextEditingController(text: "kenneth3011@yourdomain.com"),
                    hintText: Languages.of(context).txtEmail,
                    prefixIcon: AppAssets.icEmail,
                  ),
                  SizedBox(height: 15.setHeight),
                  CommonTextFormFieldWithPrefix(
                    controller: TextEditingController(text: "+1 76894 35087"),
                    hintText: Languages.of(context).txtPhone,
                    prefixIcon: AppAssets.icCall,
                  ),
                  SizedBox(height: 15.setHeight),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            useSafeArea: true,
                            countryListTheme: CountryListThemeData(
                              flagSize: 20,
                              backgroundColor: CustomAppColor.of(context).bgScreen,
                              textStyle: TextStyle(
                                fontSize: 16.setFontSize,
                                color: CustomAppColor.of(context).txtBlack,
                                fontFamily: Constant.fontFamilyRegular400,
                                fontWeight: FontWeight.w400,
                              ),
                              bottomSheetHeight: 0.screenHeight,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                              inputDecoration: InputDecoration(
                                hintText: Languages.of(context).txtSearch,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: CustomAppColor.of(context).borderColor),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: CustomAppColor.of(context).borderColor),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: CustomAppColor.of(context).borderColor),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: CustomAppColor.of(context).borderColor),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: CustomAppColor.of(context).borderColor),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: CustomAppColor.of(context).borderColor),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 14.setHeight),
                              ),
                            ),
                            onSelect: (Country country) {
                              Debug.printLog('Select country: ${country.flagEmoji}');
                              selectedCountry.value = country.flagEmoji;
                            },
                          );
                        },
                        child: Container(
                          width: 100.setWidth,
                          decoration: BoxDecoration(
                            color: CustomAppColor.of(context).bgScreen,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: CustomAppColor.of(context).borderColor),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 10.setHeight),
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(right: 10.setWidth),
                          child: Row(
                            children: [
                              ValueListenableBuilder(
                                valueListenable: selectedCountry,
                                builder: (context, value, child) {
                                  return CommonText(
                                    text: value,
                                    fontSize: 20.setFontSize,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: Constant.fontFamilyBold700,
                                  );
                                },
                              ),
                              const Spacer(),
                              Image.asset(
                                AppAssets.icArrowDown,
                                width: 20.setWidth,
                                height: 20.setHeight,
                                color: CustomAppColor.of(context).txtBlack,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: CommonTextFormFieldWithPrefix(
                          controller: TextEditingController(text: "30/11/1999"),
                          hintText: Languages.of(context).txtDOB,
                          prefixIcon: AppAssets.icCalender,
                          keyboardType: TextInputType.datetime,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.setHeight),
                  DropdownButtonFormField2<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15.setHeight),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: CustomAppColor.of(context).borderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: CustomAppColor.of(context).borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: CustomAppColor.of(context).borderColor),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: CustomAppColor.of(context).borderColor),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: CustomAppColor.of(context).borderColor),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: CustomAppColor.of(context).borderColor),
                      ),
                    ),
                    hint: CommonText(
                      text: Languages.of(context).txtGender,
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w400,
                      fontFamily: Constant.fontFamilyRegular400,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                    items: ['Male', 'Female', 'Other']
                        .map(
                          (item) => DropdownMenuItem<String>(
                            value: item,
                            child: CommonText(
                              text: item,
                              fontSize: 14.setFontSize,
                              fontWeight: FontWeight.w400,
                              fontFamily: Constant.fontFamilyRegular400,
                              textColor: CustomAppColor.of(context).txtBlack,
                            ),
                          ),
                        )
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select gender.';
                      }
                      return null;
                    },
                    onChanged: (value) {},
                    onSaved: (value) {
                      // selectedValue = value.toString();
                    },
                    buttonStyleData: ButtonStyleData(padding: EdgeInsets.only(right: 15.setWidth)),
                    iconStyleData: IconStyleData(
                      icon: Image.asset(
                        AppAssets.icArrowDown,
                        width: 20.setWidth,
                        height: 20.setHeight,
                        color: CustomAppColor.of(context).txtBlack,
                      ),
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: CustomAppColor.of(context).bgScreen,
                      ),
                    ),
                    menuItemStyleData: MenuItemStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
                    ),
                    value: "Male",
                  ),
                  SizedBox(height: 15.setHeight),
                  CommonTextFormFieldWithPrefix(
                    controller: TextEditingController(text: "268, Sunflower Park,Pc 457003"),
                    hintText: Languages.of(context).txtLocation,
                    prefixIcon: AppAssets.icLocation,
                    keyboardType: TextInputType.streetAddress,
                  ),
                  SizedBox(height: 15.setHeight),
                  DropdownButtonFormField2<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15.setHeight),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: CustomAppColor.of(context).borderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: CustomAppColor.of(context).borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: CustomAppColor.of(context).borderColor),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: CustomAppColor.of(context).borderColor),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: CustomAppColor.of(context).borderColor),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: CustomAppColor.of(context).borderColor),
                      ),
                    ),
                    hint: CommonText(
                      text: Languages.of(context).txtYourAge,
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w400,
                      fontFamily: Constant.fontFamilyRegular400,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                    items: [
                      '18 years',
                      '20 years',
                      '22 years',
                      '24 years',
                      '26 years',
                      '28 years',
                      '30 years',
                      '32 years',
                      '34 years',
                      '36 years',
                      '38 years',
                      '40 years',
                      '42 years',
                      '44 years',
                      '46 years',
                      '48 years',
                      '50 years',
                      '52 years',
                      '54 years',
                      '56 years',
                      '58 years',
                      '60 years',
                      '62 years',
                      '64 years',
                      '66 years',
                      '68 years',
                      '70 years',
                      '72 years',
                      '74 years',
                      '76 years',
                      '78 years',
                      '80 years',
                      '82 years',
                      '84 years',
                      '86 years',
                      '88 years',
                      '90 years',
                      '92 years',
                      '94 years',
                      '96 years',
                      '98 years',
                      '100 years',
                    ]
                        .map(
                          (item) => DropdownMenuItem<String>(
                            value: item,
                            child: CommonText(
                              text: item,
                              fontSize: 14.setFontSize,
                              fontWeight: FontWeight.w400,
                              fontFamily: Constant.fontFamilyRegular400,
                              textColor: CustomAppColor.of(context).txtBlack,
                            ),
                          ),
                        )
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select age.';
                      }
                      return null;
                    },
                    onChanged: (value) {},
                    onSaved: (value) {
                      // selectedValue = value.toString();
                    },
                    buttonStyleData: ButtonStyleData(padding: EdgeInsets.only(right: 15.setWidth)),
                    iconStyleData: IconStyleData(
                      icon: Image.asset(
                        AppAssets.icArrowDown,
                        width: 20.setWidth,
                        height: 20.setHeight,
                        color: CustomAppColor.of(context).txtBlack,
                      ),
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: CustomAppColor.of(context).bgScreen,
                      ),
                    ),
                    menuItemStyleData: MenuItemStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
                    ),
                    value: "26 years",
                  ),
                  SizedBox(height: 15.setHeight),
                  DropdownButtonFormField2<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15.setHeight),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: CustomAppColor.of(context).borderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: CustomAppColor.of(context).borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: CustomAppColor.of(context).borderColor),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: CustomAppColor.of(context).borderColor),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: CustomAppColor.of(context).borderColor),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: CustomAppColor.of(context).borderColor),
                      ),
                    ),
                    hint: CommonText(
                      text: Languages.of(context).txtYourWeight,
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w400,
                      fontFamily: Constant.fontFamilyRegular400,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                    items: [
                      '18 kg',
                      '20 kg',
                      '22 kg',
                      '24 kg',
                      '26 kg',
                      '28 kg',
                      '30 kg',
                      '32 kg',
                      '34 kg',
                      '36 kg',
                      '38 kg',
                      '40 kg',
                      '42 kg',
                      '44 kg',
                      '46 kg',
                      '48 kg',
                      '50 kg',
                      '52 kg',
                      '54 kg',
                      '56 kg',
                      '58 kg',
                      '60 kg',
                      '62 kg',
                      '64 kg',
                      '66 kg',
                      '68 kg',
                      '70 kg',
                      '72 kg',
                      '74 kg',
                      '76 kg',
                      '78 kg',
                      '80 kg',
                      '82 kg',
                      '84 kg',
                      '86 kg',
                      '88 kg',
                      '90 kg',
                      '92 kg',
                      '94 kg',
                      '96 kg',
                      '98 kg',
                      '100 kg'
                    ]
                        .map(
                          (item) => DropdownMenuItem<String>(
                            value: item,
                            child: CommonText(
                              text: item,
                              fontSize: 14.setFontSize,
                              fontWeight: FontWeight.w400,
                              fontFamily: Constant.fontFamilyRegular400,
                              textColor: CustomAppColor.of(context).txtBlack,
                            ),
                          ),
                        )
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select weight.';
                      }
                      return null;
                    },
                    onChanged: (value) {},
                    onSaved: (value) {
                      // selectedValue = value.toString();
                    },
                    buttonStyleData: ButtonStyleData(padding: EdgeInsets.only(right: 15.setWidth)),
                    iconStyleData: IconStyleData(
                      icon: Image.asset(
                        AppAssets.icArrowDown,
                        width: 20.setWidth,
                        height: 20.setHeight,
                        color: CustomAppColor.of(context).txtBlack,
                      ),
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: CustomAppColor.of(context).bgScreen,
                      ),
                    ),
                    menuItemStyleData: MenuItemStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
                    ),
                    value: "72 kg",
                  ),
                  SizedBox(height: 15.setHeight),
                  DropdownButtonFormField2<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15.setHeight),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: CustomAppColor.of(context).borderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: CustomAppColor.of(context).borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: CustomAppColor.of(context).borderColor),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: CustomAppColor.of(context).borderColor),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: CustomAppColor.of(context).borderColor),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(color: CustomAppColor.of(context).borderColor),
                      ),
                    ),
                    hint: CommonText(
                      text: Languages.of(context).txtYourHeight,
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w400,
                      fontFamily: Constant.fontFamilyRegular400,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                    items: [
                      '112 cm',
                      '114 cm',
                      '116 cm',
                      '118 cm',
                      '120 cm',
                      '122 cm',
                      '124 cm',
                      '126 cm',
                      '128 cm',
                      '130 cm',
                      '132 cm',
                      '134 cm',
                      '136 cm',
                      '138 cm',
                      '140 cm',
                      '142 cm',
                      '144 cm',
                      '146 cm',
                      '148 cm',
                      '150 cm',
                      '152 cm',
                      '154 cm',
                      '156 cm',
                      '158 cm',
                      '160 cm',
                      '162 cm',
                      '164 cm',
                      '166 cm',
                      '168 cm',
                      '170 cm',
                      '172 cm',
                      '174 cm',
                      '176 cm',
                      '178 cm',
                      '180 cm',
                      '182 cm',
                      '184 cm',
                      '186 cm',
                      '188 cm',
                      '190 cm',
                      '192 cm',
                      '194 cm',
                      '196 cm',
                      '198 cm',
                      '200 cm',
                      '202 cm',
                      '204 cm',
                      '206 cm',
                      '208 cm',
                      '210 cm',
                      '212 cm',
                      '214 cm',
                      '216 cm',
                      '218 cm',
                      '220 cm',
                      '222 cm',
                      '224 cm',
                      '226 cm',
                      '228 cm',
                      '230 cm',
                      '232 cm',
                      '234 cm',
                      '236 cm',
                      '238 cm',
                      '240 cm',
                      '242 cm',
                      '244 cm',
                      '246 cm',
                      '248 cm',
                      '250 cm',
                      '252 cm',
                      '254 cm',
                      '256 cm',
                      '258 cm',
                      '260 cm',
                      '262 cm',
                      '264 cm',
                      '266 cm',
                      '268 cm',
                      '270 cm',
                      '272 cm',
                      '274 cm',
                      '276 cm',
                      '278 cm',
                      '280 cm',
                      '282 cm',
                      '284 cm',
                      '286 cm',
                      '288 cm',
                      '290 cm',
                      '292 cm',
                      '294 cm',
                      '296 cm',
                      '298 cm',
                      '300 cm',
                      '302 cm',
                      '304 cm',
                      '306 cm',
                      '308 cm',
                      '310 cm',
                    ]
                        .map(
                          (item) => DropdownMenuItem<String>(
                            value: item,
                            child: CommonText(
                              text: item,
                              fontSize: 14.setFontSize,
                              fontWeight: FontWeight.w400,
                              fontFamily: Constant.fontFamilyRegular400,
                              textColor: CustomAppColor.of(context).txtBlack,
                            ),
                          ),
                        )
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select weight.';
                      }
                      return null;
                    },
                    onChanged: (value) {},
                    onSaved: (value) {
                      // selectedValue = value.toString();
                    },
                    buttonStyleData: ButtonStyleData(padding: EdgeInsets.only(right: 15.setWidth)),
                    iconStyleData: IconStyleData(
                      icon: Image.asset(
                        AppAssets.icArrowDown,
                        width: 20.setWidth,
                        height: 20.setHeight,
                        color: CustomAppColor.of(context).txtBlack,
                      ),
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: CustomAppColor.of(context).bgScreen,
                      ),
                    ),
                    menuItemStyleData: MenuItemStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
                    ),
                    value: '162 cm',
                  ),
                ],
              ),
            ),
          ),
          CommonButton(
            text: Languages.of(context).txtUpdate,
            onTap: () {},
            borderColor: CustomAppColor.of(context).borderColor,
            borderWidth: 3,
            buttonColor: CustomAppColor.of(context).primary,
            mBottom: MediaQuery.of(context).padding.bottom + 10.setHeight,
            mLeft: 25.setWidth,
            mRight: 25.setWidth,
            radius: 18,
          ),
        ],
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
