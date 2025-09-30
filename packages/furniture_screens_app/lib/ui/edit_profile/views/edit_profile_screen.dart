import 'package:flutter/material.dart';
import 'package:furniture_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:furniture_screens_app_package/localization/language/languages.dart';
import 'package:furniture_screens_app_package/utils/app_assets.dart';
import 'package:furniture_screens_app_package/utils/app_color.dart';
import 'package:furniture_screens_app_package/utils/constant.dart';
import 'package:furniture_screens_app_package/utils/sizer_utils.dart';
import 'package:furniture_screens_app_package/widgets/button/common_button.dart';
import 'package:furniture_screens_app_package/widgets/text_field/text_form_field.dart';
import 'package:furniture_screens_app_package/widgets/top_bar/topbar.dart';

class EditProfileScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EditProfileScreen());
  }

  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> implements TopBarClickListener {
  final TextEditingController emailController = TextEditingController(text: "Kellyoliver@yourdomain.com");
  final TextEditingController fullNameController = TextEditingController(text: "Kelly Oliver");
  final TextEditingController phoneController = TextEditingController(text: "+1 12345 67890");
  final TextEditingController countryController = TextEditingController(text: "America");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              isShowBack: true,
              title: Languages.of(context).txtEditProfile,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 20.setHeight),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            AppAssets.imgDummyProfile,
                            height: 130.setHeight,
                            width: 130.setWidth,
                          ),
                          Positioned(
                            bottom: 5.setHeight,
                            right: 10.setWidth,
                            child: Container(
                              decoration: BoxDecoration(
                                color: CustomAppColor.of(context).primary,
                                shape: BoxShape.circle,
                                border: Border.all(color: CustomAppColor.of(context).bgScreen),
                              ),
                              padding: const EdgeInsets.all(4),
                              child: Image.asset(
                                AppAssets.icEdit,
                                width: 14.setWidth,
                                height: 14.setHeight,
                                color: CustomAppColor.of(context).white,
                              ),
                            ),
                          )
                        ],
                      ),
                      CommonTextFormFieldWithPrefix(
                        controller: emailController,
                        hintText: "",
                        prefixIcon: AppAssets.icEmail,
                        titleText: Languages.of(context).txtEmailAddress,
                      ),
                      SizedBox(height: 20.setHeight),
                      CommonTextFormFieldWithPrefix(
                        controller: fullNameController,
                        hintText: "",
                        prefixIcon: AppAssets.icUser,
                        titleText: Languages.of(context).txtEmailAddress,
                      ),
                      SizedBox(height: 20.setHeight),
                      CommonTextFormFieldWithPrefix(
                        controller: phoneController,
                        hintText: "",
                        prefixIcon: AppAssets.icCall,
                        titleText: Languages.of(context).txtEmailAddress,
                      ),
                      SizedBox(height: 20.setHeight),
                    ],
                  ),
                ),
              ),
            ),
            IgnorePointer(
              ignoring: true,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 20.setHeight),
                child: CommonButton(
                  text: Languages.of(context).txtUpdate,
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
