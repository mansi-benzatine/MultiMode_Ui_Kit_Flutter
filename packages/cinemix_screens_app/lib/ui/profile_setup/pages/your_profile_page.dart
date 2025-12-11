import 'package:cinemix_screens_app/localization/language/languages.dart';
import 'package:cinemix_screens_app/utils/app_assets.dart';
import 'package:cinemix_screens_app/utils/app_color.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:cinemix_screens_app/widgets/text_field/text_form_field.dart';
import 'package:flutter/material.dart';

class YourProfilePage extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const YourProfilePage());
  }

  const YourProfilePage({super.key});

  @override
  State<YourProfilePage> createState() => _YourProfilePageState();
}

class _YourProfilePageState extends State<YourProfilePage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 68,
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
    );
  }
}
