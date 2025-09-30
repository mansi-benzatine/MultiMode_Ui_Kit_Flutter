import 'package:flutter/material.dart';
import 'package:step_counter_screens_app_package/utils/sizer_utils.dart';
import 'package:step_counter_screens_app_package/widgets/button/common_button.dart';
import 'package:step_counter_screens_app_package/widgets/text/common_text.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_color.dart';

class RepeatBottomSheetDialog extends StatefulWidget {
  const RepeatBottomSheetDialog({super.key, required this.onSave});

  final Function() onSave;

  @override
  State<RepeatBottomSheetDialog> createState() => _RepeatBottomSheetDialogState();
}

class _RepeatBottomSheetDialogState extends State<RepeatBottomSheetDialog> {
  final List<String> daysOfWeekInWord = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

  final ValueNotifier<List<String>> selectedDaysList = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder(
          valueListenable: selectedDaysList,
          builder: (context, value, child) {
            return Padding(
              padding: EdgeInsets.only(left: 25.setWidth, right: 20.setWidth, top: 10.setHeight, bottom: 5.setHeight),
              child: Column(
                children: List.generate(
                  daysOfWeekInWord.length,
                  (index) => InkWell(
                    onTap: () {
                      if (selectedDaysList.value.contains(daysOfWeekInWord[index])) {
                        selectedDaysList.value.remove(daysOfWeekInWord[index]);
                      } else {
                        selectedDaysList.value.add(daysOfWeekInWord[index]);
                      }
                      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                      selectedDaysList.notifyListeners();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 4.setHeight),
                      child: Row(
                        children: [
                          Container(
                            height: 18.setHeight,
                            width: 18.setHeight,
                            decoration: BoxDecoration(
                              color: value.contains(daysOfWeekInWord[index]) ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgContainerWhiteAndBlack,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: value.contains(daysOfWeekInWord[index]) ? CustomAppColor.of(context).primary : CustomAppColor.of(context).borderColor,
                                width: 2,
                              ),
                            ),
                            child: value.contains(daysOfWeekInWord[index])
                                ? Icon(
                                    Icons.check_rounded,
                                    color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
                                    size: 12.setHeight,
                                  )
                                : null,
                          ),
                          SizedBox(width: 15.setWidth),
                          Expanded(
                            child: CommonText(
                              text: daysOfWeekInWord[index],
                              fontWeight: FontWeight.w500,
                              fontSize: 16.setFontSize,
                              textColor: value.contains(daysOfWeekInWord[index]) ? CustomAppColor.of(context).txtPrimary : CustomAppColor.of(context).txtDarkGray,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        SizedBox(height: 15.setHeight),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.setWidth),
          child: IgnorePointer(
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
        ),
      ],
    );
  }
}
