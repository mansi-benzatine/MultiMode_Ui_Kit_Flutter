import 'dart:io';

import 'package:car_shop_screens_app_package/utils/sizer_utils.dart';
import 'package:car_shop_screens_app_package/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../dialogs/bottom_sheet/sell_car_detail_confirmation_bottom_sheet.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../profile_setup/your_fav_brand/view/your_fav_brand_screen.dart';

// Custom dashed border painter
class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;
  final double borderRadius;

  DashedBorderPainter({
    required this.color,
    this.strokeWidth = 1.0,
    this.dashWidth = 5.0,
    this.dashSpace = 3.0,
    this.borderRadius = 0.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path();
    if (borderRadius > 0) {
      path.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Radius.circular(borderRadius),
      ));
    } else {
      path.addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    }

    _drawDashedPath(canvas, path, paint);
  }

  void _drawDashedPath(Canvas canvas, Path path, Paint paint) {
    final pathMetrics = path.computeMetrics();
    for (final pathMetric in pathMetrics) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        final nextDistance = distance + dashWidth;
        final extractPath = pathMetric.extractPath(
          distance,
          nextDistance > pathMetric.length ? pathMetric.length : nextDistance,
        );
        canvas.drawPath(extractPath, paint);
        distance = nextDistance + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class EnterCarDetailScreen extends StatefulWidget {
  final int currentIndex;
  final bool isForAlert;
  final bool isShownZipCode;

  static Route<void> route({bool isForAlert = false, int currentIndex = 0, bool isShownZipCode = false}) {
    return MaterialPageRoute(
        builder: (_) => EnterCarDetailScreen(
              isForAlert: isForAlert,
              currentIndex: currentIndex,
              isShownZipCode: isShownZipCode,
            ));
  }

  const EnterCarDetailScreen({super.key, this.isForAlert = false, this.currentIndex = 0, this.isShownZipCode = false});

  @override
  State<EnterCarDetailScreen> createState() => _EnterCarDetailScreenState();
}

class _EnterCarDetailScreenState extends State<EnterCarDetailScreen> with TickerProviderStateMixin implements TopBarClickListener {
  late TabController _tabController;
  int selectedIndex = 0;

  List<String> tabList = ["Brand", "Year", "Model", "Variant", "State", "kms driven", "Location", "Price", "Photos"];

  String selectedBrand = "";
  String selectedYear = "";
  String selectedModel = "";
  String selectedVariant = "";
  String selectedState = "";
  String selectedKmsDriven = "";
  String selectedLocation = "";
  String selectedPrice = "";
  String selectedPhotos = "";
  bool _isBottomSheetOpen = false;

  @override
  initState() {
    super.initState();
    _tabController = TabController(initialIndex: widget.currentIndex, length: tabList.length, vsync: this);

    selectedIndex = widget.currentIndex;
    _tabController.addListener(() {
      setState(() {
        selectedIndex = widget.currentIndex;
      });
    });

    if (widget.isForAlert) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showInterestedBottomSheet();
      });
    }
  }

  void _showInterestedBottomSheet() {
    setState(() {
      _isBottomSheetOpen = true;
    });
    showModalBottomSheet(
      isScrollControlled: false,
      isDismissible: false,
      enableDrag: false,
      context: context,
      builder: (dialogContext) => SellCarDetailConfirmationBottomSheet(
        parentContext: dialogContext,
      ),
    ).whenComplete(() {
      if (_isBottomSheetOpen) {
        setState(() {
          _isBottomSheetOpen = false;
        });
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !_isBottomSheetOpen,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && _isBottomSheetOpen) {
          Navigator.pop(context);
          setState(() {
            _isBottomSheetOpen = false;
          });
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: SafeArea(
          child: Column(
            children: [
              TopBar(
                this,
                title: Languages.of(context).txtSellCar,
                isShowBack: true,
              ),
              SizedBox(height: 10.setHeight),
              IgnorePointer(
                ignoring: true,
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.setWidth),
                    color: CustomAppColor.of(context).transparent,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: EdgeInsets.zero,
                  dividerColor: Colors.transparent,
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  labelPadding: EdgeInsets.only(right: 10.setWidth),
                  padding: EdgeInsets.only(
                    left: 16.setWidth,
                  ),
                  labelColor: CustomAppColor.of(context).txtWhite,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                      _tabController.animateTo(index);
                    });
                  },
                  tabs: List.generate(
                    tabList.length,
                    (index) => Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: (selectedIndex > index) ? CustomAppColor.of(context).primary.withOpacityPercent(0.1) : null,
                        borderRadius: BorderRadius.circular(25.setWidth),
                        gradient: selectedIndex == index ? CustomAppColor.of(context).primaryGradient : null,
                        border: Border.all(
                          color: (selectedIndex > index) ? CustomAppColor.of(context).primary : CustomAppColor.of(context).containerBorder,
                          width: 0.5,
                        ),
                      ),
                      height: 35.setHeight,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.setWidth,
                      ),
                      child: CommonText(
                        text: tabList[index],
                        textColor: selectedIndex == index ? CustomAppColor.of(context).tabSelectedTxtColor : CustomAppColor.of(context).tabTxtColor,
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _brandSelection(),
                    _yearSelection(),
                    _modelSelection(),
                    _variantSelection(),
                    _stateSelection(),
                    _kmsDrivenSelection(),
                    _locationSelection(),
                    _priceSelection(),
                    _photosSelection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _brandSelection() {
    return BrandSelection(onBrandSelected: (brand) {
      // _tabController.animateTo(1);
      selectedBrand = brand.brandName;
    });
  }

  Widget _yearSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 15.setHeight),
          child: CommonText(
            text: Languages.of(context).txtSelectYourCarRegistrationYear,
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            itemCount: 50, // 2025 to 2013
            itemBuilder: (context, index) {
              int year = 2025 - index;
              bool isSelected = selectedYear.isNotEmpty && (year == int.parse(selectedYear)); // 2020 is selected as shown in image

              return GestureDetector(
                onTap: () {
                  // Handle year selection
                  selectedYear = year.toString();
                  Future.delayed(const Duration(milliseconds: 200), () {
                    // _tabController.animateTo(2);
                  });
                  // Move to next tab (Model)
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 1.setHeight),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.setWidth,
                    vertical: 12.setHeight,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? CustomAppColor.of(context).primary.withValues(alpha: 0.1) : null,
                    border: Border(
                      bottom: BorderSide(
                        color: CustomAppColor.of(context).containerBorder,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: CommonText(
                    text: year.toString(),
                    fontSize: 12.setFontSize,
                    fontWeight: FontWeight.w400,
                    textColor: isSelected ? CustomAppColor.of(context).txtCarYearSelection : CustomAppColor.of(context).txtBlack,
                    textAlign: TextAlign.start,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _modelSelection() {
    return ModelSelection(
        onModelSelected: (model) {
          // _tabController.animateTo(3);
          selectedModel = model;
          // Move to next tab (Variant)
        },
        selectedModel: selectedModel);
  }

  Widget _variantSelection() {
    return VariantSelection(onVariantSelected: (variant) {
      // _tabController.animateTo(4); // Move to next tab (State)
      selectedVariant = variant;
    });
  }

  Widget _stateSelection() {
    return StateSelection(
      onStateSelected: (state) {
        // _tabController.animateTo(5); // Move to next tab (kms driven)
        selectedState = state;
      },
      isShowZipCodes: widget.isShownZipCode,
    );
  }

  Widget _kmsDrivenSelection() {
    return KmsDrivenSelection(onKmsDrivenSelected: (kmsDriven) {
      // _tabController.animateTo(6); // Move to next tab (Location)
      selectedKmsDriven = kmsDriven;
    });
  }

  Widget _locationSelection() {
    return LocationSelection(onLocationSelected: (location) {
      // _tabController.animateTo(7); // Move to next tab (Price)
      selectedLocation = location;
    });
  }

  Widget _priceSelection() {
    return PriceSelection(onPriceSelected: (price) {
      // _tabController.animateTo(8); // Move to next tab (Photos)
      selectedPrice = price;
    });
  }

  Widget _photosSelection() {
    return PhotosSelection(onPhotosSelected: (photos) {
      // Final step - photos uploaded
      // selectedPhotos = photos;
      // showModalBottomSheet(context: context, builder: (dialogContext) => const SellCarDetailConfirmationBottomSheet());
    });
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}

class BrandSelection extends StatefulWidget {
  final Function(YourFavBrandItem) onBrandSelected;
  const BrandSelection({super.key, required this.onBrandSelected});

  @override
  State<BrandSelection> createState() => _BrandSelectionState();
}

class _BrandSelectionState extends State<BrandSelection> {
  List<YourFavBrandItem> yourFavBrandList = [
    YourFavBrandItem(brandName: "Mercedes", brandImage: AppAssets.icMercedes, isSelected: false),
    YourFavBrandItem(brandName: "Toyota", brandImage: AppAssets.icToyota, isSelected: false),
    YourFavBrandItem(brandName: "Audi", brandImage: AppAssets.icAudi, isSelected: false),
    YourFavBrandItem(brandName: "BMW", brandImage: AppAssets.icBmw, isSelected: false),
    YourFavBrandItem(brandName: "Tesla", brandImage: AppAssets.icTesla, isSelected: false),
    YourFavBrandItem(brandName: "Jaguar", brandImage: AppAssets.icJaguar, isSelected: false),
    YourFavBrandItem(brandName: "Ferrari", brandImage: AppAssets.icFerrari, isSelected: false),
    YourFavBrandItem(brandName: "Lamborghini", brandImage: AppAssets.icLamborghini, isSelected: false),
    YourFavBrandItem(brandName: "Land Rover", brandImage: AppAssets.icLandRover, isSelected: false),
    YourFavBrandItem(brandName: "Lexus", brandImage: AppAssets.icLexus, isSelected: false),
  ];
  List<YourFavBrandItem> filteredBrandList = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredBrandList = yourFavBrandList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 15.setHeight),
          child: CommonTextFormFieldWithPrefixAndSuffix(
            controller: _searchController,
            prefixIcon: AppAssets.icSearch,
            hintText: Languages.of(context).txtSearch,
            suffixIcon: AppAssets.icClose,
            fillColor: CustomAppColor.of(context).bgSearchBar,
            hintTextColor: CustomAppColor.of(context).txtDarkGray,
            prefixIconColor: CustomAppColor.of(context).txtDarkGray,
            suffixIconColor: CustomAppColor.of(context).txtDarkGray,
            borderColor: CustomAppColor.of(context).transparent,
            contentPadding: EdgeInsets.only(
              right: 15.setWidth,
              left: 25.setWidth,
            ),
            radius: 1000,
            onTextChanged: (value) {
              setState(() {
                filteredBrandList = yourFavBrandList.where((brand) => brand.brandName.toLowerCase().contains(value.toLowerCase())).toList();
              });
            },
            onSuffixClick: () {
              setState(() {
                _searchController.clear();
              });
            },
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: filteredBrandList.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.2,
            ),
            padding: EdgeInsets.symmetric(horizontal: 15.setWidth),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                filteredBrandList[index].isSelected = !filteredBrandList[index].isSelected;
                setState(() {});
                if (filteredBrandList[index].isSelected) {
                  Future.delayed(const Duration(milliseconds: 200), () {
                    widget.onBrandSelected(filteredBrandList[index]);
                  });
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).txtWhite,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: filteredBrandList[index].isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtGray,
                    width: filteredBrandList[index].isSelected ? 2 : 0.5,
                  ),
                ),
                margin: EdgeInsets.only(left: 7.setWidth, right: 7.setWidth, bottom: 15.setHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      filteredBrandList[index].brandImage,
                      width: 50.setWidth,
                      height: 50.setHeight,
                      fit: BoxFit.contain,
                      color: (yourFavBrandList[index].brandImage == AppAssets.icAudi || yourFavBrandList[index].brandImage == AppAssets.icJaguar || yourFavBrandList[index].brandImage == AppAssets.icLandRover)
                          ? CustomAppColor.of(context).txtBlack
                          : null,
                    ),
                    SizedBox(height: 20.setHeight),
                    CommonText(
                        text: filteredBrandList[index].brandName,
                        fontSize: 14.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: filteredBrandList[index].isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtGray,
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ModelSelection extends StatefulWidget {
  final Function(String) onModelSelected;
  final String selectedModel;
  const ModelSelection({super.key, required this.onModelSelected, required this.selectedModel});

  @override
  State<ModelSelection> createState() => _ModelSelectionState();
}

class _ModelSelectionState extends State<ModelSelection> {
  final TextEditingController _searchController = TextEditingController();
  String selectedModel = ""; // Default selected as shown in image

  List<String> popularModels = [
    "Fortuner",
    "Innova Crysta",
    "Rumion",
    "Urban Cruiser Taisor",
  ];

  List<String> allModels = [
    "Alphard G",
    "Camry",
    "Chaser",
    "Carina",
    "COROLLA AXIO",
    "Glanza",
  ];

  List<String> filteredPopularModels = [];
  List<String> filteredAllModels = [];

  @override
  void initState() {
    super.initState();
    filteredPopularModels = popularModels;
    filteredAllModels = allModels;
    selectedModel = widget.selectedModel;
  }

  void _filterModels(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredPopularModels = popularModels;
        filteredAllModels = allModels;
      } else {
        filteredPopularModels = popularModels.where((model) => model.toLowerCase().contains(query.toLowerCase())).toList();
        filteredAllModels = allModels.where((model) => model.toLowerCase().contains(query.toLowerCase())).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 15.setHeight),
          child: CommonText(
            text: "Select Your Car Model",
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
        ),

        // Search Bar
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          child: CommonTextFormFieldWithPrefixAndSuffix(
            controller: _searchController,
            prefixIcon: AppAssets.icSearch,
            hintText: "Search car model",
            suffixIcon: AppAssets.icClose,
            fillColor: CustomAppColor.of(context).bgSearchBar,
            hintTextColor: CustomAppColor.of(context).txtDarkGray,
            prefixIconColor: CustomAppColor.of(context).txtDarkGray,
            suffixIconColor: CustomAppColor.of(context).txtDarkGray,
            borderColor: CustomAppColor.of(context).transparent,
            contentPadding: EdgeInsets.only(
              right: 15.setWidth,
              left: 25.setWidth,
            ),
            radius: 1000,
            onTextChanged: (value) {
              _filterModels(value);
            },
            onSuffixClick: () {
              setState(() {
                _searchController.clear();
                _filterModels("");
              });
            },
          ),
        ),

        SizedBox(height: 20.setHeight),

        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Popular Models Section
                if (filteredPopularModels.isNotEmpty) ...[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                    child: CommonText(
                      text: "Popular Models",
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w400,
                      textColor: CustomAppColor.of(context).txtGray,
                    ),
                  ),
                  SizedBox(height: 10.setHeight),
                  ...filteredPopularModels.map((model) => _buildModelItem(model, true)),
                  SizedBox(height: 20.setHeight),
                ],

                // All Models Section
                if (filteredAllModels.isNotEmpty) ...[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                    child: CommonText(
                      text: "All Models",
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w400,
                      textColor: CustomAppColor.of(context).txtGray,
                    ),
                  ),
                  SizedBox(height: 10.setHeight),
                  ...filteredAllModels.map((model) => _buildModelItem(model, false)),
                ],

                SizedBox(height: 20.setHeight),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildModelItem(String model, bool isPopular) {
    bool isSelected = model == selectedModel;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedModel = model;
        });
        widget.onModelSelected(model);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 1.setHeight),
        padding: EdgeInsets.symmetric(
          horizontal: 12.setWidth,
          vertical: 12.setHeight,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected ? CustomAppColor.of(context).primary.withValues(alpha: 0.1) : null,
          border: Border(
            bottom: BorderSide(
              color: CustomAppColor.of(context).containerBorder,
              width: 0.5,
            ),
          ),
        ),
        child: CommonText(
          text: model,
          fontSize: 12.setFontSize,
          fontWeight: FontWeight.w400,
          textColor: isSelected ? CustomAppColor.of(context).txtCarYearSelection : CustomAppColor.of(context).txtBlack,
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}

class VariantSelection extends StatefulWidget {
  final Function(String) onVariantSelected;
  const VariantSelection({super.key, required this.onVariantSelected});

  @override
  State<VariantSelection> createState() => _VariantSelectionState();
}

class _VariantSelectionState extends State<VariantSelection> with TickerProviderStateMixin {
  late TabController _fuelTabController;
  String selectedVariant = "2.4 GX 8STR"; // Default selected as shown in image

  List<String> fuelTypes = ["Diesel", "Petrol"];

  Map<String, List<String>> variantsByFuelType = {
    "Diesel": [
      "2.4 GX 7STR",
      "2.4 GX 8STR",
      "2.4 VX 7STR",
      "2.4 ZX 7STR",
      "2.4 VX 8STR",
      "GX Plus 7 STR",
      "GX Plus 8 STR",
    ],
    "Petrol": [
      "2.7 GX 7STR",
      "2.7 GX 8STR",
      "2.7 VX 7STR",
      "2.7 ZX 7STR",
      "2.7 VX 8STR",
    ],
  };

  @override
  void initState() {
    super.initState();
    _fuelTabController = TabController(length: fuelTypes.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 15.setHeight),
          child: CommonText(
            text: Languages.of(context).txtSelectYourCarVariant,
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
        ),

        // Fuel Type Tabs
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          child: Container(
            height: 40.setHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.setWidth),
              border: Border.all(
                color: CustomAppColor.of(context).primary,
                width: 1,
              ),
            ),
            child: TabBar(
              controller: _fuelTabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20.setWidth),
                color: CustomAppColor.of(context).primary,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.zero,
              dividerColor: Colors.transparent,
              labelColor: CustomAppColor.of(context).tabSelectedTxtColor,
              unselectedLabelColor: CustomAppColor.of(context).primary,
              labelStyle: TextStyle(
                fontSize: 14.setFontSize,
                fontWeight: FontWeight.w500,
                fontFamily: Constant.fontFamily,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 14.setFontSize,
                fontWeight: FontWeight.w400,
                fontFamily: Constant.fontFamily,
              ),
              tabs: fuelTypes.map((fuelType) => Tab(text: fuelType)).toList(),
            ),
          ),
        ),

        SizedBox(height: 20.setHeight),

        // Variants List
        Expanded(
          child: TabBarView(
            controller: _fuelTabController,
            children: fuelTypes.map((fuelType) {
              List<String> variants = variantsByFuelType[fuelType] ?? [];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section Header
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                    child: CommonText(
                      text: "$fuelType Variants",
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w400,
                      textColor: CustomAppColor.of(context).txtGray,
                    ),
                  ),
                  SizedBox(height: 10.setHeight),

                  // Variants List
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                      itemCount: variants.length,
                      itemBuilder: (context, index) {
                        String variant = variants[index];
                        bool isSelected = variant == selectedVariant;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedVariant = variant;
                            });
                            widget.onVariantSelected(variant);
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 1.setHeight),
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.setWidth,
                              vertical: 12.setHeight,
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: isSelected ? CustomAppColor.of(context).primary.withValues(alpha: 0.1) : null,
                              border: Border(
                                bottom: BorderSide(
                                  color: CustomAppColor.of(context).containerBorder,
                                  width: 0.5,
                                ),
                              ),
                            ),
                            child: CommonText(
                              text: variant,
                              fontSize: 12.setFontSize,
                              fontWeight: FontWeight.w400,
                              textColor: isSelected ? CustomAppColor.of(context).txtCarYearSelection : CustomAppColor.of(context).txtBlack,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class StateSelection extends StatefulWidget {
  final Function(String) onStateSelected;
  final bool isShowZipCodes;
  const StateSelection({super.key, required this.onStateSelected, this.isShowZipCodes = false});

  @override
  State<StateSelection> createState() => _StateSelectionState();
}

class _StateSelectionState extends State<StateSelection> {
  final TextEditingController _searchController = TextEditingController();
  String selectedState = ""; // Start with no selection
  String selectedZipCode = "NY-01"; // Default selected zip as shown in image
  bool showZipCodes = false; // Track whether to show zip codes

  List<String> allStates = [
    "New York",
    "Alabama",
    "Alaska",
    "Arizona",
    "California",
    "Colorado",
    "Delaware",
    "Florida",
    "Georgia",
    "Hawaii",
    "Idaho",
    "Illinois",
    "Indiana",
    "Iowa",
    "Kansas",
    "Kentucky",
    "Louisiana",
    "Maine",
    "Maryland",
    "Massachusetts",
    "Michigan",
    "Minnesota",
    "Mississippi",
    "Missouri",
    "Montana",
    "Nebraska",
    "Nevada",
    "New Hampshire",
    "New Jersey",
    "New Mexico",
    "North Carolina",
    "North Dakota",
    "Ohio",
    "Oklahoma",
    "Oregon",
    "Pennsylvania",
    "Rhode Island",
    "South Carolina",
    "South Dakota",
    "Tennessee",
    "Texas",
    "Utah",
    "Vermont",
    "Virginia",
    "Washington",
    "West Virginia",
    "Wisconsin",
    "Wyoming",
  ];

  // Sample zip codes for New York (can be expanded for other states)
  Map<String, List<String>> zipCodesByState = {
    "New York": [
      "NY-01",
      "NY-02",
      "NY-03",
      "NY-04",
      "NY-05",
      "NY-06",
      "NY-07",
      "NY-08",
      "NY-09",
      "NY-10",
      "NY-11",
      "NY-12",
      "NY-13",
      "NY-14",
      "NY-15",
    ],
    // Add more states and their zip codes as needed
  };

  List<String> filteredStates = [];
  List<String> filteredZipCodes = [];

  @override
  void initState() {
    super.initState();
    filteredStates = allStates;
    if (widget.isShowZipCodes) {
      selectedState = "New York"; // you can pass default or handle dynamically
      showZipCodes = true;
      filteredZipCodes = zipCodesByState[selectedState] ?? [];
    }
  }

  void _filterStates(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredStates = allStates;
      } else {
        filteredStates = allStates.where((state) => state.toLowerCase().contains(query.toLowerCase())).toList();
      }
    });
  }

  void _filterZipCodes(String query) {
    List<String> allZipCodes = zipCodesByState[selectedState] ?? [];
    setState(() {
      if (query.isEmpty) {
        filteredZipCodes = allZipCodes;
      } else {
        filteredZipCodes = allZipCodes.where((zip) => zip.toLowerCase().contains(query.toLowerCase())).toList();
      }
    });
  }

  void _selectState(String state) {
    setState(() {
      selectedState = state;
      showZipCodes = true;
      filteredZipCodes = zipCodesByState[state] ?? [];
      _searchController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showZipCodes) {
      // Show zip code selection screen
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Selected State Display
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 15.setHeight),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 10.setHeight),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.setWidth),
                border: Border.all(
                  color: CustomAppColor.of(context).compareBtnBorder,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: CommonText(
                      text: selectedState,
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w400,
                      textColor: CustomAppColor.of(context).compareBtnText,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  IgnorePointer(
                    ignoring: true,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          showZipCodes = false;
                          selectedState = "";
                          _searchController.clear();
                          filteredStates = allStates;
                        });
                      },
                      child: Icon(
                        Icons.edit,
                        color: CustomAppColor.of(context).compareBtnText,
                        size: 18.setWidth,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Zip Code Title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: CommonText(
              text: Languages.of(context).txtEnterZipCode,
              fontSize: 16.setFontSize,
              fontWeight: FontWeight.w500,
              textColor: CustomAppColor.of(context).txtBlack,
            ),
          ),

          SizedBox(height: 15.setHeight),

          // Search Bar for Zip Codes
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: CommonTextFormFieldWithPrefixAndSuffix(
              controller: _searchController,
              prefixIcon: AppAssets.icSearch,
              hintText: Languages.of(context).txtSearchYourZipCode,
              suffixIcon: AppAssets.icClose,
              fillColor: CustomAppColor.of(context).bgSearchBar,
              hintTextColor: CustomAppColor.of(context).txtDarkGray,
              prefixIconColor: CustomAppColor.of(context).txtDarkGray,
              suffixIconColor: CustomAppColor.of(context).txtDarkGray,
              borderColor: CustomAppColor.of(context).transparent,
              contentPadding: EdgeInsets.only(
                right: 15.setWidth,
                left: 25.setWidth,
              ),
              radius: 1000,
              onTextChanged: (value) {
                _filterZipCodes(value);
              },
              onSuffixClick: () {
                setState(() {
                  _searchController.clear();
                  _filterZipCodes("");
                });
              },
            ),
          ),

          SizedBox(height: 20.setHeight),

          // All Zip Code Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                  child: CommonText(
                    text: Languages.of(context).txtAllZipCode,
                    fontSize: 14.setFontSize,
                    fontWeight: FontWeight.w400,
                    textColor: CustomAppColor.of(context).txtGray,
                  ),
                ),
                SizedBox(height: 10.setHeight),

                // Zip Codes List
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                    itemCount: filteredZipCodes.length,
                    itemBuilder: (context, index) {
                      String zipCode = filteredZipCodes[index];
                      bool isSelected = zipCode == selectedZipCode;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedZipCode = zipCode;
                          });
                          widget.onStateSelected("$selectedState - $zipCode");
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 1.setHeight),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.setWidth,
                            vertical: 12.setHeight,
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: isSelected ? CustomAppColor.of(context).primary.withValues(alpha: 0.1) : null,
                            border: Border(
                              bottom: BorderSide(
                                color: CustomAppColor.of(context).containerBorder,
                                width: 0.5,
                              ),
                            ),
                          ),
                          child: CommonText(
                            text: zipCode,
                            fontSize: 12.setFontSize,
                            fontWeight: FontWeight.w400,
                            textColor: isSelected ? CustomAppColor.of(context).txtCarYearSelection : CustomAppColor.of(context).txtBlack,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    // Show original state selection screen
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 15.setHeight),
          child: CommonText(
            text: Languages.of(context).txtSelectYourCarRegistrationState,
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
        ),

        // Search Bar
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          child: CommonTextFormFieldWithPrefixAndSuffix(
            controller: _searchController,
            prefixIcon: AppAssets.icSearch,
            hintText: Languages.of(context).txtSearchYourState,
            suffixIcon: AppAssets.icClose,
            fillColor: CustomAppColor.of(context).bgSearchBar,
            hintTextColor: CustomAppColor.of(context).txtDarkGray,
            prefixIconColor: CustomAppColor.of(context).txtDarkGray,
            suffixIconColor: CustomAppColor.of(context).txtDarkGray,
            borderColor: CustomAppColor.of(context).transparent,
            contentPadding: EdgeInsets.only(
              right: 15.setWidth,
              left: 25.setWidth,
            ),
            radius: 1000,
            onTextChanged: (value) {
              _filterStates(value);
            },
            onSuffixClick: () {
              setState(() {
                _searchController.clear();
                _filterStates("");
              });
            },
          ),
        ),

        SizedBox(height: 20.setHeight),

        // All States Section
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                child: CommonText(
                  text: Languages.of(context).txtAllStates,
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w400,
                  textColor: CustomAppColor.of(context).txtGray,
                ),
              ),
              SizedBox(height: 10.setHeight),

              // States List
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                  itemCount: filteredStates.length,
                  itemBuilder: (context, index) {
                    String state = filteredStates[index];
                    bool isSelected = state == selectedState;

                    return IgnorePointer(
                      ignoring: true,
                      child: GestureDetector(
                        onTap: () {
                          _selectState(state);
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 1.setHeight),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.setWidth,
                            vertical: 12.setHeight,
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: isSelected ? CustomAppColor.of(context).primary.withValues(alpha: 0.1) : null,
                            border: Border(
                              bottom: BorderSide(
                                color: CustomAppColor.of(context).containerBorder,
                                width: 0.5,
                              ),
                            ),
                          ),
                          child: CommonText(
                            text: state,
                            fontSize: 12.setFontSize,
                            fontWeight: FontWeight.w400,
                            textColor: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtBlack,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class KmsDrivenSelection extends StatefulWidget {
  final Function(String) onKmsDrivenSelected;
  const KmsDrivenSelection({super.key, required this.onKmsDrivenSelected});

  @override
  State<KmsDrivenSelection> createState() => _KmsDrivenSelectionState();
}

class _KmsDrivenSelectionState extends State<KmsDrivenSelection> {
  String selectedKmRange = "10,000 Km - 20,000 Km"; // Default selected as shown in image

  List<String> kmRanges = [
    "0 Km - 10,000 Km",
    "10,000 Km - 20,000 Km",
    "20,000 Km - 30,000 Km",
    "30,000 Km - 40,000 Km",
    "40,000 Km - 50,000 Km",
    "50,000 Km - 60,000 Km",
    "60,000 Km - 70,000 Km",
    "70,000 Km - 80,000 Km",
    "80,000 Km - 90,000 Km",
    "90,000 Km - 1,00,000 Km",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 15.setHeight),
          child: CommonText(
            text: "Select KM Driven",
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
        ),

        // KM Ranges List
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            itemCount: kmRanges.length,
            itemBuilder: (context, index) {
              String kmRange = kmRanges[index];
              bool isSelected = kmRange == selectedKmRange;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedKmRange = kmRange;
                  });
                  widget.onKmsDrivenSelected(kmRange);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 1.setHeight),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.setWidth,
                    vertical: 12.setHeight,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: isSelected ? CustomAppColor.of(context).primary.withValues(alpha: 0.1) : null,
                    border: Border(
                      bottom: BorderSide(
                        color: CustomAppColor.of(context).containerBorder,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: CommonText(
                    text: kmRange,
                    fontSize: 12.setFontSize,
                    fontWeight: FontWeight.w400,
                    textColor: isSelected ? CustomAppColor.of(context).txtCarYearSelection : CustomAppColor.of(context).txtBlack,
                    textAlign: TextAlign.start,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class LocationSelection extends StatefulWidget {
  final Function(String) onLocationSelected;
  const LocationSelection({super.key, required this.onLocationSelected});

  @override
  State<LocationSelection> createState() => _LocationSelectionState();
}

class _LocationSelectionState extends State<LocationSelection> {
  final TextEditingController _searchController = TextEditingController();
  String selectedLocation = "Buffalo"; // Default selected as shown in image

  List<String> allCities = [
    "Idaho",
    "Buffalo",
    "Yonkers",
    "Rochester",
    "Syracuse",
    "Albany",
    "New Rochelle",
    "Mount Vernon",
    "Schenectady",
    "Utica",
    "White Plains",
    "Hempstead",
    "Troy",
    "Niagara Falls",
    "Binghamton",
    "Freeport",
    "Valley Stream",
    "Long Beach",
    "Spring Valley",
    "Watertown",
  ];

  List<String> filteredCities = [];

  @override
  void initState() {
    super.initState();
    filteredCities = allCities;
  }

  void _filterCities(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredCities = allCities;
      } else {
        filteredCities = allCities.where((city) => city.toLowerCase().contains(query.toLowerCase())).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 15.setHeight),
          child: CommonText(
            text: "Select Your Car Location",
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
        ),

        // Search Bar
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          child: CommonTextFormFieldWithPrefixAndSuffix(
            controller: _searchController,
            prefixIcon: AppAssets.icSearch,
            hintText: "Search your city",
            suffixIcon: AppAssets.icClose,
            fillColor: CustomAppColor.of(context).bgSearchBar,
            hintTextColor: CustomAppColor.of(context).txtDarkGray,
            prefixIconColor: CustomAppColor.of(context).txtDarkGray,
            suffixIconColor: CustomAppColor.of(context).txtDarkGray,
            borderColor: CustomAppColor.of(context).transparent,
            contentPadding: EdgeInsets.only(
              right: 15.setWidth,
              left: 25.setWidth,
            ),
            radius: 1000,
            onTextChanged: (value) {
              _filterCities(value);
            },
            onSuffixClick: () {
              setState(() {
                _searchController.clear();
                _filterCities("");
              });
            },
          ),
        ),

        SizedBox(height: 20.setHeight),

        // All Cities Section
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                child: CommonText(
                  text: "All Cities",
                  fontSize: 14.setFontSize,
                  fontWeight: FontWeight.w400,
                  textColor: CustomAppColor.of(context).txtGray,
                ),
              ),
              SizedBox(height: 10.setHeight),

              // Cities List
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                  itemCount: filteredCities.length,
                  itemBuilder: (context, index) {
                    String city = filteredCities[index];
                    bool isSelected = city == selectedLocation;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedLocation = city;
                        });
                        widget.onLocationSelected(city);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 1.setHeight),
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.setWidth,
                          vertical: 12.setHeight,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: isSelected ? CustomAppColor.of(context).primary.withValues(alpha: 0.1) : null,
                          border: Border(
                            bottom: BorderSide(
                              color: CustomAppColor.of(context).containerBorder,
                              width: 0.5,
                            ),
                          ),
                        ),
                        child: CommonText(
                          text: city,
                          fontSize: 12.setFontSize,
                          fontWeight: FontWeight.w400,
                          textColor: isSelected ? CustomAppColor.of(context).txtCarYearSelection : CustomAppColor.of(context).txtBlack,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PriceSelection extends StatefulWidget {
  final Function(String) onPriceSelected;
  const PriceSelection({super.key, required this.onPriceSelected});

  @override
  State<PriceSelection> createState() => _PriceSelectionState();
}

class _PriceSelectionState extends State<PriceSelection> {
  final TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.setHeight),

          // Title
          CommonText(
            text: Languages.of(context).txtEnterYourSellingPrice,
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtBlack,
          ),

          SizedBox(height: 8.setHeight),

          // Subtitle/Recommendation
          CommonText(
            text: Languages.of(context).txtRecommendedPriceRangeIsBetween20LakhTo24Lakh,
            fontSize: 12.setFontSize,
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtGray,
            textAlign: TextAlign.start,
          ),

          SizedBox(height: 20.setHeight),

          // Price Input Field
          CommonTextFormField(
            controller: _priceController,
            hintText: Languages.of(context).txtEnterSellingPrice,
            labelText: Languages.of(context).txtSellingPrice,
            hintTextColor: CustomAppColor.of(context).txtGray,
            borderColor: CustomAppColor.of(context).containerBorder,
            fillColor: CustomAppColor.of(context).transparent,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.setWidth,
              vertical: 14.setHeight,
            ),
            keyboardType: TextInputType.number,
          ),

          // Spacer to push button to bottom
          Expanded(child: Container()),

          // Confirm Button
          IgnorePointer(
            ignoring: true,
            child: CommonButton(
              text: Languages.of(context).txtConfirm,
              onTap: () {
                if (_priceController.text.isNotEmpty) {
                  FocusScope.of(context).unfocus();
                  widget.onPriceSelected(_priceController.text);
                }
              },
            ),
          ),

          SizedBox(height: 20.setHeight),
        ],
      ),
    );
  }
}

class PhotosSelection extends StatefulWidget {
  final Function(String) onPhotosSelected;
  const PhotosSelection({super.key, required this.onPhotosSelected});

  @override
  State<PhotosSelection> createState() => _PhotosSelectionState();
}

class _PhotosSelectionState extends State<PhotosSelection> {
  List<File> uploadedPhotos = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image != null) {
        setState(() {
          uploadedPhotos.add(File(image.path));
        });
      }
    } catch (e) {
      _showErrorSnackBar("Error picking image from gallery");
    }
  }

  Future<void> _pickImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );

      if (image != null) {
        setState(() {
          uploadedPhotos.add(File(image.path));
        });
      }
    } catch (e) {
      _showErrorSnackBar("Error capturing image from camera");
    }
  }

  Future<void> _pickMultipleImages() async {
    try {
      final List<XFile> images = await _picker.pickMultiImage(
        imageQuality: 80,
      );

      if (images.isNotEmpty) {
        setState(() {
          uploadedPhotos.addAll(images.map((image) => File(image.path)));
        });
      }
    } catch (e) {
      _showErrorSnackBar("Error picking multiple images");
    }
  }

  void _removePhoto(int index) {
    setState(() {
      uploadedPhotos.removeAt(index);
    });
  }

  void _showImageSourceBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.setWidth)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(20.setWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonText(
              text: Languages.of(context).txtSelectImageSource,
              fontSize: 16.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).txtBlack,
            ),
            SizedBox(height: 20.setHeight),

            // Gallery Option
            ListTile(
              leading: Icon(
                Icons.photo_library,
                color: CustomAppColor.of(context).primary,
              ),
              title: CommonText(
                text: Languages.of(context).txtChooseFromGallery,
                fontSize: 14.setFontSize,
                fontWeight: FontWeight.w500,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              onTap: () {
                Navigator.pop(context);
                _pickImageFromGallery();
              },
            ),

            // Multiple Images Option
            ListTile(
              leading: Icon(
                Icons.photo_library_outlined,
                color: CustomAppColor.of(context).primary,
              ),
              title: CommonText(
                text: Languages.of(context).txtChooseMultipleImages,
                fontSize: 14.setFontSize,
                fontWeight: FontWeight.w500,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              onTap: () {
                Navigator.pop(context);
                _pickMultipleImages();
              },
            ),

            // Camera Option
            ListTile(
              leading: Icon(
                Icons.camera_alt,
                color: CustomAppColor.of(context).primary,
              ),
              title: CommonText(
                text: Languages.of(context).txtTakePhoto,
                fontSize: 14.setFontSize,
                fontWeight: FontWeight.w500,
                textColor: CustomAppColor.of(context).txtBlack,
              ),
              onTap: () {
                Navigator.pop(context);
                _pickImageFromCamera();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.setHeight),

          // Title
          CommonText(
            text: Languages.of(context).txtUploadPhotos,
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtBlack,
          ),

          SizedBox(height: 15.setHeight),

          // Instructions
          Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 16.setWidth,
                    height: 16.setHeight,
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check,
                      color: CustomAppColor.of(context).txtWhite,
                      size: 10.setWidth,
                    ),
                  ),
                  SizedBox(width: 8.setWidth),
                  Expanded(
                    child: CommonText(
                      text: Languages.of(context).txtUploadFrontAndBackViewPhotosOfYourCar,
                      fontSize: 12.setFontSize,
                      fontWeight: FontWeight.w400,
                      textColor: CustomAppColor.of(context).txtBlack,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.setHeight),
              Row(
                children: [
                  Container(
                    width: 16.setWidth,
                    height: 16.setHeight,
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check,
                      color: CustomAppColor.of(context).txtWhite,
                      size: 10.setWidth,
                    ),
                  ),
                  SizedBox(width: 8.setWidth),
                  Expanded(
                    child: CommonText(
                      text: Languages.of(context).txtUseHighResolutionCamera,
                      fontSize: 12.setFontSize,
                      fontWeight: FontWeight.w400,
                      textColor: CustomAppColor.of(context).txtBlack,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 25.setHeight),

          // Upload Area
          GestureDetector(
            onTap: () {
              _pickMultipleImages();
            },
            child: Container(
              width: double.infinity,
              height: 120.setHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.setWidth),
              ),
              child: CustomPaint(
                painter: DashedBorderPainter(
                  color: CustomAppColor.of(context).containerBorder,
                  strokeWidth: 1.0,
                  dashWidth: 5.0,
                  dashSpace: 3.0,
                  borderRadius: 8.setWidth,
                ),
                child: Container(
                  padding: EdgeInsets.all(1.setWidth), // Small padding to prevent overlap
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.setWidth,
                          vertical: 10.setHeight,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.setWidth),
                          gradient: CustomAppColor.of(context).primaryGradient,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.add,
                              color: CustomAppColor.of(context).txtWhite,
                              size: 16.setWidth,
                            ),
                            SizedBox(width: 4.setWidth),
                            CommonText(
                              text: Languages.of(context).txtAddPhotos,
                              fontSize: 12.setFontSize,
                              fontWeight: FontWeight.w500,
                              textColor: CustomAppColor.of(context).txtWhite,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.setHeight),
                      CommonText(
                        text: Languages.of(context).txtSupportedFormatsJPGJPEGPNPDF,
                        fontSize: 10.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtGray,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 20.setHeight),

          // Camera Option
          GestureDetector(
            onTap: () {
              _pickImageFromCamera();
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16.setHeight),
              decoration: BoxDecoration(
                border: Border.all(
                  color: CustomAppColor.of(context).containerBorder,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12.setWidth),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_alt_outlined,
                    color: CustomAppColor.of(context).txtBlack,
                    size: 20.setWidth,
                  ),
                  SizedBox(width: 8.setWidth),
                  CommonText(
                    text: "camera",
                    fontSize: 14.setFontSize,
                    fontWeight: FontWeight.w400,
                    textColor: CustomAppColor.of(context).txtBlack,
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 20.setHeight),

          // Selected Photos Grid
          if (uploadedPhotos.isNotEmpty) ...[
            CommonText(
              text: Languages.of(context).txtSelectedPhotos(uploadedPhotos.length),
              fontSize: 14.setFontSize,
              fontWeight: FontWeight.w500,
              textColor: CustomAppColor.of(context).txtBlack,
            ),
            SizedBox(height: 10.setHeight),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10.setWidth,
                mainAxisSpacing: 10.setHeight,
                childAspectRatio: 1.0,
              ),
              itemCount: uploadedPhotos.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.setWidth),
                    border: Border.all(
                      color: CustomAppColor.of(context).containerBorder,
                      width: 1,
                    ),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(7.setWidth),
                        child: Image.file(
                          uploadedPhotos[index],
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 2.setHeight,
                        right: 2.setWidth,
                        child: GestureDetector(
                          onTap: () => _removePhoto(index),
                          child: Container(
                            width: 16.setWidth,
                            height: 16.setHeight,
                            decoration: BoxDecoration(
                              color: CustomAppColor.of(context).primary,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.close,
                              color: CustomAppColor.of(context).txtWhite,
                              size: 10.setWidth,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 20.setHeight),
          ],

          // Spacer to push button to bottom
          Expanded(child: Container()),

          // Confirm Button
          CommonButton(
            text: Languages.of(context).txtConfirm,
            onTap: () {
              if (uploadedPhotos.isNotEmpty) {
                widget.onPhotosSelected("${uploadedPhotos.length} photos uploaded");
              } else {
                _showErrorSnackBar("Please select at least one photo");
              }
            },
          ),

          SizedBox(height: 20.setHeight),
        ],
      ),
    );
  }
}
