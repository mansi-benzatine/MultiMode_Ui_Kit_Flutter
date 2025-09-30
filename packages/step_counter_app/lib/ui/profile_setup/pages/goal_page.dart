import 'package:flutter/cupertino.dart';
import 'package:step_counter_app_package/utils/app_assets.dart';
import 'package:step_counter_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';

class GoalPage extends StatefulWidget {
  const GoalPage({super.key});

  @override
  State<GoalPage> createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
  final ValueNotifier<int> selectedGoal = ValueNotifier(1500);

  final FixedExtentScrollController _goalController = FixedExtentScrollController(initialItem: 2);

  final List<int> goals = List.generate(50, (index) => (index + 1) * 500);

  @override
  void dispose() {
    _goalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 165.setHeight,
              width: 165.setHeight,
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).bgContainerLightAndDark,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(30.setWidth),
              child: Image.asset(AppAssets.icSetupProfileGoal),
            ),
            SizedBox(height: 40.setHeight),
            CommonText(
              text: Languages.of(context).txtWhatIsYourGoal.toUpperCase(),
              fontSize: 20.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).txtBlack,
              textAlign: TextAlign.center,
            ),
            _buildGoalPicker(),
          ],
        ),
      ),
    );
  }

  Widget _buildGoalPicker() {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 60.setHeight),
          child: Container(
            height: 120.setHeight,
            width: 0.screenWidth,
            padding: EdgeInsets.symmetric(horizontal: 0.screenWidth / 3.2),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CupertinoPicker(
                    scrollController: _goalController,
                    itemExtent: 50.setHeight,
                    diameterRatio: 1,
                    onSelectedItemChanged: (index) {
                      selectedGoal.value = goals[index];
                    },
                    selectionOverlay: Container(
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).transparent,
                        border: Border.symmetric(
                          horizontal: BorderSide(color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.15)),
                        ),
                      ),
                    ),
                    children: goals.map((goal) {
                      return Center(
                        child: ValueListenableBuilder(
                          valueListenable: selectedGoal,
                          builder: (context, selectedValue, child) {
                            final isSelected = goal == selectedValue;
                            return CommonText(
                              text: goal.toString(),
                              fontSize: isSelected ? 25.setFontSize : 20.setFontSize,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                              textColor: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtGray,
                              textAlign: TextAlign.center,
                            );
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0.screenWidth / 4.3,
          bottom: 0,
          top: 35.setHeight,
          child: Image.asset(
            AppAssets.icTriangleRight,
            height: 20.setHeight,
            width: 20.setHeight,
          ),
        ),
      ],
    );
  }
}
