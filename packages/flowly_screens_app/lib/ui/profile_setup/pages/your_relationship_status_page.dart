import 'package:flowly_screens_app/localization/language/languages.dart';
import 'package:flowly_screens_app/utils/app_color.dart';
import 'package:flowly_screens_app/utils/constant.dart';
import 'package:flowly_screens_app/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../widgets/text/common_text.dart';

class YourRelationshipStatusPage extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const YourRelationshipStatusPage());
  }

  const YourRelationshipStatusPage({super.key});

  @override
  State<YourRelationshipStatusPage> createState() => _YourRelationshipStatusPageState();
}

class _YourRelationshipStatusPageState extends State<YourRelationshipStatusPage> {
  int selectedIndex = 0;

  final List<String> options = [
    "I'm single",
    "Married",
    "In a relationship",
    "I'd rather not say",
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 25.setWidth,
        right: 25.setWidth,
        top: 30.setHeight,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        children: [
          CommonText(
            text: Languages.of(context).txtYourRelationshipStatus,
            fontFamily: Constant.fontFamilyMulishExtraBold800,
            fontSize: 24.setFontSize,
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: Languages.of(context).txtTellUsYourRelationshipStatusSoWeCanTailorGuidanceForYou,
            textColor: CustomAppColor.of(context).txtGray,
          ),
          SizedBox(height: 60.setHeight),
          Column(
            children: List.generate(options.length, (index) {
              final bool isSelected = index == selectedIndex;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 12.setHeight),
                  padding: EdgeInsets.symmetric(
                    vertical: 14.setHeight,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: isSelected ? CustomAppColor.of(context).primary.withValues(alpha: 0.08) : CustomAppColor.of(context).transparent,
                    borderRadius: BorderRadius.circular(40.setHeight),
                    border: Border.all(
                      color: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).dividerColor,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: CommonText(
                      text: options[index],
                      fontSize: 16.setFontSize,
                      fontFamily: Constant.fontFamilyMulishSemiBold600,
                      textColor: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtBlack,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
