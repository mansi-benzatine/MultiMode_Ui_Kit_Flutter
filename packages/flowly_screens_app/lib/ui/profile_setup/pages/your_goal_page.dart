import 'package:flowly_screens_app/localization/language/languages.dart';
import 'package:flowly_screens_app/utils/app_color.dart';
import 'package:flowly_screens_app/utils/constant.dart';
import 'package:flowly_screens_app/utils/sizer_utils.dart';
import 'package:flowly_screens_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

class YourGoalPage extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const YourGoalPage());
  }

  const YourGoalPage({super.key});

  @override
  State<YourGoalPage> createState() => _YourGoalPageState();
}

class _YourGoalPageState extends State<YourGoalPage> {
  List<int> selectedIndexes = [];

  final goals = [
    "Tracking my cycle",
    "Trying to get pregnant",
    "Avoiding pregnancy",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: 25.setWidth,
        vertical: 30.setHeight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CommonText(
            text: Languages.of(context).txtWhatsYourGoal,
            fontFamily: Constant.fontFamilyMulishExtraBold800,
            fontSize: 24.setFontSize,
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: Languages.of(context).txtYouCanSelectMoreThanOneChoiceToAccuratelyReflectYourSituation,
            textColor: CustomAppColor.of(context).txtGray,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 60.setHeight),
          Column(
            children: List.generate(goals.length, (index) {
              final bool isSelected = selectedIndexes.contains(index);

              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      selectedIndexes.remove(index);
                    } else {
                      selectedIndexes.add(index);
                    }
                  });
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 12.setHeight),
                  margin: EdgeInsets.only(bottom: 15.setHeight),
                  decoration: BoxDecoration(
                    color: isSelected ? CustomAppColor.of(context).primary.withValues(alpha: 0.08) : CustomAppColor.of(context).transparent,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).grey,
                      width: 1,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: CommonText(
                    text: goals[index],
                    fontFamily: Constant.fontFamilyMulishSemiBold600,
                    fontSize: 16.setFontSize,
                    textColor: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtBlack,
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
