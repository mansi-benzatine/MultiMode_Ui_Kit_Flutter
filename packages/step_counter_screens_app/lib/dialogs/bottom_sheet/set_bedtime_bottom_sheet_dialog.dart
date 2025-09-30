import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_counter_screens_app_package/utils/sizer_utils.dart';
import 'package:step_counter_screens_app_package/widgets/button/common_button.dart';
import 'package:step_counter_screens_app_package/widgets/text/common_text.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';

class SetBedTimeBottomSheetDialog extends StatefulWidget {
  const SetBedTimeBottomSheetDialog({super.key, required this.onSave, required this.isBedTime});

  final Function(bool isBedTime, int hour, int minute, String unit) onSave;
  final bool isBedTime;

  @override
  State<SetBedTimeBottomSheetDialog> createState() => _SetBedTimeBottomSheetDialogState();
}

class _SetBedTimeBottomSheetDialogState extends State<SetBedTimeBottomSheetDialog> {
  final ValueNotifier<int> selectedHour = ValueNotifier(10);
  final ValueNotifier<int> selectedMinute = ValueNotifier(0);
  final ValueNotifier<String> selectedUnit = ValueNotifier('AM');

  final FixedExtentScrollController _hourController = FixedExtentScrollController(initialItem: 9);
  final FixedExtentScrollController _minuteController = FixedExtentScrollController(initialItem: 0);
  final FixedExtentScrollController _unitController = FixedExtentScrollController(initialItem: 0);

  final List<int> hours = List.generate(12, (index) => index + 1);
  final List<int> minutes = List.generate(61, (index) => index);
  final List<String> units = ['AM', 'PM'];

  ValueNotifier<bool> isBedTime = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    isBedTime.value = widget.isBedTime;
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
        ValueListenableBuilder(
          valueListenable: isBedTime,
          builder: (context, value, child) {
            return Container(
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).bgContainerBorderColorSleep.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(1000),
                border: Border.all(
                  color: CustomAppColor.of(context).bgContainerBorderColorSleep,
                  width: 0.4,
                ),
              ),
              margin: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: IgnorePointer(
                ignoring: true,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          isBedTime.value = true;
                        },
                        child: Container(
                          height: 50.setHeight,
                          decoration: BoxDecoration(
                            color: value ? CustomAppColor.of(context).colorTimes : CustomAppColor.of(context).transparent,
                            borderRadius: BorderRadius.circular(1000),
                            border: Border.all(color: value ? CustomAppColor.of(context).colorTimes : CustomAppColor.of(context).transparent),
                          ),
                          alignment: Alignment.center,
                          child: CommonText(
                            text: Languages.of(context).txtBedTime,
                            fontSize: 16.setFontSize,
                            fontWeight: FontWeight.w600,
                            textColor: value ? CustomAppColor.of(context).white : CustomAppColor.of(context).colorTimes,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          isBedTime.value = false;
                        },
                        child: Container(
                          height: 50.setHeight,
                          decoration: BoxDecoration(
                            color: !value ? CustomAppColor.of(context).colorTimes : CustomAppColor.of(context).transparent,
                            borderRadius: BorderRadius.circular(1000),
                            border: Border.all(color: !value ? CustomAppColor.of(context).colorTimes : CustomAppColor.of(context).transparent),
                          ),
                          alignment: Alignment.center,
                          child: CommonText(
                            text: "Wakeup Time",
                            fontSize: 16.setFontSize,
                            fontWeight: FontWeight.w600,
                            textColor: !value ? CustomAppColor.of(context).white : CustomAppColor.of(context).colorTimes,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        SizedBox(height: 15.setHeight),
        ValueListenableBuilder(
          valueListenable: isBedTime,
          builder: (context, value, child) {
            return Stack(
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
                                    textColor: isSelected ? CustomAppColor.of(context).colorTimes : CustomAppColor.of(context).txtGray,
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
                                    textColor: isSelected ? CustomAppColor.of(context).colorTimes : CustomAppColor.of(context).txtGray,
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
                                    textColor: isSelected ? CustomAppColor.of(context).colorTimes : CustomAppColor.of(context).txtGray,
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
                    color: CustomAppColor.of(context).colorTimes,
                  ),
                ),
              ],
            );
          },
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
                  buttonTextColor: CustomAppColor.of(context).colorTimes,
                  borderColor: CustomAppColor.of(context).colorTimes,
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
                  buttonColor: CustomAppColor.of(context).colorTimes,
                  borderColor: CustomAppColor.of(context).colorTimes,
                  onTap: () {
                    Navigator.pop(context);
                    widget.onSave(
                      isBedTime.value,
                      selectedHour.value,
                      selectedMinute.value,
                      selectedUnit.value,
                    );
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
