import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';
import '../datamodel/privacy_policy_data.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const PrivacyPolicyScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              )),
          centerTitle: false,
          titleSpacing: 0,
          title: CommonText(
            text: Languages.of(context).privacyPolicy,
            fontWeight: FontWeight.w700,
            fontSize: AppSizes.setFontSize(20),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(24)),
          child: ListView.builder(
            itemCount: privacyPolicyList.length,
            itemBuilder: (context, index) {
              final content = privacyPolicyList[index];
              return Padding(
                padding: EdgeInsets.only(bottom: AppSizes.setHeight(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: content["title"] ?? "",
                      fontWeight: FontWeight.w700,
                      fontSize: AppSizes.setFontSize(16),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: AppSizes.setHeight(10)),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(7)),
                      child: CommonText(
                        text: content["description"] ?? "",
                        fontWeight: FontWeight.w400,
                        fontSize: AppSizes.setFontSize(13),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
