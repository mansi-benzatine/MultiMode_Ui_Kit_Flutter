import 'package:flutter/material.dart';
import 'package:furniture_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:furniture_screens_app_package/ui/home/datamodel/home_data.dart';
import 'package:furniture_screens_app_package/utils/app_assets.dart';
import 'package:furniture_screens_app_package/utils/app_color.dart';
import 'package:furniture_screens_app_package/utils/constant.dart';
import 'package:furniture_screens_app_package/utils/sizer_utils.dart';
import 'package:furniture_screens_app_package/widgets/button/common_button.dart';
import 'package:furniture_screens_app_package/widgets/text_field/text_form_field.dart';

import '../../../localization/language/languages.dart';
import '../../../widgets/bottom_sheet/filter_bottom_sheet.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../category/datamodel/category_data.dart';

class SearchScreen extends StatefulWidget {
  final bool isForEmptyScreen;
  final bool isForFilterBs;

  static Route<void> route({bool isForEmptyScreen = false, bool isForFilterBs = false}) {
    return MaterialPageRoute(
      builder: (_) => SearchScreen(
        isForEmptyScreen: isForEmptyScreen,
        isForFilterBs: isForFilterBs,
      ),
    );
  }

  const SearchScreen({super.key, this.isForEmptyScreen = false, this.isForFilterBs = false});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> implements TopBarClickListener {
  final TextEditingController searchController = TextEditingController();
  bool isSearchPerformed = false;
  bool hasResults = true;
  bool _isBottomSheetOpen = false;

  List<String> recentSearches = ["Sofa", "Bed", "Cupboard", "Lamp", "Vase"];

  final List<CategoriesModel> categories = [
    CategoriesModel(icon: AppAssets.imgDummyChair, name: 'Living', items: 190),
    CategoriesModel(icon: AppAssets.imgDummyLamp, name: 'Kitchen', items: 190),
    CategoriesModel(icon: AppAssets.imgDummyPot, name: 'Bedroom', items: 190),
    CategoriesModel(icon: AppAssets.imgDummySofa, name: 'Cafe', items: 190),
  ];

  final List<NewArrivalData> newArrivalList = [
    NewArrivalData(
      newArrivalItemCategoryName: "Arm Chair",
      newArrivalItemImage: AppAssets.imgDummyChair,
      newArrivalItemName: "Luxury Chair",
      newArrivalItemPrice: 299.00,
      newArrivalItemRating: 4.5,
    ),
    NewArrivalData(
      newArrivalItemCategoryName: "Lamp",
      newArrivalItemImage: AppAssets.imgDummyLamp,
      newArrivalItemName: "Night Lamp",
      newArrivalItemPrice: 299.00,
      newArrivalItemRating: 3.5,
    ),
  ];

  List<NewArrivalData> filteredNewArrivalList = [];

  void _onSearch(String query) {
    setState(() {
      if (query.trim().isEmpty) {
        isSearchPerformed = false;
        filteredNewArrivalList.clear();
        hasResults = false;
        return;
      }

      isSearchPerformed = true;
      filteredNewArrivalList = newArrivalList.where((item) {
        final name = item.newArrivalItemName.toLowerCase();
        final category = item.newArrivalItemCategoryName.toLowerCase();
        return name.contains(query.toLowerCase()) || category.contains(query.toLowerCase());
      }).toList();

      hasResults = filteredNewArrivalList.isNotEmpty;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isForFilterBs) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _isBottomSheetOpen = true;
        });
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          enableDrag: false,
          isDismissible: false,
          backgroundColor: Colors.transparent,
          builder: (_) => const FilterBottomSheet(),
        ).whenComplete(
          () {
            if (_isBottomSheetOpen) {
              setState(() {
                _isBottomSheetOpen = false;
              });
              Navigator.pop(context);
            }
          },
        );
      });
    }
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
          top: false,
          child: Column(
            children: [
              Column(
                children: [
                  TopBar(
                    this,
                    title: Languages.of(context).txtSearch,
                    isShowBack: true,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
                    child: Row(
                      children: [
                        Expanded(
                          child: CommonTextFormFieldWithPrefix(
                            controller: searchController,
                            onSubmitted: _onSearch,
                            fillColor: CustomAppColor.of(context).containerBg,
                            hintText: "Search... ",
                            prefixIcon: AppAssets.icSearch,
                          ),
                        ),
                        SizedBox(width: 10.setWidth),
                        IgnorePointer(
                          ignoring: true,
                          child: InkWell(
                            onTap: () => showFilterBottomSheet(context),
                            child: Container(
                              decoration: BoxDecoration(
                                color: CustomAppColor.of(context).primary,
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(12),
                              child: Image.asset(
                                AppAssets.icFilter,
                                height: 24.setHeight,
                                width: 24.setWidth,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.setHeight),
              Expanded(
                child: widget.isForEmptyScreen
                    ? _emptyStateWidget()
                    : isSearchPerformed
                        ? (hasResults ? _buildSearchResults() : _emptyStateWidget())
                        : _buildInitialContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emptyStateWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.imgSearchEmpty,
              height: 120.setHeight,
              width: 120.setWidth,
              color: CustomAppColor.of(context).emptyViewIcon,
            ),
            SizedBox(height: 20.setHeight),
            CommonText(
              text: Languages.of(context).txtResultNotFound,
              fontSize: 24.setFontSize,
              fontFamily: Constant.fontFamilyBold700,
            ),
            SizedBox(height: 8.setHeight),
            CommonText(
              text: Languages.of(context).txtResultNotFoundDesc,
              textAlign: TextAlign.center,
              fontSize: 14.setFontSize,
              fontFamily: Constant.fontFamilyMedium500,
              textColor: CustomAppColor.of(context).txtGray,
            ),
            SizedBox(height: 20.setHeight),
            CommonButton(
              width: 140.setWidth,
              height: 44.setHeight,
              buttonFontFamily: Constant.fontFamilySemiBold600,
              buttonTextSize: 16.setFontSize,
              text: Languages.of(context).txtSearchAgain,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInitialContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtRecentlySearch,
                fontSize: 20.setFontSize,
                fontFamily: Constant.fontFamilyBold700,
              ),
              if (recentSearches.isNotEmpty)
                GestureDetector(
                  onTap: () => setState(() => recentSearches.clear()),
                  child: CommonText(
                    text: Languages.of(context).txtClearAll,
                    fontSize: 16.setFontSize,
                    fontFamily: Constant.fontFamilyMedium500,
                    textColor: Colors.red,
                  ),
                )
            ],
          ),
          SizedBox(height: 20.setHeight),
          recentSearches.isEmpty
              ? const Center(child: Text("No recent searches"))
              : Wrap(
                  spacing: 8,
                  children: recentSearches
                      .map((item) => Chip(
                            visualDensity: VisualDensity.compact,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 0.2, color: CustomAppColor.of(context).icBlackWhite.withValues(alpha: 0.2)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: CustomAppColor.of(context).bgScreen,
                            label: CommonText(
                              text: item,
                              fontFamily: Constant.fontFamilyMedium500,
                              fontSize: 16.setFontSize,
                            ),
                            deleteIcon: const Icon(Icons.close, size: 18),
                            onDeleted: () => setState(() => recentSearches.remove(item)),
                          ))
                      .toList(),
                ),
          SizedBox(height: 20.setHeight),
          _sectionHeader(Languages.of(context).txtCategories),
          SizedBox(height: 20.setHeight),
          Wrap(
            spacing: 20.setWidth,
            runSpacing: 20.setHeight,
            children: categories.map((category) {
              return SizedBox(
                width: (MediaQuery.of(context).size.width - 20 * 3) / 2,
                height: 90.setHeight,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        category.icon,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: CommonText(
                        text: category.name,
                        textColor: Colors.white,
                        fontSize: 20.setFontSize,
                        fontFamily: Constant.fontFamilyBold700,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          _newArrivedListView(newArrivedList: newArrivalList),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    return _newArrivedListView(newArrivedList: filteredNewArrivalList);
  }

  _sectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommonText(
          text: title,
          fontSize: 20.setFontSize,
          fontFamily: Constant.fontFamilyBold700,
        ),
        CommonText(
          text: Languages.of(context).txtSeeAll,
          fontSize: 16.setFontSize,
          fontFamily: Constant.fontFamilyMedium500,
        ),
      ],
    );
  }

  _newArrivedListView({required List<NewArrivalData> newArrivedList}) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isSearchPerformed ? 20.setWidth : 5.setWidth),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtNewArrival,
                fontSize: 20.setFontSize,
                fontFamily: Constant.fontFamilyBold700,
              ),
              CommonText(
                text: Languages.of(context).txtSeeAll,
                fontSize: 16.setFontSize,
                fontFamily: Constant.fontFamilyMedium500,
              )
            ],
          ),
        ),
        SizedBox(height: 10.setHeight),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(newArrivedList.length, (index) {
              final item = newArrivedList[index];
              return Container(
                width: MediaQuery.of(context).size.width * 0.46,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.asset(
                            item.newArrivalItemImage,
                            width: 185.setWidth,
                            height: 185.setHeight,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          top: 10.setHeight,
                          right: 10.setWidth,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                item.isSelected = !item.isSelected;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: CustomAppColor.of(context).white.withValues(alpha: 0.3),
                              ),
                              padding: const EdgeInsets.all(6),
                              child: Image.asset(
                                item.isSelected ? AppAssets.icSelectedOrder : AppAssets.icUnselectedOrder,
                                height: 16.setHeight,
                                width: 16.setWidth,
                                color: item.isSelected ? CustomAppColor.of(context).primary : null,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10.setHeight),
                    Row(
                      children: [
                        Expanded(
                          child: CommonText(
                            text: item.newArrivalItemCategoryName,
                            fontSize: 16.setFontSize,
                            fontFamily: Constant.fontFamilySemiBold600,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(AppAssets.icStar, height: 16.setHeight, width: 16.setWidth),
                            SizedBox(width: 6.setWidth),
                            CommonText(
                              text: item.newArrivalItemRating.toString(),
                              fontSize: 16.setFontSize,
                              fontFamily: Constant.fontFamilySemiBold600,
                            ),
                          ],
                        ),
                      ],
                    ),
                    CommonText(
                      text: item.newArrivalItemName,
                      fontSize: 12.setFontSize,
                      fontFamily: Constant.fontFamilyMedium500,
                      textColor: CustomAppColor.of(context).txtGray,
                    ),
                    SizedBox(height: 6.setHeight),
                    CommonText(
                      text: "\$${item.newArrivalItemPrice}",
                      fontSize: 18.setFontSize,
                      fontFamily: Constant.fontFamilySemiBold600,
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
