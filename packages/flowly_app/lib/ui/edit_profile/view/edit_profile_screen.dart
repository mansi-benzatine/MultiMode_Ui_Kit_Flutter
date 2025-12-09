import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flowly_app/interfaces/top_bar_click_listener.dart';
import 'package:flowly_app/localization/language/languages.dart';
import 'package:flowly_app/utils/app_assets.dart';
import 'package:flowly_app/utils/app_color.dart';
import 'package:flowly_app/utils/constant.dart';
import 'package:flowly_app/utils/sizer_utils.dart';
import 'package:flowly_app/widgets/text/common_text.dart';
import 'package:flowly_app/widgets/text_field/text_form_field.dart';
import 'package:flowly_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../../widgets/button/common_button.dart';

class EditProfileScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EditProfileScreen());
  }

  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> implements TopBarClickListener {
  final TextEditingController nameController = TextEditingController(text: "Elvina Jack");
  final TextEditingController ageController = TextEditingController(text: "24");
  final TextEditingController relationshipController = TextEditingController(text: "Mother");
  final TextEditingController doYouHaveChildren = TextEditingController(text: "No");
  List<String> relationshipList = [
    "Single",
    "Married",
    "In a relationship",
    "I'd rather not say",
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            isShowBack: true,
            title: Languages.of(context).txtPersonalInformation,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: _formFieldView(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, bottom: 50.setHeight),
            child: CommonButton(
              text: Languages.of(context).txtUpdate,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _formFieldView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Stack(
              children: [
                Image.asset(
                  AppAssets.imgDummyProfile,
                  height: 100.setHeight,
                  width: 100.setWidth,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: CustomAppColor.of(context).black,
                      border: Border.all(
                        color: CustomAppColor.of(context).white,
                      ),
                    ),
                    padding: const EdgeInsets.all(6),
                    child: Image.asset(
                      AppAssets.icEdit,
                      width: 12.setWidth,
                      height: 12.setHeight,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 24.setHeight),
          CommonTextFormField(
            titleText: Languages.of(context).txtName,
            fillColor: CustomAppColor.of(context).transparent,
            controller: nameController,
            hintText: Languages.of(context).txtEnterYourName,
          ),
          SizedBox(height: 24.setHeight),
          CommonTextFormFieldWithPrefix(
            prefixIcon: AppAssets.icEmail,
            titleText: Languages.of(context).txtEmail,
            fillColor: CustomAppColor.of(context).transparent,
            controller: ageController,
            hintText: Languages.of(context).txtEmail,
          ),
          SizedBox(height: 24.setHeight),
          CommonTextFormFieldWithPrefix(
            prefixIcon: AppAssets.icBirthday,
            titleText: Languages.of(context).txtBirthday,
            fillColor: CustomAppColor.of(context).transparent,
            controller: relationshipController,
            hintText: Languages.of(context).txtBirthday,
          ),
          SizedBox(height: 24.setHeight),
          CommonText(
            text: Languages.of(context).txtRelationshipStatus,
            fontFamily: Constant.fontFamilyMulishSemiBold600,
          ),
          SizedBox(height: 4.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: const Row(
                      children: [
                        Expanded(
                          child: CommonText(
                            text: 'Select Item',
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    items: relationshipList
                        .map(
                          (String item) => DropdownMenuItem<String>(
                            value: item,
                            child: CommonText(
                              text: item,
                              fontSize: 14.setFontSize,
                              fontFamily: Constant.fontFamilyMulishSemiBold600,
                              textColor: CustomAppColor.of(context).txtBlack,
                            ),
                          ),
                        )
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                    buttonStyleData: ButtonStyleData(
                      height: 50,
                      width: 0.screenWidth,
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: CustomAppColor.of(context).border,
                        ),
                        color: CustomAppColor.of(context).transparent,
                      ),
                      elevation: 0,
                    ),
                    iconStyleData: IconStyleData(
                      icon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                      ),
                      iconSize: 24,
                      iconEnabledColor: CustomAppColor.of(context).icBlackWhite,
                      iconDisabledColor: CustomAppColor.of(context).icBlackWhite,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: CustomAppColor.of(context).bgScreen,
                      ),
                      offset: const Offset(0, -10),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: WidgetStateProperty.all(6),
                        thumbVisibility: WidgetStateProperty.all(true),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 25.setWidth),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.only(left: 50, right: 14),
                    ),
                  ),
                ),
              ),
            ],
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
