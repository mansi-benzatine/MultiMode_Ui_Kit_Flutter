import 'package:flowly_app/utils/constant.dart';
import 'package:flowly_app/utils/sizer_utils.dart';
import 'package:flowly_app/widgets/text/common_text.dart';
import 'package:flowly_app/widgets/text_field/text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';

class YourProfilePage extends StatefulWidget {
  const YourProfilePage({super.key});

  @override
  State<YourProfilePage> createState() => _YourProfilePageState();
}

class _YourProfilePageState extends State<YourProfilePage> {
  final TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 20.setWidth,
        right: 20.setWidth,
        top: 25.setHeight,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        children: [
          SizedBox(height: 15.setHeight),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 120.setWidth,
                height: 120.setHeight,
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).bgScreen,
                  shape: BoxShape.circle,
                  border: Border.all(color: CustomAppColor.of(context).dividerColor),
                ),
                child: Image.asset(AppAssets.imgDummyProfile),
              ),
              Positioned(
                bottom: 5.setHeight,
                right: 8.setWidth,
                child: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, color: CustomAppColor.of(context).black, border: Border.all(color: CustomAppColor.of(context).white)),
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(
                    AppAssets.icEdit,
                    width: 12.setHeight,
                    height: 12.setHeight,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 40.setHeight),
          CommonText(
            text: Languages.of(context).txtWhatsYourName,
            fontFamily: Constant.fontFamilyMulishExtraBold800,
            fontSize: 24.setFontSize,
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: Languages.of(context).txtTellUsYourNameSoWeCanMakeYourJourneyMorePersonal,
            textColor: CustomAppColor.of(context).txtGray,
          ),
          SizedBox(height: 30.setHeight),
          CommonTextFormField(
            controller: nameController,
            hintText: Languages.of(context).txtEnterYourName,
            keyboardType: TextInputType.name,
          ),
        ],
      ),
    );
  }
}
