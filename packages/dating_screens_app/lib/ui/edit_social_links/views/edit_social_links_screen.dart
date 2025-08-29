import 'package:dating_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:dating_screens_app_package/utils/app_assets.dart';
import 'package:dating_screens_app_package/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../../widgets/top_bar/topbar.dart';

class EditSocialLinksScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EditSocialLinksScreen());
  }

  const EditSocialLinksScreen({super.key});

  @override
  State<EditSocialLinksScreen> createState() => _EditSocialLinksScreenState();
}

class _EditSocialLinksScreenState extends State<EditSocialLinksScreen> implements TopBarClickListener {
  final TextEditingController _instagramController = TextEditingController();
  final TextEditingController _snapchatController = TextEditingController();
  final TextEditingController _facebookController = TextEditingController();
  final TextEditingController _tiktokController = TextEditingController();
  final TextEditingController _telegramController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              this,
              isShowBack: true,
              title: Languages.of(context).txtEditSocialMedia,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                child: Column(
                  children: [
                    SizedBox(height: 10.setHeight),
                    CommonTextFormFieldWithPrefix(
                      prefixIcon: AppAssets.icInstagram,
                      controller: _instagramController,
                      hintText: "https://www.instagram.com/username",
                    ),
                    SizedBox(height: 16.setHeight),
                    CommonTextFormFieldWithPrefix(
                      prefixIcon: AppAssets.icFacebook,
                      controller: _facebookController,
                      hintText: "https://www.facebook.com/username",
                    ),
                    SizedBox(height: 16.setHeight),
                    CommonTextFormFieldWithPrefix(
                      prefixIcon: AppAssets.icSnapchat,
                      controller: _snapchatController,
                      hintText: "https://www.snapchat.com/username",
                    ),
                    SizedBox(height: 16.setHeight),
                    CommonTextFormFieldWithPrefix(
                      prefixIcon: AppAssets.icTiktok,
                      controller: _tiktokController,
                      hintText: "https://www.tiktok.com/username",
                    ),
                    SizedBox(height: 16.setHeight),
                    CommonTextFormFieldWithPrefix(
                      prefixIcon: AppAssets.icTelegram,
                      controller: _telegramController,
                      hintText: "https://www.telegram.com/username",
                    ),
                  ],
                ),
              ),
            ),
            IgnorePointer(

              ignoring:true,child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
                child: CommonButton(onTap: () => Navigator.pop(context), text: Languages.of(context).txtUpdate.toUpperCase()),
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
