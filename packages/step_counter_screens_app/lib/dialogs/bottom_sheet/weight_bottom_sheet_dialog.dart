import 'package:flutter/cupertino.dart';
import 'package:step_counter_screens_app_package/utils/sizer_utils.dart';
import 'package:step_counter_screens_app_package/widgets/button/common_button.dart';
import 'package:step_counter_screens_app_package/widgets/text/common_text.dart';

import '../../localization/language/languages.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';

class WeightBottomSheetDialog extends StatefulWidget {
  const WeightBottomSheetDialog({super.key, required this.onSave});

  final Function() onSave;

  @override
  State<WeightBottomSheetDialog> createState() => _WeightBottomSheetDialogState();
}

class _WeightBottomSheetDialogState extends State<WeightBottomSheetDialog> {
  final ValueNotifier<int> selectedWeight = ValueNotifier(60);
  final ValueNotifier<String> selectedUnit = ValueNotifier('kg');

  final FixedExtentScrollController _weightController = FixedExtentScrollController(initialItem: 59);
  final FixedExtentScrollController _unitController = FixedExtentScrollController(initialItem: 0);

  final List<String> units = ['kg', 'lbs'];
  final List<int> weights = List.generate(200, (index) => index + 1);

  @override
  void dispose() {
    _weightController.dispose();
    _unitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15.setHeight),
        CommonText(
          text: Languages.of(context).txtCaloriesCalculationNeedsIt,
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
              padding: EdgeInsets.symmetric(horizontal: 0.screenWidth / 3.5),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CupertinoPicker(
                      scrollController: _weightController,
                      itemExtent: 50.setHeight,
                      onSelectedItemChanged: (index) {
                        selectedWeight.value = weights[index];
                      },
                      selectionOverlay: Container(
                        decoration: BoxDecoration(
                          color: CustomAppColor.of(context).transparent,
                          border: Border.symmetric(
                            horizontal: BorderSide(color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.15)),
                          ),
                        ),
                      ),
                      children: weights.map((weight) {
                        return Center(
                          child: ValueListenableBuilder(
                            valueListenable: selectedWeight,
                            builder: (context, selectedValue, child) {
                              final isSelected = weight == selectedValue;
                              return CommonText(
                                text: weight.toString(),
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
              left: 0.screenWidth / 5,
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
    );
  }
}
