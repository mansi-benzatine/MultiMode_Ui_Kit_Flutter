import 'package:flutter/cupertino.dart';
import 'package:step_counter_app_package/utils/sizer_utils.dart';
import 'package:step_counter_app_package/widgets/button/common_button.dart';
import 'package:step_counter_app_package/widgets/text/common_text.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';

class DailyReminderBottomSheetDialog extends StatefulWidget {
  const DailyReminderBottomSheetDialog({super.key, required this.onSave});

  final Function() onSave;

  @override
  State<DailyReminderBottomSheetDialog> createState() => _DailyReminderBottomSheetDialogState();
}

class _DailyReminderBottomSheetDialogState extends State<DailyReminderBottomSheetDialog> {
  final ValueNotifier<int> selectedHour = ValueNotifier(10);
  final ValueNotifier<int> selectedMinute = ValueNotifier(0);
  final ValueNotifier<String> selectedUnit = ValueNotifier('AM');

  final FixedExtentScrollController _hourController = FixedExtentScrollController(initialItem: 9);
  final FixedExtentScrollController _minuteController = FixedExtentScrollController(initialItem: 0);
  final FixedExtentScrollController _unitController = FixedExtentScrollController(initialItem: 0);

  final List<int> hours = List.generate(12, (index) => index + 1);
  final List<int> minutes = List.generate(61, (index) => index);
  final List<String> units = ['AM', 'PM'];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _hourController.dispose();
    _minuteController.dispose();
    _unitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15.setHeight),
        Stack(
          children: [
            Container(
              height: 0.screenHeight / 5,
              width: 0.screenWidth,
              padding: EdgeInsets.symmetric(horizontal: 0.screenWidth / 4.5),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CupertinoPicker(
                      scrollController: _hourController,
                      itemExtent: 50.setHeight,
                      onSelectedItemChanged: (index) {
                        selectedHour.value = hours[index];
                      },
                      selectionOverlay: Container(
                        decoration: BoxDecoration(
                          color: CustomAppColor.of(context).transparent,
                          border: Border.symmetric(
                            horizontal: BorderSide(color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.15)),
                          ),
                        ),
                      ),
                      children: hours.map((hour) {
                        return Center(
                          child: ValueListenableBuilder(
                            valueListenable: selectedHour,
                            builder: (context, selectedValue, child) {
                              final isSelected = hour == selectedValue;
                              return CommonText(
                                text: hour.toString(),
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
                  SizedBox(width: 20.setWidth),
                  Expanded(
                    flex: 1,
                    child: CupertinoPicker(
                      scrollController: _minuteController,
                      itemExtent: 50.setHeight,
                      onSelectedItemChanged: (index) {
                        selectedMinute.value = minutes[index];
                      },
                      selectionOverlay: Container(
                        decoration: BoxDecoration(
                          color: CustomAppColor.of(context).transparent,
                          border: Border.symmetric(
                            horizontal: BorderSide(color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.15)),
                          ),
                        ),
                      ),
                      children: minutes.map((minute) {
                        return Center(
                          child: ValueListenableBuilder(
                            valueListenable: selectedMinute,
                            builder: (context, selectedValue, child) {
                              final isSelected = minute == selectedValue;
                              return CommonText(
                                text: "$minute",
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
                  SizedBox(width: 20.setWidth),
                  Expanded(
                    flex: 1,
                    child: CupertinoPicker(
                      scrollController: _unitController,
                      itemExtent: 50.setHeight,
                      onSelectedItemChanged: (index) {
                        selectedUnit.value = units[index];
                      },
                      selectionOverlay: Container(
                        decoration: BoxDecoration(
                          color: CustomAppColor.of(context).transparent,
                          border: Border.symmetric(
                            horizontal: BorderSide(color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.15)),
                          ),
                        ),
                      ),
                      children: units.map((unit) {
                        return Center(
                          child: ValueListenableBuilder(
                            valueListenable: selectedUnit,
                            builder: (context, selectedValue, child) {
                              final isSelected = unit == selectedValue;
                              return CommonText(
                                text: unit,
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
              left: 0.screenWidth / 8,
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
          padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
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
