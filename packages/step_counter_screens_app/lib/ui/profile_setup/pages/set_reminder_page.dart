import 'package:flutter/cupertino.dart';
import 'package:step_counter_screens_app_package/utils/app_assets.dart';
import 'package:step_counter_screens_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';

class SetReminderPage extends StatefulWidget {
  const SetReminderPage({super.key});

  @override
  State<SetReminderPage> createState() => _SetReminderPageState();
}

class _SetReminderPageState extends State<SetReminderPage> {
  final ValueNotifier<int> selectedHour = ValueNotifier(10);
  final ValueNotifier<int> selectedMinute = ValueNotifier(0);

  final FixedExtentScrollController _hourController = FixedExtentScrollController(initialItem: 9);
  final FixedExtentScrollController _minuteController = FixedExtentScrollController(initialItem: 0);

  final List<int> hours = List.generate(24, (index) => index + 1);
  final List<int> minutes = List.generate(61, (index) => index);

  @override
  void dispose() {
    _hourController.dispose();
    _minuteController.dispose();
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
              child: Image.asset(AppAssets.icSetupProfileNotification),
            ),
            SizedBox(height: 40.setHeight),
            CommonText(
              text: Languages.of(context).txtSetReminder.toUpperCase(),
              fontSize: 20.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).txtBlack,
              textAlign: TextAlign.center,
            ),
            _buildReminderPicker(),
          ],
        ),
      ),
    );
  }

  Widget _buildReminderPicker() {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30.setHeight),
          child: Container(
            height: 140.setHeight,
            width: 0.screenWidth,
            padding: EdgeInsets.symmetric(horizontal: 0.screenWidth / 3.4),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CupertinoPicker(
                    scrollController: _hourController,
                    itemExtent: 50.setHeight,
                    diameterRatio: 1,
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
                SizedBox(width: 10.setWidth),
                CommonText(
                  text: ":",
                  fontSize: 25.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).primary,
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: 10.setWidth),
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
                              text: minute.toString(),
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
          left: 0.screenWidth / 4.8,
          bottom: 0,
          top: 30.setHeight,
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
