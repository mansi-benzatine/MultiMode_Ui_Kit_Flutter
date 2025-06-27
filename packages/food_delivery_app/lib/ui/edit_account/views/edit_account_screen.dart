import 'package:flutter/material.dart';
import 'package:food_delivery_app_package/interfaces/top_bar_click_listener.dart';
import 'package:food_delivery_app_package/localization/language/languages.dart';
import 'package:food_delivery_app_package/utils/app_assets.dart';
import 'package:food_delivery_app_package/utils/app_color.dart';
import 'package:food_delivery_app_package/utils/constant.dart';
import 'package:food_delivery_app_package/utils/sizer_utils.dart';
import 'package:food_delivery_app_package/widgets/button/common_button.dart';
import 'package:food_delivery_app_package/widgets/text/common_text.dart';
import 'package:food_delivery_app_package/widgets/text_field/text_form_field.dart';
import 'package:food_delivery_app_package/widgets/top_bar/topbar.dart';

class EditAccountScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EditAccountScreen());
  }

  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> implements TopBarClickListener {
  final TextEditingController phoneNumberController = TextEditingController(text: "12345 67890");
  final TextEditingController userNameController = TextEditingController(text: "Brayde");
  final TextEditingController emailController = TextEditingController(text: "email@yourdomain.com");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            TopBar(
              this,
              title: Languages.of(context).txtEditAccount,
              isShowBack: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                  child: Column(
                    children: [
                      SizedBox(height: 44.setHeight),
                      CircleAvatar(
                        backgroundImage: AssetImage(AppAssets.imgUserProfile),
                        maxRadius: 50,
                      ),
                      SizedBox(height: 16.setHeight),
                      CommonText(
                        text: Languages.of(context).txtEditProfile.toUpperCase(),
                        fontSize: 15.setFontSize,
                        textColor: CustomAppColor.of(context).primary,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 44.setHeight),
                      CommonTextFormField(
                        controller: phoneNumberController,
                        hintText: "",
                        titleText: Languages.of(context).txtMobileNumber,
                      ),
                      SizedBox(height: 20.setHeight),
                      CommonTextFormField(
                        controller: userNameController,
                        hintText: "",
                        titleText: Languages.of(context).txtUserName,
                      ),
                      SizedBox(height: 20.setHeight),
                      CommonTextFormField(
                        controller: emailController,
                        hintText: "",
                        titleText: Languages.of(context).txtEmail,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
              child: CommonButton(
                text: Languages.of(context).txtUpdate.toUpperCase(),
                onTap: () => Navigator.pop(context),
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
