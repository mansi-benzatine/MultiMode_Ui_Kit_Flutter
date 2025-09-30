import 'package:flutter/cupertino.dart';
import 'package:step_counter_app_package/utils/app_assets.dart';
import 'package:step_counter_app_package/utils/sizer_utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';

class DOBPage extends StatefulWidget {
  const DOBPage({super.key});

  @override
  State<DOBPage> createState() => _DOBPageState();
}

class _DOBPageState extends State<DOBPage> {
  final List<int> dates = List.generate(31, (index) => index + 1);
  final List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  final List<int> years = List.generate(125, (index) => DateTime.now().year - index);

  final ValueNotifier<int> selectedDate = ValueNotifier(5);
  final ValueNotifier<String> selectedMonth = ValueNotifier('Jun');
  final ValueNotifier<int> selectedYear = ValueNotifier(2000);

  final FixedExtentScrollController _dateController = FixedExtentScrollController(initialItem: 4);
  final FixedExtentScrollController _monthController = FixedExtentScrollController(initialItem: 5);
  final FixedExtentScrollController _yearController = FixedExtentScrollController(initialItem: 25);

  @override
  void dispose() {
    _dateController.dispose();
    _monthController.dispose();
    _yearController.dispose();
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
              child: Image.asset(AppAssets.icSetupProfileDOB),
            ),
            SizedBox(height: 40.setHeight),
            CommonText(
              text: Languages.of(context).txtWhatIsYourDOB.toUpperCase(),
              fontSize: 20.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).txtBlack,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.setHeight),
            _buildDatePicker(),
          ],
        ),
      ),
    );
  }

  Widget _buildDatePicker() {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30.setHeight),
          child: Container(
            height: 110.setHeight,
            width: 0.screenWidth,
            padding: EdgeInsets.symmetric(horizontal: 0.screenWidth / 6),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CupertinoPicker(
                    scrollController: _monthController,
                    itemExtent: 50.setHeight,
                    diameterRatio: 1,
                    onSelectedItemChanged: (index) {
                      selectedMonth.value = months[index];
                    },
                    selectionOverlay: Container(
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).transparent,
                        border: Border.symmetric(
                          horizontal: BorderSide(color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.15)),
                        ),
                      ),
                    ),
                    children: months.map((month) {
                      return Center(
                        child: ValueListenableBuilder(
                          valueListenable: selectedMonth,
                          builder: (context, selectedValue, child) {
                            final isSelected = month == selectedValue;
                            return CommonText(
                              text: month,
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
                    scrollController: _dateController,
                    itemExtent: 50.setHeight,
                    diameterRatio: 1,
                    onSelectedItemChanged: (index) {
                      selectedDate.value = dates[index];
                    },
                    selectionOverlay: Container(
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).transparent,
                        border: Border.symmetric(
                          horizontal: BorderSide(color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.15)),
                        ),
                      ),
                    ),
                    children: dates.map((date) {
                      return Center(
                        child: ValueListenableBuilder(
                          valueListenable: selectedDate,
                          builder: (context, selectedValue, child) {
                            final isSelected = date == selectedValue;
                            return CommonText(
                              text: "$date",
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
                  flex: 2,
                  child: CupertinoPicker(
                    scrollController: _yearController,
                    itemExtent: 50.setHeight,
                    diameterRatio: 1,
                    onSelectedItemChanged: (index) {
                      selectedYear.value = years[index];
                    },
                    selectionOverlay: Container(
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).transparent,
                        border: Border.symmetric(
                          horizontal: BorderSide(color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.15)),
                        ),
                      ),
                    ),
                    children: years.map((year) {
                      return Center(
                        child: ValueListenableBuilder(
                          valueListenable: selectedYear,
                          builder: (context, selectedValue, child) {
                            final isSelected = year == selectedValue;
                            return CommonText(
                              text: "$year",
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
          left: 0.screenWidth / 12,
          bottom: 0,
          top: 20.setHeight,
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
