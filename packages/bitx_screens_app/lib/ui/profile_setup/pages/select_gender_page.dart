import 'package:bitx_screens_app/localization/language/languages.dart';
import 'package:bitx_screens_app/utils/app_assets.dart';
import 'package:bitx_screens_app/utils/sizer_utils.dart';
import 'package:bitx_screens_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.setHeight),

          CommonText(
            text: Languages.of(context).txtYourGender.toUpperCase(),
            fontSize: 28.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
            maxLines: 2,
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: Languages.of(context).txtLoremIpsumShort,
            fontSize: 13.setFontSize,
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtGray,
            textAlign: TextAlign.start,
            maxLines: 2,
          ),

          SizedBox(height: 40.setHeight),

          // Gender options
          Column(
            children: [
              buildGenderCard(
                context,
                "Male",
                AppAssets.icMale,
                selectedGender == "Male",
              ),
              SizedBox(height: 20.setHeight),
              buildGenderCard(
                context,
                "Female",
                AppAssets.icFemale,
                selectedGender == "Female",
              ),
            ],
          ),
        ],
      ),
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
        padding: EdgeInsets.symmetric(vertical: 18.setWidth, horizontal: 20.setWidth),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.setWidth),
          border: Border.all(
            color: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).containerBorder,
            width: 1,
          ),
          color: isSelected ? CustomAppColor.of(context).primary : null,
          gradient: isSelected ? null : CustomAppColor.of(context).linearGradiant,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonText(
              text: gender,
              fontSize: 16.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: isSelected ? Colors.white : CustomAppColor.of(context).txtGray,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Image.asset(
              iconAsset,
              width: 65.setWidth,
              height: 65.setHeight,
              color: isSelected ? Colors.white : CustomAppColor.of(context).containerBorder,
            ),
          ],
        ),
      ),
    );
  }
}
