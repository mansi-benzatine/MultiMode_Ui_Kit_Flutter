import 'package:dating_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:dating_screens_app_package/ui/verify_your_number/views/verify_your_number_screen.dart';
import 'package:dating_screens_app_package/utils/sizer_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class MobileVerificationScreen extends StatefulWidget {
  const MobileVerificationScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const MobileVerificationScreen());
  }

  @override
  State<MobileVerificationScreen> createState() => _MobileVerificationScreenState();
}

class _MobileVerificationScreenState extends State<MobileVerificationScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(this, isShowBack: true),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 61.setHeight),
                      CommonText(
                        text: Languages.of(context).txtMobileVerification,
                        fontSize: 30.setFontSize,
                        fontWeight: FontWeight.w900,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.setWidth),
                        child: CommonText(
                          text: Languages.of(context).txtMobileVerificationDesc,
                          fontSize: 16.setFontSize,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 47.setHeight),
                      TextFormFieldsView(),
                      SizedBox(height: 47.setHeight),
                      IgnorePointer(
                        ignoring: true,
                        child: CommonButton(
                          text: Languages.of(context).txtVerify.toUpperCase(),
                          onTap: () => Navigator.push(context, VerifyYourNumberScreen.route()),
                        ),
                      ),
                    ],
                  ),
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

class TextFormFieldsView extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();

  TextFormFieldsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: _phoneController,
      disableLengthCheck: true,
      flagsButtonPadding: EdgeInsetsGeometry.only(left: 16.setWidth),
      decoration: InputDecoration(
          hintText: '01234 56789',
          isDense: true,
          filled: true,
          hintStyle: TextStyle(color: CustomAppColor.of(context).txtGrey),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 12.setHeight),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: CustomAppColor.of(context).textFormFieldBorder),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: CustomAppColor.of(context).textFormFieldBorder),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: CustomAppColor.of(context).textFormFieldBorder),
          ),
          fillColor: CustomAppColor.of(context).bgTextFormField),
      initialCountryCode: 'IN',
      onChanged: (phone) {},
      dropdownIconPosition: IconPosition.trailing,
      dropdownIcon: Icon(
        Icons.keyboard_arrow_down,
        color: CustomAppColor.of(context).txtGrey,
      ),
    );
  }
}
