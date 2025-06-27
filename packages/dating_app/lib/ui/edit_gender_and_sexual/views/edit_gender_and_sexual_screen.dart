import 'package:dating_app_package/interfaces/top_bar_click_listener.dart';
import 'package:dating_app_package/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../../widgets/top_bar/topbar.dart';

class EditGenderAndSexualScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EditGenderAndSexualScreen());
  }

  const EditGenderAndSexualScreen({super.key});

  @override
  State<EditGenderAndSexualScreen> createState() => _EditGenderAndSexualScreenState();
}

class _EditGenderAndSexualScreenState extends State<EditGenderAndSexualScreen> implements TopBarClickListener {
  final TextEditingController _genderController = TextEditingController(text: "Male");
  final TextEditingController _orientationController = TextEditingController(text: "Straight");

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
              title: Languages.of(context).txtEditGenderAndSexual,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                child: Column(
                  children: [
                    SizedBox(height: 16.setHeight),
                    CommonTextFormField(
                      controller: _genderController,
                      hintText: "",
                      titleText: Languages.of(context).txtGender,
                    ),
                    SizedBox(height: 16.setHeight),
                    CommonTextFormField(
                      controller: _orientationController,
                      hintText: "",
                      titleText: Languages.of(context).txtSexualOrientation,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
              child: CommonButton(onTap: () => Navigator.pop(context), text: Languages.of(context).txtUpdate.toUpperCase()),
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
