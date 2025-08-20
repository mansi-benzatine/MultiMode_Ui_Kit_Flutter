import 'package:car_shop_screens_app_package/widgets/button/common_button.dart';
import 'package:flutter/material.dart';

import '../../localization/language/languages.dart';
import '../../ui/profile_setup/your_fav_brand/view/your_fav_brand_screen.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../utils/sizer_utils.dart';
import '../../widgets/text/common_text.dart';
import '../../widgets/text_field/text_form_field.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  final TextEditingController searchController = TextEditingController();

  int selectedSidebarIndex = 0;
  double minBudget = 0;
  double maxBudget = 5;
  List<bool> budgetRangeChecked = [true, false, false, false, false, false];

  double minModelYear = 2000;
  double maxModelYear = 2025;

  final List<String> sidebarItems = [
    "Budget",
    "Brand",
    "Model Year",
    "Km Driven",
    "Fuel Type",
    "Body Type",
    "Categories",
    "Seats",
    "Discount",
    "Colors",
    "Sorting",
  ];

  final List<String> budgetRangeLabels = [
    "Under 2 Lakh",
    "2-3 Lakh",
    "3-5 Lakh",
    "5-8 Lakh",
    "8-10 Lakh",
    "Above 10 Lakh",
  ];

  final List<YourFavBrandItem> brandLabels = [
    YourFavBrandItem(brandName: "Mercedes", brandImage: AppAssets.icMercedes, isSelected: true),
    YourFavBrandItem(brandName: "Toyota", brandImage: AppAssets.icToyota, isSelected: false),
    YourFavBrandItem(brandName: "Audi", brandImage: AppAssets.icAudi, isSelected: false),
    YourFavBrandItem(brandName: "BMW", brandImage: AppAssets.icBmw, isSelected: false),
    YourFavBrandItem(brandName: "Tesla", brandImage: AppAssets.icTesla, isSelected: false),
    YourFavBrandItem(brandName: "Jaguar", brandImage: AppAssets.icJaguar, isSelected: false),
    YourFavBrandItem(brandName: "Ferrari", brandImage: AppAssets.icFerrari, isSelected: false),
    YourFavBrandItem(brandName: "Lamborghini", brandImage: AppAssets.icLamborghini, isSelected: false),
    YourFavBrandItem(brandName: "Lexus", brandImage: AppAssets.icLexus, isSelected: false),
    YourFavBrandItem(brandName: "Rolls-Royce", brandImage: AppAssets.icAudi, isSelected: false),
    YourFavBrandItem(brandName: "Jeep", brandImage: AppAssets.icAudi, isSelected: false),
    YourFavBrandItem(brandName: "Land Rover", brandImage: AppAssets.icLandRover, isSelected: false),
  ];
  String brandSearchQuery = "";
  TextEditingController brandSearchController = TextEditingController();
  List<YourFavBrandItem> filteredBrandLabels = [];

  @override
  void initState() {
    super.initState();
    filteredBrandLabels = brandLabels;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.7,
        ),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgBottomSheet,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: CustomAppColor.of(context).containerBorder,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: Languages.of(context).txtFilter,
                    fontSize: 16.setFontSize,
                    fontWeight: FontWeight.w600,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).bgSearchBar,
                        borderRadius: BorderRadius.circular(8.setWidth),
                      ),
                      height: 30.setHeight,
                      width: 30.setWidth,
                      child: Center(
                        child: Icon(
                          Icons.close,
                          size: 20.setWidth,
                          color: CustomAppColor.of(context).txtBlack,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sidebar
                  _buildSidebar(),
                  // Main Content
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                      child: _buildMainContent(),
                    ),
                  ),
                ],
              ),
            ),

            // Bottom Buttons
            Container(
              padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, bottom: 35.setHeight, top: 20.setHeight),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: CustomAppColor.of(context).containerBorder,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      text: Languages.of(context).txtClearAll,
                      buttonTextColor: CustomAppColor.of(context).txtGray,
                      height: 45.setHeight,
                      buttonGradient: LinearGradient(
                        colors: [
                          CustomAppColor.of(context).transparent,
                          CustomAppColor.of(context).transparent,
                        ],
                      ),
                      buttonTextWeight: FontWeight.w500,
                      borderColor: CustomAppColor.of(context).containerBorder,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(width: 16.setWidth),
                  Expanded(
                    child: CommonButton(
                      text: Languages.of(context).txtApply,
                      height: 45.setHeight,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSidebar() {
    return Container(
      width: 120.setWidth,
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).transparent,
        border: Border(
          right: BorderSide(
            color: CustomAppColor.of(context).containerBorder,
            width: 1,
          ),
        ),
      ),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: sidebarItems.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedSidebarIndex == index;
          return GestureDetector(
            onTap: () {
              // Dismiss keyboard when switching tabs
              FocusScope.of(context).unfocus();
              setState(() {
                selectedSidebarIndex = index;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.setWidth,
                vertical: 10.setHeight,
              ),
              decoration: BoxDecoration(
                color: isSelected ? CustomAppColor.of(context).bgFilterSelectionType : CustomAppColor.of(context).transparent,
                border: Border(
                  bottom: BorderSide(
                    color: CustomAppColor.of(context).containerBorder,
                    width: 1,
                  ),
                ),
              ),
              child: CommonText(
                text: sidebarItems[index],
                fontSize: 12.setFontSize,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                textColor: isSelected ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).txtGray,
                textAlign: TextAlign.left,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMainContent() {
    switch (selectedSidebarIndex) {
      case 0: // Budget
        return _buildBudgetContent();
      case 1: // Brand
        return _buildBrandContent();
      case 2: // Model Year
        return _buildModelYearContent();
      default:
        return Center(
          child: CommonText(
            text: "Content for ${sidebarItems[selectedSidebarIndex]}",
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtGray,
          ),
        );
    }
  }

  Widget _buildBudgetContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 15.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Budget Title
          CommonText(
            text: Languages.of(context).txtBudget,
            fontSize: 12.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
          ),

          SizedBox(height: 8.setHeight),

          // Budget Range
          CommonText(
            text: "0-5 Million",
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).primary,
            textAlign: TextAlign.start,
            letterSpacing: 0.2,
          ),

          // Slider
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 3.setHeight,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
              activeTrackColor: CustomAppColor.of(context).primary,
              inactiveTrackColor: CustomAppColor.of(context).containerBorder,
              thumbColor: CustomAppColor.of(context).primary,
              valueIndicatorColor: CustomAppColor.of(context).primary,
              overlayColor: CustomAppColor.of(context).primary.withValues(alpha: 0.1),
            ),
            child: RangeSlider(
              values: RangeValues(minBudget, maxBudget),
              min: 0,
              max: 5,
              divisions: 50,
              onChanged: (RangeValues values) {
                setState(() {
                  minBudget = values.start;
                  maxBudget = values.end;
                });
              },
            ),
          ),

          // Slider Labels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 5.setHeight),
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).txtBlack,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: CommonText(
                  text: "${minBudget.toInt()} Lakh",
                  fontSize: 10.setFontSize,
                  fontWeight: FontWeight.w500,
                  textColor: CustomAppColor.of(context).txtWhite,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 5.setHeight),
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).txtBlack,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: CommonText(
                  text: "${maxBudget.toInt()} Lakh",
                  fontSize: 10.setFontSize,
                  fontWeight: FontWeight.w500,
                  textColor: CustomAppColor.of(context).txtWhite,
                ),
              ),
            ],
          ),

          SizedBox(height: 20.setHeight),

          // What Is Your Range?
          CommonText(
            text: Languages.of(context).txtWhatIsYourRange,
            fontSize: 12.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
          ),

          SizedBox(height: 10.setHeight),

          // Checkbox Options
          ...List.generate(budgetRangeLabels.length, (index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 7.setHeight),
              child: Row(
                children: [
                  SizedBox(
                    width: 12.setWidth,
                    height: 12.setHeight,
                    child: Checkbox(
                      value: budgetRangeChecked[index],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      onChanged: (bool? value) {
                        setState(() {
                          budgetRangeChecked[index] = value ?? false;
                        });
                      },
                      activeColor: CustomAppColor.of(context).primary,
                      checkColor: CustomAppColor.of(context).txtWhite,
                      side: BorderSide(
                        color: CustomAppColor.of(context).containerBorder,
                        width: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.setWidth),
                  CommonText(
                    text: budgetRangeLabels[index],
                    fontSize: 12.setFontSize,
                    fontWeight: FontWeight.w400,
                    textColor: CustomAppColor.of(context).txtBlack,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildBrandContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 15.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Brand Title
          CommonText(
            text: Languages.of(context).txtBrand,
            fontSize: 12.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
          ),

          SizedBox(height: 8.setHeight),

          // Brand Search Input
          CommonTextFormFieldWithPrefixAndSuffix(
            controller: searchController,
            prefixIcon: AppAssets.icSearch,
            hintText: Languages.of(context).txtSearch,
            suffixIcon: AppAssets.icClose,
            fillColor: CustomAppColor.of(context).bgSearchBarDialog,
            hintTextColor: CustomAppColor.of(context).txtDarkGray,
            prefixIconColor: CustomAppColor.of(context).txtDarkGray,
            suffixIconColor: CustomAppColor.of(context).txtDarkGray,
            borderColor: CustomAppColor.of(context).transparent,
            prefixIconSize: 12.setWidth,
            suffixIconSize: 12.setWidth,
            fontSize: 12.setFontSize,
            hintFontSize: 12.setFontSize,
            labelFontSize: 12.setFontSize,
            contentPadding: EdgeInsets.only(
              top: 0.setHeight,
              bottom: 0.setHeight,
              right: 10.setWidth,
              left: 10.setWidth,
            ),
            radius: 10,
            onSuffixClick: () {
              setState(() {
                brandSearchController.clear();
              });
            },
            onTextChanged: (value) {
              if (value.isEmpty) {
                setState(() {
                  filteredBrandLabels = brandLabels;
                });
              } else {
                setState(() {
                  brandSearchQuery = value;
                  filteredBrandLabels = brandLabels.where((element) => element.brandName.toLowerCase().contains(brandSearchQuery.toLowerCase())).toList();
                });
              }
            },
          ),

          SizedBox(height: 15.setHeight),

          ...List.generate(filteredBrandLabels.length, (index) {
            return _buildBrandCheckbox(filteredBrandLabels[index], index);
          }),
        ],
      ),
    );
  }

  Widget _buildBrandCheckbox(YourFavBrandItem brand, int index) {
    final bool isChecked = brand.isSelected;
    final String brandName = brand.brandName;
    return Padding(
      padding: EdgeInsets.only(bottom: 10.setHeight),
      child: Row(
        children: [
          SizedBox(
            width: 20.setWidth,
            height: 12.setHeight,
            child: Checkbox(
              value: isChecked,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              onChanged: (bool? value) {
                setState(() {
                  filteredBrandLabels[index].isSelected = value ?? false;
                });
              },
              activeColor: CustomAppColor.of(context).primary,
              checkColor: CustomAppColor.of(context).txtWhite,
              side: BorderSide(
                color: CustomAppColor.of(context).containerBorder,
                width: 1.5,
              ),
            ),
          ),
          SizedBox(width: 10.setWidth),
          CommonText(
            text: brandName,
            fontSize: 12.setFontSize,
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  Widget _buildModelYearContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 15.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtModelYear,
            fontSize: 12.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
          ),

          SizedBox(height: 8.setHeight),

          // Slider
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 3.setHeight,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
              activeTrackColor: CustomAppColor.of(context).primary,
              inactiveTrackColor: CustomAppColor.of(context).containerBorder,
              thumbColor: CustomAppColor.of(context).primary,
              valueIndicatorColor: CustomAppColor.of(context).primary,
              overlayColor: CustomAppColor.of(context).primary.withValues(alpha: 0.1),
            ),
            child: RangeSlider(
              values: RangeValues(minModelYear, maxModelYear),
              min: 2000,
              max: 2025,
              divisions: 50,
              onChanged: (RangeValues values) {
                setState(() {
                  minModelYear = values.start;
                  maxModelYear = values.end;
                });
              },
            ),
          ),

          // Slider Labels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 5.setHeight),
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).txtBlack,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: CommonText(
                  text: "${minModelYear.toInt()}",
                  fontSize: 10.setFontSize,
                  fontWeight: FontWeight.w500,
                  textColor: CustomAppColor.of(context).txtWhite,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 5.setHeight),
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).txtBlack,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: CommonText(
                  text: "${maxModelYear.toInt()}",
                  fontSize: 10.setFontSize,
                  fontWeight: FontWeight.w500,
                  textColor: CustomAppColor.of(context).txtWhite,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
