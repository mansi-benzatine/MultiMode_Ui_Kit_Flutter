import 'package:flutter/material.dart';

import '../../../../../../ui/login_to_your_account/view/login_to_your_account_screen.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/container/common_container.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/textfield/common_textformfield.dart';

class CreateNewAccountScreen extends StatelessWidget {
  const CreateNewAccountScreen({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (context) => const CreateNewAccountScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScaffold,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                IgnorePointer(
                  ignoring: true,
                  child: Padding(
                    padding: EdgeInsets.only(top: AppSizes.setHeight(61)),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset(
                        AppAssets.icLeftArrow,
                        width: AppSizes.setWidth(20),
                        height: AppSizes.setHeight(20),
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  AppAssets.imgAppLogo,
                  width: AppSizes.setWidth(80),
                  height: AppSizes.setHeight(80),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(15)),
                  child: CommonText(
                    text: Languages.of(context).createYourAccount,
                    fontWeight: FontWeight.w700,
                    fontSize: AppSizes.setFontSize(24),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(16)),
                  child: CommonTextFormField(
                    borderColor: CustomAppColor.of(context).textFieldBorder,
                    leadingIcon: Image.asset(
                      AppAssets.icProfile,
                      width: AppSizes.setHeight(20),
                      height: AppSizes.setHeight(20),
                    ),
                    hintText: Languages.of(context).fullName,
                  ),
                ),
                CommonTextFormField(
                  borderColor: CustomAppColor.of(context).textFieldBorder,
                  leadingIcon: Image.asset(
                    AppAssets.icMail,
                    width: AppSizes.setHeight(20),
                    height: AppSizes.setHeight(20),
                  ),
                  hintText: Languages.of(context).eMail,
                ),
                Padding(
                  padding: EdgeInsets.only(top: AppSizes.setHeight(16)),
                  child: CommonTextFormField(
                    borderColor: CustomAppColor.of(context).textFieldBorder,
                    leadingIcon: Image.asset(
                      AppAssets.icPassword,
                      width: AppSizes.setHeight(20),
                      height: AppSizes.setHeight(20),
                    ),
                    hintText: Languages.of(context).password,
                    isPasswordField: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(16)),
                  child: CommonTextFormField(
                    borderColor: CustomAppColor.of(context).textFieldBorder,
                    leadingIcon: Image.asset(
                      AppAssets.icPassword,
                      width: AppSizes.setHeight(20),
                      height: AppSizes.setHeight(20),
                    ),
                    hintText: Languages.of(context).confirmPassword,
                    isPasswordField: true,
                  ),
                ),
                IgnorePointer(
                  ignoring: true,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(20)),
                    child: CommonButton(
                      btnText: Languages.of(context).signUp,
                      onTap: () => Navigator.push(context, LoginToYourAccountScreen.route()),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(8), vertical: AppSizes.setHeight(20)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: CustomAppColor.of(context).dividerGrey,
                          thickness: 2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(8)),
                        child: CommonText(
                          text: Languages.of(context).orContinueWith,
                          fontSize: AppSizes.setFontSize(13),
                          fontWeight: FontWeight.w500,
                          textColor: CustomAppColor.of(context).txtGrey,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: CustomAppColor.of(context).dividerGrey,
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomContainer(
                        width: AppSizes.setWidth(56),
                        height: AppSizes.setHeight(56),
                        borderRadius: 100,
                        child: Image.asset(
                          AppAssets.icApple,
                          width: AppSizes.setWidth(21),
                          height: AppSizes.setHeight(26),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(24)),
                        child: CustomContainer(
                          width: AppSizes.setWidth(56),
                          height: AppSizes.setHeight(56),
                          borderRadius: 100,
                          child: Image.asset(
                            AppAssets.icGoogle,
                            width: AppSizes.setWidth(28),
                            height: AppSizes.setHeight(28),
                          ),
                        ),
                      ),
                      CustomContainer(
                        width: AppSizes.setWidth(56),
                        height: AppSizes.setHeight(56),
                        borderRadius: 100,
                        child: Image.asset(
                          AppAssets.icFacebook,
                          width: AppSizes.setWidth(28),
                          height: AppSizes.setHeight(28),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(
                        text: Languages.of(context).haveAnAccount,
                        textColor: CustomAppColor.of(context).txtGrey,
                        fontWeight: FontWeight.w500,
                      ),
                      IgnorePointer(
                        ignoring: true,
                        child: InkWell(
                          onTap: () => Navigator.push(context, LoginToYourAccountScreen.route()),
                          child: CommonText(
                            text: Languages.of(context).loginNow,
                            textColor: CustomAppColor.of(context).txtPurple,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
