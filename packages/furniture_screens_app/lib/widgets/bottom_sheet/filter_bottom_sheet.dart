import 'package:flutter/material.dart';
import 'package:furniture_screens_app_package/localization/language/languages.dart';
import 'package:furniture_screens_app_package/utils/app_assets.dart';
import 'package:furniture_screens_app_package/utils/app_color.dart';
import 'package:furniture_screens_app_package/utils/constant.dart';
import 'package:furniture_screens_app_package/utils/sizer_utils.dart';
import 'package:furniture_screens_app_package/widgets/button/common_button.dart';
import 'package:furniture_screens_app_package/widgets/text/common_text.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  RangeValues _priceRange = const RangeValues(0, 15500);
  final List<Color> colors = [
    Colors.black,
    Colors.white,
    Colors.red.shade200,
    Colors.purple.shade200,
    Colors.purple.shade400,
    Colors.purple.shade300,
    Colors.blue.shade200,
    Colors.blue.shade400,
    Colors.green.shade200,
    Colors.greenAccent.shade100,
    Colors.yellow.shade200,
    Colors.orange.shade200,
    Colors.pink.shade200,
  ];
  Color? selectedColor;

  final List<String> categories = ["Sofa", "Bed", "Cupboard", "Lamp", "Vase", "Table", "Chair", "Zulla", "Stool", "Mirror", "Drawer"];
  String? selectedCategory;

  final List<String> stock = ["New & Trending", "In Stock", "Best Seller"];
  String? selectedStock;

  final List<int> ratings = [0, 5, 4, 3, 2, 1];
  int? selectedRating;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      maxChildSize: 0.95,
      minChildSize: 0.6,
      builder: (context, scrollController) {
        return SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).bottomSheetBg,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        text: Languages.of(context).txtFilter,
                        fontSize: 22.setFontSize,
                        fontFamily: Constant.fontFamilyBold700,
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _priceRange = const RangeValues(0, 15500);
                            selectedColor = null;
                            selectedCategory = null;
                            selectedStock = null;
                            selectedRating = null;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 14.setWidth, vertical: 6.setHeight),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(30),
                            ),
                            color: const Color(0xFFD6CAC2).withValues(alpha: 0.3),
                          ),
                          child: CommonText(
                            text: Languages.of(context).txtResetAll,
                            fontSize: 15.setFontSize,
                            fontFamily: Constant.fontFamilySemiBold600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.setHeight),
                  Divider(
                    thickness: 0.5,
                    color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.2),
                  ),
                  SizedBox(height: 10.setHeight),
                  CommonText(
                    text: Languages.of(context).txtPrice,
                    fontSize: 18.setFontSize,
                    fontFamily: Constant.fontFamilyBold700,
                  ),
                  SizedBox(height: 10.setHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        text: "\$${_priceRange.start.toStringAsFixed(0)}",
                        fontFamily: Constant.fontFamilyMedium500,
                        textColor: CustomAppColor.of(context).txtGray,
                      ),
                      CommonText(
                        text: "\$${_priceRange.end.toStringAsFixed(0)}",
                        fontFamily: Constant.fontFamilyMedium500,
                        textColor: CustomAppColor.of(context).txtGray,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.setHeight),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 0.2,
                      overlayShape: SliderComponentShape.noOverlay,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: RangeSlider(
                        values: _priceRange,
                        min: 0,
                        max: 15506,
                        inactiveColor: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.2),
                        activeColor: CustomAppColor.of(context).primary,
                        onChanged: (values) {
                          setState(() {
                            _priceRange = values;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20.setHeight),
                  CommonText(
                    text: Languages.of(context).txtColor,
                    fontSize: 18.setFontSize,
                    fontFamily: Constant.fontFamilyBold700,
                  ),
                  SizedBox(height: 8.setHeight),
                  Wrap(
                    spacing: 8.setWidth,
                    runSpacing: 8,
                    children: colors.map((color) {
                      bool isSelected = selectedColor == color;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColor = color;
                          });
                        },
                        child: Container(
                          width: 40.setWidth,
                          height: 40.setHeight,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                          ),
                          child: isSelected ? Icon(Icons.check, size: 20, color: CustomAppColor.of(context).icBlackWhite) : null,
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20.setHeight),
                  CommonText(
                    text: Languages.of(context).txtCategories,
                    fontSize: 18.setFontSize,
                    fontFamily: Constant.fontFamilyBold700,
                  ),
                  SizedBox(height: 10.setHeight),
                  Wrap(
                    spacing: 8.setWidth,
                    children: categories.map((category) {
                      bool isSelected = selectedCategory == category;
                      return ChoiceChip(
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.symmetric(horizontal: 12.setWidth),
                        label: CommonText(
                          text: category,
                          fontFamily: Constant.fontFamilyMedium500,
                          fontSize: 14.setFontSize,
                          textColor: isSelected ? Colors.white : CustomAppColor.of(context).txtBlack,
                        ),
                        selected: isSelected,
                        showCheckmark: false,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.all(
                            Radius.circular(50),
                          ),
                        ),
                        selectedColor: CustomAppColor.of(context).primary,
                        backgroundColor: CustomAppColor.of(context).bottomSheetBg,
                        onSelected: (_) {
                          setState(() {
                            selectedCategory = category;
                          });
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16.setHeight),
                  CommonText(
                    text: Languages.of(context).txtStock,
                    fontSize: 18.setFontSize,
                    fontFamily: Constant.fontFamilyBold700,
                  ),
                  SizedBox(height: 10.setHeight),
                  Wrap(
                    spacing: 8.setWidth,
                    children: stock.map((s) {
                      bool isSelected = selectedStock == s;
                      return ChoiceChip(
                        padding: EdgeInsets.symmetric(horizontal: 8.setWidth),
                        label: CommonText(
                          text: s,
                          fontFamily: Constant.fontFamilyMedium500,
                          fontSize: 14.setFontSize,
                          textColor: isSelected ? Colors.white : CustomAppColor.of(context).txtBlack,
                        ),
                        selected: isSelected,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.all(
                            Radius.circular(50),
                          ),
                        ),
                        selectedColor: CustomAppColor.of(context).primary,
                        backgroundColor: CustomAppColor.of(context).bottomSheetBg,
                        visualDensity: VisualDensity.compact,
                        showCheckmark: false,
                        onSelected: (_) {
                          setState(() {
                            selectedStock = s;
                          });
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16.setHeight),
                  CommonText(
                    text: Languages.of(context).txtByRating,
                    fontSize: 18.setFontSize,
                    fontFamily: Constant.fontFamilyBold700,
                  ),
                  SizedBox(height: 8.setHeight),
                  Wrap(
                    spacing: 9.setWidth,
                    children: ratings.map((rating) {
                      bool isSelected = selectedRating == rating;
                      return ChoiceChip(
                        label: rating == 0
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    AppAssets.icStar,
                                    height: 16.setHeight,
                                    width: 16.setWidth,
                                  ),
                                  SizedBox(width: 10.setWidth),
                                  CommonText(
                                    text: "All",
                                    fontFamily: Constant.fontFamilyMedium500,
                                    fontSize: 14.setFontSize,
                                    textColor: isSelected ? Colors.white : CustomAppColor.of(context).txtBlack,
                                  ),
                                ],
                              )
                            : Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    AppAssets.icStar,
                                    height: 16.setHeight,
                                    width: 16.setWidth,
                                  ),
                                  SizedBox(width: 10.setWidth),
                                  CommonText(
                                    text: rating.toString(),
                                    fontFamily: Constant.fontFamilyMedium500,
                                    fontSize: 14.setFontSize,
                                    textColor: isSelected ? Colors.white : CustomAppColor.of(context).txtBlack,
                                  ),
                                ],
                              ),
                        showCheckmark: false,
                        padding: EdgeInsets.symmetric(horizontal: 8.setWidth),
                        selected: isSelected,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.all(
                            Radius.circular(50),
                          ),
                        ),
                        visualDensity: VisualDensity.compact,
                        selectedColor: CustomAppColor.of(context).primary,
                        backgroundColor: CustomAppColor.of(context).bottomSheetBg,
                        onSelected: (_) {
                          setState(() {
                            selectedRating = rating;
                          });
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 12.setHeight),
                  Row(
                    children: [
                      Expanded(
                        child: CommonButton(
                          text: Languages.of(context).txtCancel,
                          borderColor: CustomAppColor.of(context).txtGray,
                          buttonColor: CustomAppColor.of(context).bottomSheetBg,
                          buttonTextColor: CustomAppColor.of(context).txtGray,
                        ),
                      ),
                      SizedBox(width: 20.setWidth),
                      Expanded(
                        child: IgnorePointer(
                          ignoring: true,
                          child: CommonButton(
                            text: Languages.of(context).txtApply,
                            onTap: () => Navigator.pop(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

void showFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => const FilterBottomSheet(),
  );
}
