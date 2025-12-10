import 'package:baby_bloom_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_screens_app/localization/language/languages.dart';
import 'package:baby_bloom_screens_app/ui/profile_setup/views/set_your_due_date_screen.dart';
import 'package:baby_bloom_screens_app/utils/app_assets.dart';
import 'package:baby_bloom_screens_app/utils/app_color.dart';
import 'package:baby_bloom_screens_app/utils/constant.dart';
import 'package:baby_bloom_screens_app/utils/sizer_utils.dart';
import 'package:baby_bloom_screens_app/widgets/text/common_text.dart';
import 'package:baby_bloom_screens_app/widgets/text_field/text_form_field.dart';
import 'package:baby_bloom_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../../widgets/button/common_button.dart';

class AboutYouScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const AboutYouScreen());
  }

  const AboutYouScreen({super.key});

  @override
  State<AboutYouScreen> createState() => _AboutYouScreenState();
}

class _AboutYouScreenState extends State<AboutYouScreen> implements TopBarClickListener {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController relationshipController = TextEditingController();
  final TextEditingController doYouHaveChildren = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              AppAssets.imgProfileSetupBackground2,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                TopBar(
                  this,
                  title: Languages.of(context).txtAboutYou,
                  appBarColor: CustomAppColor.of(context).transparent,
                  isShowBack: true,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: _formFieldView(),
                  ),
                ),
                IgnorePointer(
                  ignoring: true,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 30.setHeight),
                    child: CommonButton(
                      text: Languages.of(context).txtContinue,
                      onTap: () => Navigator.push(context, SetYourDueDateScreen.route()),
                    ),
                  ),
                )
              ],
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

  Widget _formFieldView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtAboutYouDesc,
            textColor: CustomAppColor.of(context).txtLightGrey,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 26.setHeight),
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
                      color: CustomAppColor.of(context).bgScreen,
                      border: Border.all(
                        color: CustomAppColor.of(context).txtWhite,
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
}
