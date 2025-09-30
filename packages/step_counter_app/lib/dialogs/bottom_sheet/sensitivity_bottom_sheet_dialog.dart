import 'package:flutter/material.dart';
import 'package:step_counter_app_package/utils/sizer_utils.dart';
import 'package:step_counter_app_package/widgets/button/common_button.dart';
import 'package:step_counter_app_package/widgets/text/common_text.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_color.dart';

class SensitivityBottomSheetDialog extends StatefulWidget {
  const SensitivityBottomSheetDialog({super.key, required this.onSave});

  final Function() onSave;

  @override
  State<SensitivityBottomSheetDialog> createState() => _SensitivityBottomSheetDialogState();
}

class _SensitivityBottomSheetDialogState extends State<SensitivityBottomSheetDialog> {
  final ValueNotifier<double> _sensitivityNotifier = ValueNotifier<double>(1);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
      child: Column(
        children: [
          SizedBox(height: 15.setHeight),
          CommonText(
            text: Languages.of(context).txtHighSensitivityMeansSmallMovementsWillBeCountedAsSteps,
            fontSize: 13.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtDarkGray,
          ),
          SizedBox(height: 20.setHeight),
          ValueListenableBuilder(
            valueListenable: _sensitivityNotifier,
            builder: (context, value, child) {
              return SizedBox(
                width: 0.screenWidth,
                child: Theme(
                  data: ThemeData(
                    sliderTheme: SliderThemeData(
                      overlayColor: CustomAppColor.of(context).primary,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 14.setHeight),
                      tickMarkShape: const RoundSliderTickMarkShape(tickMarkRadius: 0),
                      trackHeight: 14.setHeight,
                    ),
                  ),
                  child: Slider(
                    value: value,
                    max: 3,
                    min: 1,
                    divisions: 2,
                    activeColor: CustomAppColor.of(context).primary,
                    thumbColor: CustomAppColor.of(context).primary,
                    inactiveColor: CustomAppColor.of(context).borderColor,
                    semanticFormatterCallback: (value) {
                      return value.round().toString();
                    },
                    onChanged: (value) {
                      _sensitivityNotifier.value = value;
                    },
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 5.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: Row(
              children: [
                CommonText(
                  text: Languages.of(context).txtLow,
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
                Expanded(
                  child: CommonText(
                    text: Languages.of(context).txtMedium,
                    fontSize: 14.setFontSize,
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                ),
                CommonText(
                  text: Languages.of(context).txtHeigh,
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
              ],
            ),
          ),
          SizedBox(height: 30.setHeight),
          Row(
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
        ],
      ),
    );
  }
}
