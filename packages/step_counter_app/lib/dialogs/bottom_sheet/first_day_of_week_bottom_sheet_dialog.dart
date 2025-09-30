import 'package:flutter/cupertino.dart';
import 'package:step_counter_app_package/utils/sizer_utils.dart';
import 'package:step_counter_app_package/widgets/button/common_button.dart';
import 'package:step_counter_app_package/widgets/text/common_text.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';

class FirstDayOfWeekBottomSheetDialog extends StatefulWidget {
  const FirstDayOfWeekBottomSheetDialog({super.key, required this.onSave});

  final Function() onSave;

  @override
  State<FirstDayOfWeekBottomSheetDialog> createState() => _FirstDayOfWeekBottomSheetDialogState();
}

class _FirstDayOfWeekBottomSheetDialogState extends State<FirstDayOfWeekBottomSheetDialog> {
  final ValueNotifier<String> selectedDayOfWeek = ValueNotifier("Monday");

  final FixedExtentScrollController _dayOfWeekController = FixedExtentScrollController(initialItem: 1);

  final List<String> _weekDays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];

  @override
  void dispose() {
    _dayOfWeekController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 0.screenHeight / 4.5,
              width: 0.screenWidth,
              padding: EdgeInsets.symmetric(horizontal: 0.screenWidth / 3.5),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CupertinoPicker(
                      scrollController: _dayOfWeekController,
                      itemExtent: 60.setHeight,
                      onSelectedItemChanged: (index) {
                        selectedDayOfWeek.value = _weekDays[index];
                      },
                      selectionOverlay: Container(
                        decoration: BoxDecoration(
                          color: CustomAppColor.of(context).transparent,
                          border: Border.symmetric(
                            horizontal: BorderSide(color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.15)),
                          ),
                        ),
                      ),
                      children: _weekDays.map((day) {
                        return Center(
                          child: ValueListenableBuilder(
                            valueListenable: selectedDayOfWeek,
                            builder: (context, selectedValue, child) {
                              final isSelected = day == selectedValue;
                              return CommonText(
                                text: day,
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
              left: 0.screenWidth / 5.5,
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.setWidth),
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
    );
  }
}
