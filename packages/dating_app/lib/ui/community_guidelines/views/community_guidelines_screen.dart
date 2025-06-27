import 'package:dating_app_package/localization/language/languages.dart';
import 'package:dating_app_package/utils/sizer_utils.dart';
import 'package:dating_app_package/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../../../interfaces/top_bar_click_listener.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/top_bar/topbar.dart';

class CommunityGuidelinesScreen extends StatefulWidget {
  const CommunityGuidelinesScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const CommunityGuidelinesScreen());
  }

  @override
  State<CommunityGuidelinesScreen> createState() => _CommunityGuidelinesScreenState();
}

class _CommunityGuidelinesScreenState extends State<CommunityGuidelinesScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            TopBar(
              this,
              isShowBack: true,
              title: "Community Guidelines",
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.setHeight),
                    Center(
                      child: Image.asset(
                        AppAssets.imgCommunity,
                        width: 120.setWidth,
                        height: 120.setHeight,
                      ),
                    ),
                    SizedBox(height: 20.setHeight),
                    _buildSection(
                      context,
                      title: "Trust & Respect",
                      content:
                          "Lorem Ipsum is simply dummy text of the printing of the typesetting industry. Lorem Ipsum has been the text into industry's standard dummy text ever since the 1500s, it when an text of the printing typesetting to the biggest industry. unknown printer took a galley of type and the scrambled it to make a type specimen book. It has been survived not only five centuries, but also the leap into electronic typesetting, remaining essentially to the real unchange. Lorem Ipsum is simply dummy text of the new printing typesetting industry. Lorem Ipsum is simply dummy text of the new printing typesetting industry.",
                    ),
                    SizedBox(height: 20.setHeight),
                    _buildSection(
                      context,
                      title: "Fun",
                      content:
                          "Please read this Terms and Conditions it to make a type specimen book. It has been survived not only five steps centuries, but also the leap into electronic typesetting, remaining essentially. Please read this Terms and the Conditions it to make a type specimen book. It has been survived not only five steps centuries, but also the leap into electronic typesetting, remaining essentially. Lorem Ipsum is simply dummy text of the new printing typesetting industry.Lorem Ipsum is simply dummy text of the new printing typesetting industry.",
                    ),
                    SizedBox(height: 20.setHeight),
                    _buildSection(
                      context,
                      title: "Content Guidelines",
                      content:
                          "Lorem Ipsum is simply dummy text of the printing of the typesetting industry. Lorem Ipsum has been the text into industry's standard dummy text ever since the 1500s, it Lorem Ipsum is simply dummy text of the printing of the typesetting industry. Lorem Ipsum has been the text into industry's standard dummy text ever since the 1500s, it",
                    ),
                    SizedBox(height: 20.setHeight),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.setWidth, right: 24.setWidth, bottom: 20.setHeight, top: 10.setHeight),
              child: CommonButton(
                text: Languages.of(context).txtIAgreeAndUnderstand,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, {required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: title,
          fontWeight: FontWeight.w700,
          fontSize: 18.setFontSize,
        ),
        SizedBox(height: 8.setHeight),
        CommonText(
          text: content,
          fontWeight: FontWeight.w400,
          fontSize: 13.setFontSize,
          textAlign: TextAlign.start,
          textColor: CustomAppColor.of(context).txtGrey,
        ),
      ],
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
