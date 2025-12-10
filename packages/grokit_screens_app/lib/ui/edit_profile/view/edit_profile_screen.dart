import 'package:flutter/material.dart';
import 'package:grokit_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:grokit_screens_app/localization/language/languages.dart';
import 'package:grokit_screens_app/utils/app_assets.dart';
import 'package:grokit_screens_app/utils/app_color.dart';
import 'package:grokit_screens_app/utils/constant.dart';
import 'package:grokit_screens_app/utils/sizer_utils.dart';
import 'package:grokit_screens_app/widgets/button/common_button.dart';
import 'package:grokit_screens_app/widgets/text_field/text_form_field.dart';
import 'package:grokit_screens_app/widgets/top_bar/topbar.dart';

class EditProfileScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EditProfileScreen());
  }

  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> implements TopBarClickListener {
  final TextEditingController nameController = TextEditingController(text: "Smith Edon");
  final TextEditingController emailController = TextEditingController(text: "smith093@yourdomain.com");
  final TextEditingController phoneController = TextEditingController(text: "+1 12345 67890");
  final TextEditingController birthController = TextEditingController(text: "05/04/1999");
  final TextEditingController genderController = TextEditingController(text: "Male");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtEditProfile,
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextFormFieldWithPrefix(
                        controller: nameController,
                        hintText: "",
                        titleText: Languages.of(context).txtFullName,
                        prefixIcon: AppAssets.icUser,
                      ),
                      SizedBox(height: 18.setHeight),
                      CommonTextFormFieldWithPrefix(
                        controller: emailController,
                        hintText: "",
                        titleText: Languages.of(context).txtEmailAddress,
                        prefixIcon: AppAssets.icEmail,
                      ),
                      SizedBox(height: 18.setHeight),
                      CommonTextFormFieldWithPrefix(
                        controller: phoneController,
                        hintText: "",
                        titleText: Languages.of(context).txtPhoneNumber,
                        prefixIcon: AppAssets.icCall,
                      ),
                      SizedBox(height: 18.setHeight),
                      CommonTextFormFieldWithPrefix(
                        controller: birthController,
                        hintText: "",
                        titleText: Languages.of(context).txtBirthDate,
                        prefixIcon: AppAssets.icCalender,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
              child: IgnorePointer(
                ignoring: true,
                child: CommonButton(
                  onTap: () => Navigator.pop(context),
                  text: Languages.of(context).txtUpdate,
                  borderColor: CustomAppColor.of(context).buttonPrimary,
                  buttonColor: CustomAppColor.of(context).buttonPrimary,
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
