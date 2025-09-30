import 'package:flutter/material.dart';
import 'package:stoxy_app_package/localization/language/languages.dart';
import 'package:stoxy_app_package/utils/app_assets.dart';
import 'package:stoxy_app_package/utils/sizer_utils.dart';
import 'package:stoxy_app_package/widgets/text/common_text.dart';

import '../../../utils/app_color.dart';

class SelectGenderPage extends StatefulWidget {
  const SelectGenderPage({super.key});

  @override
  State<SelectGenderPage> createState() => _SelectGenderPageState();
}

class _SelectGenderPageState extends State<SelectGenderPage> {
  String? selectedGender = "Male";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.setHeight),
        // Title
        CommonText(
          text: Languages.of(context).txtSelectYourGender,
          fontSize: 26.setFontSize,
          fontWeight: FontWeight.w600,
          textColor: CustomAppColor.of(context).txtBlack,
          textAlign: TextAlign.start,
          maxLines: 2,
        ),

        SizedBox(height: 10.setHeight),

        // Subtitle
        CommonText(
          text: Languages.of(context).txtLoremIpsumShort,
          fontSize: 13.setFontSize,
          fontWeight: FontWeight.w400,
          textColor: CustomAppColor.of(context).txtDescriptionGray,
          textAlign: TextAlign.start,
          maxLines: 2,
        ),

        SizedBox(height: 40.setHeight),

        // Gender options
        Row(
          children: [
            Expanded(
              child: buildGenderCard(
                context,
                "Male",
                AppAssets.icMale,
                selectedGender == "Male",
              ),
            ),
            SizedBox(width: 20.setWidth),
            Expanded(
              child: buildGenderCard(
                context,
                "Female",
                AppAssets.icFemale,
                selectedGender == "Female",
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildGenderCard(BuildContext context, String gender, String iconAsset, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30.setWidth),
        decoration: BoxDecoration(
          gradient: isSelected ? CustomAppColor.of(context).primaryGradient : null,
          borderRadius: BorderRadius.circular(20.setWidth),
          border: Border.all(
            color: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).containerBorder,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gender icon
            Image.asset(
              iconAsset,
              width: 80.setWidth,
              height: 80.setHeight,
              color: isSelected ? Colors.white : CustomAppColor.of(context).containerBorder,
            ),

            SizedBox(height: 12.setHeight),

            // Gender text
            CommonText(
              text: gender,
              fontSize: 16.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: isSelected ? Colors.white : CustomAppColor.of(context).txtGray,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
