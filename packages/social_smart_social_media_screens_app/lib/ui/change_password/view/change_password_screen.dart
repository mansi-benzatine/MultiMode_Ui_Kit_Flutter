import 'package:flutter/material.dart';

import '../../../../../../../utils/app_color.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/textfield/common_textformfield.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});
  static Route route({bool? isFromPost}) {
    return MaterialPageRoute(
      builder: (context) => const ChangePasswordScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController? controller = TextEditingController(text: "");
    TextEditingController? controller1 = TextEditingController(text: "");
    TextEditingController? controller2 = TextEditingController(text: "");
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomAppColor.of(context).bgScaffold,
          leading: IgnorePointer(
            ignoring: true,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          centerTitle: false,
          titleSpacing: 0,
          title: CommonText(
            text: Languages.of(context).changePassword,
            fontWeight: FontWeight.w700,
            fontSize: AppSizes.setFontSize(18),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(18)),
          child: Stack(
            children: [
              Column(
                children: [
                  passwordTextField(context, controller, "Add Old Password"),
                  passwordTextField(context, controller1, "Add New Password"),
                  passwordTextField(context, controller2, "Confirm New Password"),
                ],
              ),
              Positioned(
                  bottom: AppSizes.setHeight(16),
                  left: AppSizes.setWidth(0),
                  right: AppSizes.setWidth(0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(8), vertical: AppSizes.setHeight(8)),
                    child: CommonButton(btnText: Languages.of(context).savePassword),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget passwordTextField(BuildContext context, TextEditingController? controller, String hintText) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(12)),
      child: CommonTextFormField(
        isPasswordField: true,
        hintText: hintText,
        controller: controller,
        leadingIcon: Image.asset(
          AppAssets.icLock,
          color: CustomAppColor.of(context).icBlack,
          scale: 4,
        ),
      ),
    );
  }
}
