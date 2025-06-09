import 'package:flutter/material.dart';

import '../../../../../../../utils/string_constant.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/textfield/common_textformfield.dart';

class EditAboutYouScreen extends StatelessWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const EditAboutYouScreen());
  }

  const EditAboutYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController name = TextEditingController(text: AppStrings.johnDoe);
    final TextEditingController username = TextEditingController(text: AppStrings.joinThisHashtag);
    final TextEditingController bio = TextEditingController(text: AppStrings.designerPhoto);
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScaffold,
        appBar: AppBar(
          backgroundColor: CustomAppColor.of(context).bgScaffold,
          leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back)),
          centerTitle: false,
          titleSpacing: 0,
          title: CommonText(
            text: Languages.of(context).aboutYou,
            fontWeight: FontWeight.w700,
            fontSize: AppSizes.setFontSize(18),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(24), vertical: AppSizes.setHeight(20)),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CommonTextFormField(
                        controller: name,
                        leadingIcon: Image.asset(
                          AppAssets.icProfile,
                          color: CustomAppColor.of(context).icBlack,
                          scale: 5,
                        ),
                      ),
                      SizedBox(height: AppSizes.setHeight(16)),
                      CommonTextFormField(
                        controller: username,
                        leadingIcon: Image.asset(
                          AppAssets.icTickSquare,
                          color: CustomAppColor.of(context).icBlack,
                          scale: 6,
                        ),
                      ),
                      SizedBox(height: AppSizes.setHeight(16)),
                      CommonTextFormField(
                        controller: bio,
                        leadingIcon: Image.asset(
                          AppAssets.icDocument,
                          color: CustomAppColor.of(context).icBlack,
                          scale: 6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _buildBottomButtons(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomButtons(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: CommonButton(
            useSimpleStyle: true,
            radius: 120,
            child: CommonText(
              text: Languages.of(context).cancel,
              fontWeight: FontWeight.w700,
              fontSize: AppSizes.setFontSize(14),
              textColor: CustomAppColor.of(context).txtPurple,
            ),
          ),
        ),
        SizedBox(width: AppSizes.setWidth(12)),
        Expanded(
          child: CommonButton(
            radius: 1,
            child: CommonText(
              text: Languages.of(context).update,
              textColor: AppColor.txtWhite,
              fontWeight: FontWeight.w700,
              fontSize: AppSizes.setFontSize(14),
            ),
          ),
        ),
      ],
    );
  }
}
