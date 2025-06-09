import 'package:chat_ai_app_package/utils/sizer_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../create_new_pin/view/create_new_pin_screen.dart';
import '../../dashboard/view/dashboard_screen.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const CreateProfileScreen());
  }

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.setHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.setHeight),
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Image.asset(
                      AppAssets.icBack,
                      width: 24.setHeight,
                      height: 24.setHeight,
                      gaplessPlayback: true,
                    ),
                  ),
                ),
                SizedBox(height: 25.setHeight),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.setHeight),
                  child: _YourProfileView(
                    nameController: _nameController,
                    emailController: _emailController,
                    birthdayController: _birthdateController,
                    genderController: _genderController,
                    phoneNumberController: _phoneNumberController,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _YourProfileView extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController birthdayController;
  final TextEditingController genderController;

  const _YourProfileView({
    required this.nameController,
    required this.emailController,
    required this.birthdayController,
    required this.genderController,
    required this.phoneNumberController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CommonText(
          text: Languages.of(context).txtYourProfile,
          fontWeight: FontWeight.w800,
          fontSize: 35.setFontSize,
          textColor: CustomAppColor.of(context).txtBlack,
          height: 1,
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 10.setHeight),
        CommonText(
          text: "figure out Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          fontWeight: FontWeight.w400,
          fontSize: 12.setFontSize,
          textColor: CustomAppColor.of(context).txtBlackAndGray,
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 25.setHeight),
        Center(
          child: SizedBox(
            height: 130.setHeight,
            width: 130.setWidth,
            child: Stack(
              children: [
                Image.asset(
                  AppAssets.imgDummyProfile,
                ),
                Positioned(
                    bottom: 10.setHeight,
                    right: 0.setWidth,
                    child: Image.asset(
                      AppAssets.icEdit,
                      height: 27.setHeight,
                      width: 27.setWidth,
                    ))
              ],
            ),
          ),
        ),
        CommonTextFormFieldWithPrefix(
          controller: nameController,
          titleText: Languages.of(context).txtName,
          hintText: Languages.of(context).txtEnterYourName,
          prefixIcon: AppAssets.icName,
          keyboardType: TextInputType.name,
        ),
        SizedBox(height: 20.setHeight),
        Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: "Country",
                    fontSize: 16.setFontSize,
                    fontWeight: FontWeight.w400,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                  SizedBox(height: 10.setHeight),
                  IntlPhoneField(
                    dropdownIconPosition: IconPosition.trailing,
                    dropdownIcon: const Icon(Icons.keyboard_arrow_down_outlined),
                    initialCountryCode: 'US',
                    disableLengthCheck: true,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: CustomAppColor.of(context).containerBorder,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: CustomAppColor.of(context).containerBorder,
                          width: 2,
                        ),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: CustomAppColor.of(context).containerBorder,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 25.setWidth),
            Expanded(
              flex: 2,
              child: CommonTextFormFieldWithPrefix(
                controller: TextEditingController(),
                titleText: Languages.of(context).txtPhone,
                hintText: Languages.of(context).txtEnterYourPhoneNumber,
                prefixIcon: AppAssets.icCall,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.setHeight),
        CommonTextFormFieldWithPrefix(
          controller: phoneNumberController,
          titleText: Languages.of(context).txtBirthDate,
          hintText: "Enter Your Birth Date",
          prefixIcon: AppAssets.icCalendar,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 20.setHeight),
        CommonTextFormFieldWithPrefix(
          controller: genderController,
          titleText: Languages.of(context).txtGender,
          hintText: Languages.of(context).txtSelectYourGender,
          prefixIcon: AppAssets.icGender,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 43.setHeight),
        Row(
          children: [
            Expanded(
              child: CommonButton(
                text: Languages.of(context).txtSkip,
                buttonTextColor: CustomAppColor.of(context).txtBlack,
                buttonColor: CustomAppColor.of(context).unSelectedTabColor,
                onTap: () {
                  Navigator.push(context, ChatAiDashboardScreen.route());
                },
              ),
            ),
            SizedBox(width: 20.setWidth),
            Expanded(
              child: CommonButton(
                text: Languages.of(context).txtContinue,
                onTap: () {
                  Navigator.push(context, CreateNewPinScreen.route());
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
