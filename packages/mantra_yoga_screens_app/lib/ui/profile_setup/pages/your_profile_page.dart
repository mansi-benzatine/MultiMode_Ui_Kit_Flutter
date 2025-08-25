import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:mantra_yoga_screens_app_package/utils/debug.dart';
import 'package:mantra_yoga_screens_app_package/utils/sizer_utils.dart';
import 'package:mantra_yoga_screens_app_package/widgets/text_field/text_form_field.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';

class YourProfilePage extends StatefulWidget {
  const YourProfilePage({super.key});

  @override
  State<YourProfilePage> createState() => _YourProfilePageState();
}

class _YourProfilePageState extends State<YourProfilePage> {
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
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 20.setWidth,
        right: 20.setWidth,
        top: 25.setHeight,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        children: [
          SizedBox(height: 15.setHeight),
          Stack(
            children: [
              Container(
                width: 120.setWidth,
                height: 120.setHeight,
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).bgScreen,
                  shape: BoxShape.circle,
                  border: Border.all(color: CustomAppColor.of(context).borderColor),
                ),
                child: Icon(
                  Icons.person_rounded,
                  size: 80.setHeight,
                  color: CustomAppColor.of(context).txtBlack,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  AppAssets.icEdit,
                  width: 28.setHeight,
                  height: 28.setHeight,
                ),
              ),
            ],
          ),
          SizedBox(height: 35.setHeight),
          CommonTextFormFieldWithPrefix(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtName,
            prefixIcon: AppAssets.icUsername,
            keyboardType: TextInputType.name,
          ),
          SizedBox(height: 15.setHeight),
          CommonTextFormFieldWithPrefix(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtPhone,
            prefixIcon: AppAssets.icCall,
            keyboardType: TextInputType.phone,
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
                  controller: TextEditingController(),
                  hintText: Languages.of(context).txtDOB,
                  prefixIcon: AppAssets.icCalender,
                  keyboardType: TextInputType.datetime,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.setHeight),
          CommonTextFormFieldWithPrefix(
            controller: TextEditingController(),
            hintText: Languages.of(context).txtLocation,
            prefixIcon: AppAssets.icLocation,
            keyboardType: TextInputType.streetAddress,
          ),
        ],
      ),
    );
  }
}
