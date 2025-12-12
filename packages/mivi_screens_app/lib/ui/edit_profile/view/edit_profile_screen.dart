import 'package:flutter/material.dart';
import 'package:mivi_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:mivi_screens_app/localization/language/languages.dart';
import 'package:mivi_screens_app/utils/app_color.dart';
import 'package:mivi_screens_app/utils/constant.dart';
import 'package:mivi_screens_app/utils/sizer_utils.dart';
import 'package:mivi_screens_app/widgets/button/common_button.dart';
import 'package:mivi_screens_app/widgets/text_field/text_form_field.dart';
import 'package:mivi_screens_app/widgets/top_bar/topbar.dart';

import '../../../utils/app_assets.dart';

class EditProfileScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EditProfileScreen());
  }

  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> implements TopBarClickListener {
  final TextEditingController nameController = TextEditingController(text: "Jenny Larsen");
  final TextEditingController emailController = TextEditingController(text: "jennylarsen@yourdomain.com");
  final TextEditingController phoneController = TextEditingController(text: "+1 12345 67890");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            isShowBack: true,
            title: Languages.of(context).txtEditProfile,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              child: Image.asset(
                                AppAssets.imgDummy,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: CustomAppColor.of(context).secondary,
                                  border: Border.all(
                                    color: CustomAppColor.of(context).white,
                                  ),
                                ),
                                padding: const EdgeInsets.all(3),
                                child: Image.asset(
                                  AppAssets.icCamera,
                                  width: 14.setWidth,
                                  height: 14.setHeight,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 25.setHeight),
                    CommonTextFormField(
                      controller: nameController,
                      hintText: "",
                      titleText: Languages.of(context).txtName,
                    ),
                    SizedBox(height: 24.setHeight),
                    CommonTextFormField(
                      controller: emailController,
                      hintText: "",
                      titleText: Languages.of(context).txtEmail,
                    ),
                    SizedBox(height: 24.setHeight),
                    CommonTextFormField(
                      controller: phoneController,
                      hintText: "",
                      titleText: Languages.of(context).txtPhone,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 65.setHeight, left: 20.setWidth, right: 20.setWidth),
            child: IgnorePointer(
              ignoring: true,
              child: CommonButton(
                text: Languages.of(context).txtUpdate,
                onTap: () => Navigator.pop(context),
              ),
            ),
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
