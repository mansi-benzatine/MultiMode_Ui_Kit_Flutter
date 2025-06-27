import 'package:dating_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:dating_screens_app_package/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../../widgets/top_bar/topbar.dart';

class EditSystemScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EditSystemScreen());
  }

  const EditSystemScreen({super.key});

  @override
  State<EditSystemScreen> createState() => _EditSystemScreenState();
}

class _EditSystemScreenState extends State<EditSystemScreen> implements TopBarClickListener {
  final TextEditingController _phoneController = TextEditingController(text: "+91 12345 67890");
  final TextEditingController _passwordController = TextEditingController(text: "26556555656658");
  final TextEditingController _emailController = TextEditingController(text: "user@yourdomain.com");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              isShowBack: true,
              title: Languages.of(context).txtEditSystem,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.setWidth),
                  child: Column(
                    children: [
                      SizedBox(height: 10.setHeight),
                      CommonTextFormField(
                        controller: _phoneController,
                        hintText: "",
                        titleText: Languages.of(context).txtPhoneNumber,
                      ),
                      SizedBox(height: 16.setHeight),
                      CommonTextFormFieldWithPrefixAndSuffix(
                        isPasswordField: true,
                        prefixIcon: "",
                        controller: _passwordController,
                        hintText: "",
                        titleText: Languages.of(context).txtPassword,
                        obscureText: true,
                      ),
                      SizedBox(height: 16.setHeight),
                      CommonTextFormField(
                        controller: _emailController,
                        hintText: "",
                        titleText: Languages.of(context).txtEmail,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            IgnorePointer(
              ignoring: true,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
                child: CommonButton(onTap: () => Navigator.pop(context), text: Languages.of(context).txtUpdate.toUpperCase()),
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
