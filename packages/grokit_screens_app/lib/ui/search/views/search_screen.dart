import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grokit_screens_app/localization/language/languages.dart';
import 'package:grokit_screens_app/utils/app_assets.dart';
import 'package:grokit_screens_app/utils/app_color.dart';
import 'package:grokit_screens_app/utils/constant.dart';
import 'package:grokit_screens_app/utils/sizer_utils.dart';
import 'package:grokit_screens_app/widgets/item_card/itme_card_view.dart';
import 'package:grokit_screens_app/widgets/text/common_text.dart';
import 'package:grokit_screens_app/widgets/text_field/text_form_field.dart';

import '../../../widgets/button/common_button.dart';
import '../../home/datamodel/home_data.dart';

class SearchScreen extends StatefulWidget {
  final bool isForEmptyView;

  static Route<void> route({bool isForEmptyView = false}) {
    return MaterialPageRoute(
      builder: (_) => SearchScreen(isForEmptyView: isForEmptyView),
    );
  }

  const SearchScreen({super.key, this.isForEmptyView = false});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  bool isSearchPerformed = false;
  bool hasResults = true;
  final ValueNotifier<String> hintText = ValueNotifier<String>("Search \"Chocolate\"");
  final List<String> hintTexts = [
    "Search \"Milk\"",
    "Search \"Veggie\"",
    "Search \"Fruits\"",
    "Search \"Dairy\"",
    "Search \"Egg\"",
    "Search \"Rice\"",
    "Search \"Bottle\"",
    "Search \"Chips\"",
  ];
  List<String> recentSearches = ["Egg", "Chips", "Bananas", "Biscuit", "Milk"];
  List<ItemsData> veggieList = [];
  List<ItemsData> snackList = [];
  int currentHintIndex = 0;
  Timer? _timer;
  List<ItemsData> filteredNewArrivalList = [];

  void _startHintAnimation() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        currentHintIndex = (currentHintIndex + 1) % hintTexts.length;
        hintText.value = hintTexts[currentHintIndex];
      });
    });
  }

  void _onSearch(String query) {
    setState(() {
      if (query.trim().isEmpty) {
        isSearchPerformed = false;
        filteredNewArrivalList.clear();
        hasResults = false;
        return;
      }

      isSearchPerformed = true;
      filteredNewArrivalList = veggieList.where((item) {
        final name = item.itemName.toLowerCase();

        return name.contains(query.toLowerCase());
      }).toList();

      hasResults = filteredNewArrivalList.isNotEmpty;
    });
  }

  void _fillData() {
    veggieList = [
      ItemsData(
        itemName: "Fresh Potato",
        itemImage: AppAssets.imgVeggie,
        itemWeight: "500gm",
        itemDiscountPrice: 32,
        itemOriginalPrice: 49,
        itemDiscount: 20,
      ),
      ItemsData(
        itemName: "Hybrid Tomato",
        itemImage: AppAssets.imgVeggie1,
        itemWeight: "500gm",
        itemDiscountPrice: 27,
        itemOriginalPrice: 34,
        itemDiscount: 20,
        isAddedToCart: false,
      ),
    ];
    snackList = [
      ItemsData(
        itemName: "Lays Cream & Onion Chips",
        itemImage: AppAssets.imgSnack1,
        itemWeight: "48gm",
        itemDiscountPrice: 20,
        itemOriginalPrice: 24,
        itemDiscount: 20,
        isAddedToCart: false,
      ),
      ItemsData(
        itemName: "Onion Kodubale",
        itemImage: AppAssets.imgSnack,
        itemWeight: "500gm",
        itemDiscountPrice: 99,
        itemOriginalPrice: 104,
        itemDiscount: 20,
      ),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startHintAnimation();
    _fillData();
    if (widget.isForEmptyView) {
      hasResults = false;
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    hintText.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          SizedBox(height: 50.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: CommonTextFormFieldWithPrefixAndSuffix(
              prefixIconColor: CustomAppColor.of(context).icBlackWhite,
              onPrefixClick: () {
                // Navigator.pop(context);
              },
              onSubmitted: _onSearch,
              controller: searchController,
              suffixIcon: AppAssets.icMicroPhone,
              borderColor: CustomAppColor.of(context).unselectedCard,
              fillColor: CustomAppColor.of(context).unselectedCard,
              hintText: hintText.value,
              prefixIcon: AppAssets.icBack,
            ),
          ),
          SizedBox(height: 18.setHeight),
          Expanded(
            child: widget.isForEmptyView ? (hasResults ? _buildSearchResults() : _emptyStateWidget()) : _buildInitialContent(),
          ),
        ],
      ),
    );
  }

  Widget _emptyStateWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.imgEmptySearch,
              height: 120.setHeight,
              width: 120.setWidth,
            ),
            SizedBox(height: 20.setHeight),
            CommonText(
              text: "${Languages.of(context).txtEmptySearch} \"${searchController.text}\"",
              fontSize: 16.setFontSize,
              fontFamily: Constant.fontFamilyBold700,
            ),
            SizedBox(height: 8.setHeight),
            CommonButton(
              width: 150.setWidth,
              height: 38.setHeight,
              buttonFontFamily: Constant.fontFamilySemiBold600,
              buttonTextSize: 14.setFontSize,
              borderColor: CustomAppColor.of(context).buttonPrimary,
              buttonColor: CustomAppColor.of(context).buttonPrimary,
              text: Languages.of(context).txtCheckCategories,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInitialContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: Languages.of(context).txtRecentSeaches,
                  fontSize: 16.setFontSize,
                  fontFamily: Constant.fontFamilyBold700,
                ),
                if (recentSearches.isNotEmpty)
                  GestureDetector(
                    onTap: () => setState(() => recentSearches.clear()),
                    child: CommonText(
                      text: Languages.of(context).txtClear,
                      fontSize: 12.setFontSize,
                      fontFamily: Constant.fontFamilyMedium500,
                      textColor: Colors.red,
                    ),
                  )
              ],
            ),
          ),
          SizedBox(height: 15.setHeight),
          recentSearches.isEmpty
              ? const Center(child: Text("No recent searches"))
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                  child: Wrap(
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
                                fontSize: 14.setFontSize,
                              ),
                              deleteIcon: const Icon(Icons.close, size: 18),
                              onDeleted: () => setState(() => recentSearches.remove(item)),
                            ))
                        .toList(),
                  ),
                ),
          SizedBox(height: 15.setHeight),
          _sectionHeader("Veggies & Fruits"),
          SizedBox(height: 15.setHeight),
          ItemCardView(items: veggieList),
          SizedBox(height: 20.setHeight),
          _sectionHeader("Sips & Juices"),
          SizedBox(height: 15.setHeight),
          ItemCardView(items: snackList),
          SizedBox(height: 50.setHeight),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    return ItemCardView(items: filteredNewArrivalList);
  }

  _sectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonText(
            text: title,
            fontSize: 16.setFontSize,
            fontFamily: Constant.fontFamilyBold700,
          ),
          const Icon(Icons.navigate_next_rounded)
        ],
      ),
    );
  }
}
