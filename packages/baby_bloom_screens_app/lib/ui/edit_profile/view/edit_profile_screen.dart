import 'package:baby_bloom_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_screens_app/localization/language/languages.dart';
import 'package:baby_bloom_screens_app/utils/app_assets.dart';
import 'package:baby_bloom_screens_app/utils/app_color.dart';
import 'package:baby_bloom_screens_app/utils/constant.dart';
import 'package:baby_bloom_screens_app/utils/sizer_utils.dart';
import 'package:baby_bloom_screens_app/widgets/text_field/text_form_field.dart';
import 'package:baby_bloom_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../../widgets/button/common_button.dart';

class EditProfileScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EditProfileScreen());
  }

  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> implements TopBarClickListener {
  final TextEditingController nameController = TextEditingController(text: "Elvina Jack");
  final TextEditingController ageController = TextEditingController(text: "24");
  final TextEditingController relationshipController = TextEditingController(text: "Mother");
  final TextEditingController doYouHaveChildren = TextEditingController(text: "No");

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
              child: _formFieldView(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, bottom: 50.setHeight),
            child: IgnorePointer(
              ignoring: true,
              child: CommonButton(
                text: Languages.of(context).txtUpdate,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _formFieldView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Stack(
              children: [
                Image.asset(
                  AppAssets.imgDummyProfile,
                  height: 100.setHeight,
                  width: 100.setWidth,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: CustomAppColor.of(context).black,
                      border: Border.all(
                        color: CustomAppColor.of(context).white,
                      ),
                    ),
                    padding: const EdgeInsets.all(6),
                    child: Image.asset(
                      AppAssets.icEdit,
                      width: 12.setWidth,
                      height: 12.setHeight,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 24.setHeight),
          CommonTextFormField(
            titleText: Languages.of(context).txtName,
            fillColor: CustomAppColor.of(context).transparent,
            controller: nameController,
            hintText: Languages.of(context).txtEnterYourName,
          ),
          SizedBox(height: 24.setHeight),
          CommonTextFormField(
            titleText: Languages.of(context).txtAge,
            fillColor: CustomAppColor.of(context).transparent,
            controller: ageController,
            hintText: Languages.of(context).txtEnterYourAge,
          ),
          SizedBox(height: 24.setHeight),
          CommonTextFormField(
            titleText: Languages.of(context).txtRelationship,
            fillColor: CustomAppColor.of(context).transparent,
            controller: relationshipController,
            hintText: Languages.of(context).txtEnterYourRelationship,
          ),
          SizedBox(height: 24.setHeight),
          CommonTextFormField(
            titleText: Languages.of(context).txtDoYouHaveChildren,
            fillColor: CustomAppColor.of(context).transparent,
            controller: doYouHaveChildren,
            hintText: Languages.of(context).txtEnterYourChildStatus,
          ),
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
