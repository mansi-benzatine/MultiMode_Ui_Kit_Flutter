import 'package:flutter/cupertino.dart';
import 'package:step_counter_app_package/utils/app_assets.dart';
import 'package:step_counter_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';

class WeightPage extends StatefulWidget {
  const WeightPage({super.key});

  @override
  State<WeightPage> createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
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
              child: Image.asset(AppAssets.icSetupProfileWeight),
            ),
            SizedBox(height: 40.setHeight),
            CommonText(
              text: Languages.of(context).txtWhatIsYourCurrentWeight.toUpperCase(),
              fontSize: 20.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).txtBlack,
              textAlign: TextAlign.center,
            ),
            _buildWeightPicker(),
          ],
        ),
      ),
    );
  }

  Widget _buildWeightPicker() {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30.setHeight),
          child: Container(
            height: 145.setHeight,
            width: 0.screenWidth,
            padding: EdgeInsets.symmetric(horizontal: 0.screenWidth / 3.5),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CupertinoPicker(
                    scrollController: _weightController,
                    itemExtent: 50.setHeight,
                    diameterRatio: 1,
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
                              height: 1.2,
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
                    diameterRatio: 1,
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
        ),
        Positioned(
          left: 0.screenWidth / 6,
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
