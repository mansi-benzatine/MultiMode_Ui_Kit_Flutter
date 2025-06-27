import 'package:dating_app_package/interfaces/top_bar_click_listener.dart';
import 'package:dating_app_package/localization/language/languages.dart';
import 'package:dating_app_package/utils/app_color.dart';
import 'package:dating_app_package/utils/constant.dart';
import 'package:dating_app_package/utils/sizer_utils.dart';
import 'package:dating_app_package/widgets/button/common_button.dart';
import 'package:dating_app_package/widgets/text_field/text_form_field.dart';
import 'package:dating_app_package/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

class EditJobAndSchoolScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EditJobAndSchoolScreen());
  }

  const EditJobAndSchoolScreen({super.key});

  @override
  State<EditJobAndSchoolScreen> createState() => _EditJobAndSchoolScreenState();
}

class _EditJobAndSchoolScreenState extends State<EditJobAndSchoolScreen> implements TopBarClickListener {
  final TextEditingController _jobController = TextEditingController(text: "Photographer");
  final TextEditingController _schoolController = TextEditingController(text: "Divine Child High School");

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
              title: Languages.of(context).txtEditJobAndSchool,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                  child: Column(
                    children: [
                      SizedBox(height: 10.setHeight),
                      CommonTextFormField(
                        controller: _jobController,
                        hintText: "",
                        titleText: Languages.of(context).txtJob,
                      ),
                      SizedBox(height: 16.setHeight),
                      CommonTextFormField(
                        controller: _schoolController,
                        hintText: "",
                        titleText: Languages.of(context).txtSchool,
                      ),
                    ],
                  ),
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
