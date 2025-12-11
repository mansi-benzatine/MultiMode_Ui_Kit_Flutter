import 'package:cinemix_app/interfaces/top_bar_click_listener.dart';
import 'package:cinemix_app/localization/language/languages.dart';
import 'package:cinemix_app/utils/app_assets.dart';
import 'package:cinemix_app/utils/app_color.dart';
import 'package:cinemix_app/utils/constant.dart';
import 'package:cinemix_app/utils/sizer_utils.dart';
import 'package:cinemix_app/widgets/button/common_button.dart';
import 'package:cinemix_app/widgets/text_field/text_form_field.dart';
import 'package:cinemix_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EditProfileScreen());
  }

  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> implements TopBarClickListener {
  final TextEditingController fullNameController = TextEditingController(text: "Sana David");
  final TextEditingController emailController = TextEditingController(text: "sana173@gmail.com");
  final TextEditingController phoneController = TextEditingController(text: "+1 12345 67890");
  final TextEditingController genderController = TextEditingController(text: "Female");

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
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          child: Image.asset(
                            AppAssets.imgDummyImage,
                            width: 140.setWidth,
                            height: 140.setHeight,
                          ),
                        ),
                        Positioned(
                          bottom: 5.setHeight,
                          right: 10.setWidth,
                          child: Container(
                            decoration: BoxDecoration(
                              color: CustomAppColor.of(context).primary,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(6),
                            child: Image.asset(
                              AppAssets.icEdit,
                              height: 16.setHeight,
                              width: 16.setWidth,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.setHeight),
                    CommonTextFormFieldWithPrefix(
                      controller: fullNameController,
                      hintText: Languages.of(context).txtEnterYourFullName,
                      prefixIcon: AppAssets.icProfile,
                      titleText: Languages.of(context).txtFullName,
                    ),
                    SizedBox(height: 20.setHeight),
                    CommonTextFormFieldWithPrefix(
                      controller: emailController,
                      hintText: Languages.of(context).txtEnterYourEmail,
                      prefixIcon: AppAssets.icMail,
                      titleText: Languages.of(context).txtEmail,
                    ),
                    SizedBox(height: 20.setHeight),
                    CommonTextFormFieldWithPrefix(
                      controller: phoneController,
                      hintText: Languages.of(context).txtEnterYourPhoneNumber,
                      prefixIcon: AppAssets.icCall,
                      titleText: Languages.of(context).txtPhone,
                    ),
                    SizedBox(height: 20.setHeight),
                    CommonTextFormFieldWithPrefix(
                      controller: genderController,
                      hintText: Languages.of(context).txtSelectYourGender,
                      prefixIcon: AppAssets.icGender,
                      titleText: Languages.of(context).txtGender,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: Row(
              children: [
                Expanded(
                  child: CommonButton(
                    text: Languages.of(context).txtCancel,
                    borderColor: CustomAppColor.of(context).btnGrey,
                    buttonColor: CustomAppColor.of(context).btnGrey,
                    buttonTextColor: CustomAppColor.of(context).txtBlack,
                    onTap: () => Navigator.pop(context),
                  ),
                ),
                SizedBox(width: 12.setWidth),
                Expanded(
                  child: CommonButton(
                    text: Languages.of(context).txtUpdate,
                    onTap: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50.setHeight)
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
