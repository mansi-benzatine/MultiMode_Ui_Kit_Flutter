import 'package:flutter/cupertino.dart';
import 'package:step_counter_app_package/utils/app_assets.dart';
import 'package:step_counter_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';

class HeightPage extends StatefulWidget {
  const HeightPage({super.key});

  @override
  State<HeightPage> createState() => _HeightPageState();
}

class _HeightPageState extends State<HeightPage> {
  final ValueNotifier<int> selectedHeightInFeet = ValueNotifier(5);
  final ValueNotifier<int> selectedHeightInInches = ValueNotifier(11);

  final FixedExtentScrollController _heightController = FixedExtentScrollController(initialItem: 4);
  final FixedExtentScrollController _unitController = FixedExtentScrollController(initialItem: 10);

  final List<int> heightsInFeet = List.generate(50, (index) => index + 1);
  final List<int> heightsInInches = List.generate(11, (index) => index + 1);

  @override
  void dispose() {
    _heightController.dispose();
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
              child: Image.asset(AppAssets.icSetupProfileHeight),
            ),
            SizedBox(height: 40.setHeight),
            CommonText(
              text: Languages.of(context).txtWhatIsYourCurrentHeight.toUpperCase(),
              fontSize: 20.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).txtBlack,
              textAlign: TextAlign.center,
            ),
            _buildHeightPicker(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeightPicker() {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 50.setHeight),
          child: Container(
            height: 125.setHeight,
            width: 0.screenWidth,
            padding: EdgeInsets.symmetric(horizontal: 0.screenWidth / 4),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CupertinoPicker(
                    scrollController: _heightController,
                    itemExtent: 50.setHeight,
                    diameterRatio: 1,
                    onSelectedItemChanged: (index) {
                      selectedHeightInFeet.value = heightsInFeet[index];
                    },
                    selectionOverlay: Container(
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).transparent,
                        border: Border.symmetric(
                          horizontal: BorderSide(color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.15)),
                        ),
                      ),
                    ),
                    children: heightsInFeet.map((height) {
                      return Center(
                        child: ValueListenableBuilder(
                          valueListenable: selectedHeightInFeet,
                          builder: (context, selectedValue, child) {
                            final isSelected = height == selectedValue;
                            return CommonText(
                              text: "$height Ft",
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
                      selectedHeightInInches.value = heightsInInches[index];
                    },
                    selectionOverlay: Container(
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).transparent,
                        border: Border.symmetric(
                          horizontal: BorderSide(color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.15)),
                        ),
                      ),
                    ),
                    children: heightsInInches.map((height) {
                      return Center(
                        child: ValueListenableBuilder(
                          valueListenable: selectedHeightInInches,
                          builder: (context, selectedValue, child) {
                            final isSelected = height == selectedValue;
                            return CommonText(
                              text: "$height In",
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
          top: 50.setHeight,
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
