import 'package:chat_ai_app_package/interfaces/top_bar_click_listener.dart';
import 'package:chat_ai_app_package/localization/language/languages.dart';
import 'package:chat_ai_app_package/utils/app_color.dart';
import 'package:chat_ai_app_package/utils/constant.dart';
import 'package:chat_ai_app_package/utils/sizer_utils.dart';
import 'package:chat_ai_app_package/widgets/text/common_text.dart';
import 'package:chat_ai_app_package/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../utils/app_assets.dart';
import '../../../widgets/text_field/text_form_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const EditProfileScreen());
  }

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtEditProfile,
            isShowBack: true,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
            child: const EditFieldsView(),
          )
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

class EditFieldsView extends StatelessWidget {
  const EditFieldsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonTextFormFieldWithPrefix(
          controller: TextEditingController(text: "Sharon F. Hart"),
          titleText: Languages.of(context).txtName,
          hintText: Languages.of(context).txtEnterYourName,
          prefixIcon: AppAssets.icName,
          keyboardType: TextInputType.name,
        ),
        SizedBox(height: 20.setHeight),
        CommonTextFormFieldWithPrefix(
          controller: TextEditingController(text: "SharonFHart@yourdomain.com"),
          titleText: Languages.of(context).txtEmail,
          hintText: Languages.of(context).txtEnterYourEmail,
          prefixIcon: AppAssets.icEmail,
          keyboardType: TextInputType.emailAddress,
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
                controller: TextEditingController(text: "+125 95829 59082"),
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
          controller: TextEditingController(text: "28/04/1999"),
          titleText: Languages.of(context).txtBirthDate,
          hintText: "",
          prefixIcon: AppAssets.icCalendar,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 20.setHeight),
        CommonTextFormFieldWithPrefix(
          controller: TextEditingController(text: "Male"),
          titleText: Languages.of(context).txtGender,
          hintText: Languages.of(context).txtSelectYourGender,
          prefixIcon: AppAssets.icGender,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 43.setHeight),
      ],
    );
  }
}
