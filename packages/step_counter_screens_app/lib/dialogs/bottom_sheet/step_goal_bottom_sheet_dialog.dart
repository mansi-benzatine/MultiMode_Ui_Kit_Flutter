import 'package:flutter/cupertino.dart';
import 'package:step_counter_screens_app_package/utils/sizer_utils.dart';
import 'package:step_counter_screens_app_package/widgets/button/common_button.dart';
import 'package:step_counter_screens_app_package/widgets/text/common_text.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';

class StepGoalBottomSheetDialog extends StatefulWidget {
  const StepGoalBottomSheetDialog({super.key, required this.onSave});

  final Function() onSave;

  @override
  State<StepGoalBottomSheetDialog> createState() => _StepGoalBottomSheetDialogState();
}

class _StepGoalBottomSheetDialogState extends State<StepGoalBottomSheetDialog> {
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
      child: Column(
        children: [
          SizedBox(height: 15.setHeight),
          CommonText(
            text: Languages.of(context).txtKeepMovingEachDayToMeetYourStepsGoalAndAvoidSedentaryTime,
            fontSize: 13.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtDarkGray,
          ),
          SizedBox(height: 15.setHeight),
          Stack(
            children: [
              Container(
                height: 0.screenHeight / 5,
                width: 0.screenWidth,
                padding: EdgeInsets.symmetric(horizontal: 0.screenWidth / 2.8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CupertinoPicker(
                        scrollController: _goalController,
                        itemExtent: 50.setHeight,
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
              Positioned(
                left: 0.screenWidth / 3.8,
                bottom: 0,
                top: 0,
                child: Image.asset(
                  AppAssets.icTriangleRight,
                  height: 20.setHeight,
                  width: 20.setHeight,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.setHeight),
          IgnorePointer(
            ignoring: true,
            child: Row(
              children: [
                Expanded(
                  child: CommonButton(
                    text: Languages.of(context).txtCancel,
                    mLeft: 15.setWidth,
                    mRight: 8.setWidth,
                    buttonColor: CustomAppColor.of(context).transparent,
                    buttonTextColor: CustomAppColor.of(context).txtPrimary,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  child: CommonButton(
                    mLeft: 8.setWidth,
                    mRight: 15.setWidth,
                    text: Languages.of(context).txtSave,
                    onTap: () {
                      Navigator.pop(context);
                      widget.onSave();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
