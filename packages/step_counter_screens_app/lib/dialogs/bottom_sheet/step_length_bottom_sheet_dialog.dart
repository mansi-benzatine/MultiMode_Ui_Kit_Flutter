import 'package:flutter/cupertino.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:step_counter_screens_app_package/utils/debug.dart';
import 'package:step_counter_screens_app_package/utils/sizer_utils.dart';
import 'package:step_counter_screens_app_package/widgets/button/common_button.dart';
import 'package:step_counter_screens_app_package/widgets/text/common_text.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';

class StepLengthBottomSheetDialog extends StatefulWidget {
  const StepLengthBottomSheetDialog({super.key, required this.onSave});

  final Function() onSave;

  @override
  State<StepLengthBottomSheetDialog> createState() => _StepLengthBottomSheetDialogState();
}

class _StepLengthBottomSheetDialogState extends State<StepLengthBottomSheetDialog> {
  final ValueNotifier<int> selectedLengthInCentimeters = ValueNotifier(150);

  final FixedExtentScrollController _cmLengthController = FixedExtentScrollController(initialItem: 149);

  final ValueNotifier<bool> isAutomaticCalculation = ValueNotifier<bool>(false);

  final List<int> stepLengthInCentimeters = List.generate(250, (index) => index + 1);

  @override
  void dispose() {
    _cmLengthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15.setHeight),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
          child: CommonText(
            text: Languages.of(context).txtYourStepLengthIsAbout04YourHeight,
            fontSize: 13.setFontSize,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.start,
            textColor: CustomAppColor.of(context).txtDarkGray,
          ),
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
                      scrollController: _cmLengthController,
                      itemExtent: 50.setHeight,
                      onSelectedItemChanged: (index) {
                        selectedLengthInCentimeters.value = stepLengthInCentimeters[index];
                      },
                      selectionOverlay: Container(
                        decoration: BoxDecoration(
                          color: CustomAppColor.of(context).transparent,
                          border: Border.symmetric(
                            horizontal: BorderSide(color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.15)),
                          ),
                        ),
                      ),
                      children: stepLengthInCentimeters.map((height) {
                        return Center(
                          child: ValueListenableBuilder(
                            valueListenable: selectedLengthInCentimeters,
                            builder: (context, selectedValue, child) {
                              final isSelected = height == selectedValue;
                              return CommonText(
                                text: "$height cm",
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
        Container(
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgContainerWhiteAndBlack,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: CustomAppColor.of(context).borderColor),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20.setWidth),
          padding: EdgeInsets.symmetric(vertical: 15.setHeight, horizontal: 15.setWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CommonText(
                      text: "68 Cm",
                      fontSize: 18.setFontSize,
                      fontWeight: FontWeight.w700,
                      textColor: CustomAppColor.of(context).txtBlack,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: isAutomaticCalculation,
                    builder: (context, value, child) {
                      return FlutterSwitch(
                        value: value,
                        onToggle: (bool newValue) {
                          isAutomaticCalculation.value = newValue;
                          Debug.printLoge("isAutomaticCalculation.value", "${isAutomaticCalculation.value}");
                        },
                        activeColor: CustomAppColor.of(context).primary,
                        inactiveColor: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.1),
                        activeToggleColor: CustomAppColor.of(context).white,
                        inactiveToggleColor: CustomAppColor.of(context).white,
                        width: 40.setWidth,
                        height: 22.setHeight,
                        toggleSize: 18.0,
                        borderRadius: 16.0,
                        padding: 3.5,
                      );
                    },
                  )
                ],
              ),
              SizedBox(height: 5.setHeight),
              CommonText(
                text: Languages.of(context).txtAutomaticallyCalculateBasedOnYourHeight,
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w500,
                textColor: CustomAppColor.of(context).txtDarkGray,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
        SizedBox(height: 20.setHeight),
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
