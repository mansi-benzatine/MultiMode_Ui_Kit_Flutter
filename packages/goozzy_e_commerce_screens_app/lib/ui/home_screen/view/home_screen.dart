import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:goozzy_e_commerce_screens_app_package/utils/utils.dart';

import '../../../../../utils/string_constant.dart';
import '../../../../widgets/text/common_text.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/bottom_sheet/bottom_sheet.dart';
import '../../../widgets/filter_action/filter_action.dart';
import '../../../widgets/heading/heading.dart';
import '../../../widgets/option_chip/filter_option_chip.dart';
import '../../../widgets/product/product_card.dart';
import '../../../widgets/textfield/common_textformfield.dart';
import '../../view_product/view/view_product_screen.dart';
import '../datamodel/home_screen_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<SortByData> sortByList = [];
  List<CategoryList> trendingDealsList = [];

  List<CategoryList> categoryList = [];

  List<SortByData> filterList = [];
  void fillData() {
    sortByList = [
      SortByData(label: Languages.of(context).mostRelevant, isSelected: true),
      SortByData(label: Languages.of(context).newArrivals, isSelected: false),
      SortByData(label: Languages.of(context).mostPopular, isSelected: false),
      SortByData(label: Languages.of(context).priceLowToHigh, isSelected: false),
      SortByData(label: Languages.of(context).priceHighToLow, isSelected: false),
      SortByData(label: Languages.of(context).ratingHighToLow, isSelected: false),
    ];
    trendingDealsList = [
      CategoryList(
        imagePath: AppAssets.imgKurti,
        name: Languages.of(context).kurti,
        discount: 50,
      ),
      CategoryList(
        imagePath: AppAssets.imgWomenTop,
        name: Languages.of(context).womenTop,
        discount: 70,
      ),
      CategoryList(
        imagePath: AppAssets.imgJumpSuit,
        name: Languages.of(context).womenTop,
        discount: 50,
      )
    ];
    categoryList = [
      CategoryList(
        imagePath: AppAssets.icDress,
        name: Languages.of(context).women,
        color: AppColor.containerGreen,
      ),
      CategoryList(
        imagePath: AppAssets.icCoat,
        name: Languages.of(context).men,
        color: AppColor.containerBlue,
      ),
      CategoryList(
        imagePath: AppAssets.icKids,
        name: Languages.of(context).kids,
        color: AppColor.containerPink,
      ),
      CategoryList(
        imagePath: AppAssets.icFootwear,
        name: Languages.of(context).footwear,
        color: AppColor.containerOrange,
      ),
    ];
    filterList = [
      SortByData(
        label: Languages.of(context).category,
        isSelected: false,
        isDotVisible: false,
      ),
      SortByData(
        label: Languages.of(context).gender,
        isSelected: false,
        isDotVisible: true,
      ),
      SortByData(
        label: Languages.of(context).colors,
        isSelected: false,
        isDotVisible: false,
      ),
      SortByData(
        label: Languages.of(context).fabric,
        isSelected: false,
        isDotVisible: true,
      ),
      SortByData(
        label: Languages.of(context).size,
        isSelected: false,
        isDotVisible: false,
      ),
      SortByData(
        label: Languages.of(context).price,
        isSelected: false,
        isDotVisible: false,
      ),
      SortByData(
        label: Languages.of(context).rating,
        isSelected: false,
        isDotVisible: true,
      ),
      SortByData(
        label: Languages.of(context).occasion,
        isSelected: false,
        isDotVisible: true,
      ),
      SortByData(
        label: Languages.of(context).combo,
        isSelected: false,
        isDotVisible: false,
      ),
      SortByData(
        label: Languages.of(context).discount,
        isSelected: false,
        isDotVisible: false,
      ),
      SortByData(
        label: Languages.of(context).reversible,
        isSelected: false,
        isDotVisible: false,
      ),
      SortByData(
        label: Languages.of(context).fitShape,
        isSelected: false,
        isDotVisible: false,
      ),
      SortByData(
        label: Languages.of(context).material,
        isSelected: false,
        isDotVisible: false,
      ),
      SortByData(
        label: Languages.of(context).patternType,
        isSelected: false,
        isDotVisible: true,
      ),
      SortByData(
        label: Languages.of(context).bottomwearFabric,
        isSelected: false,
        isDotVisible: true,
      ),
      SortByData(
        label: Languages.of(context).bottomPatternType,
        isSelected: false,
        isDotVisible: true,
      ),
      SortByData(
        label: Languages.of(context).border,
        isSelected: false,
        isDotVisible: true,
      ),
      SortByData(
        label: Languages.of(context).backType,
        isSelected: false,
        isDotVisible: true,
      ),
      SortByData(
        label: Languages.of(context).topType,
        isSelected: false,
        isDotVisible: true,
      ),
      SortByData(
        label: Languages.of(context).brand,
        isSelected: false,
        isDotVisible: true,
      ),
      SortByData(
        label: Languages.of(context).warrantyPeriod,
        isSelected: false,
        isDotVisible: true,
      ),
      SortByData(
        label: Languages.of(context).bottomType,
        isSelected: false,
        isDotVisible: true,
      ),
      SortByData(
        label: Languages.of(context).heelType,
        isSelected: false,
        isDotVisible: true,
      ),
      SortByData(
        label: Languages.of(context).concern,
        isSelected: false,
        isDotVisible: true,
      ),
      SortByData(
        label: Languages.of(context).typeOfSkin,
        isSelected: false,
        isDotVisible: true,
      ),
      SortByData(
        label: Languages.of(context).shade,
        isSelected: false,
        isDotVisible: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Container(
      color: CustomAppColor.of(context).bgTopBar,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(14), horizontal: AppSizes.setWidth(21)),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: CustomAppColor.of(context).black.withOpacityPercent(0.1),
                    blurRadius: AppSizes.setHeight(10),
                    offset: Offset(0, AppSizes.setHeight(4)),
                  ),
                ],
              ),
              child: CommonTextFormField(
                leadingIcon: Image.asset(
                  AppAssets.icSearch,
                  height: AppSizes.setHeight(18),
                  width: AppSizes.setWidth(18),
                ),
                suffixIcon: Image.asset(
                  AppAssets.icVoice,
                  scale: 3,
                ),
                borderColor: CustomAppColor.of(context).transparent,
                hintText: Languages.of(context).searchHere,
              ),
            ),
          ),
          imageSlider(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: AppSizes.setHeight(12)),
                    child: Heading(
                      title: Languages.of(context).categories.toUpperCase(),
                      navigationTitle: Languages.of(context).seeAll.toUpperCase(),
                    ),
                  ),
                  categoryCard(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(12)),
                    child: Heading(
                      title: Languages.of(context).treadingDeal.toUpperCase(),
                      navigationTitle: Languages.of(context).seeAll.toUpperCase(),
                    ),
                  ),
                  trendingCard(),
                  Padding(
                    padding: EdgeInsets.only(top: AppSizes.setHeight(16)),
                    child: CommonActionWidget.action(
                      context,
                      sortByTap: () {
                        showSortByBottomSheet(context);
                      },
                      categoryTap: () {
                        showCategoryBottomSheet(context);
                      },
                      genderTap: () {
                        showGenderBottomSheet(context);
                      },
                      filterTap: () {
                        showFilterBottomSheet(context);
                      },
                    ),
                  ),
                  IgnorePointer(
                    ignoring: true,
                    child: ProductsDetail(
                      onTap: () => Navigator.push(context, ViewProductScreen.route()),
                      productsList: productsList,
                      btnText: Languages.of(context).viewProduct,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget imageSlider() {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: AppSizes.setHeight(140),
            autoPlay: false,
            viewportFraction: 0.9,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          items: bannerSliderList.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: DecorationImage(
                      image: AssetImage(item.imagePath ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(18)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: bannerSliderList.asMap().entries.map((entry) {
              int index = entry.key;
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                width: AppSizes.setWidth(15),
                height: AppSizes.setHeight(4),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: currentIndex == index ? CustomAppColor.of(context).icPurple : CustomAppColor.of(context).txtGrey.withOpacityPercent(0.5),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(3),
                  color: currentIndex == index ? CustomAppColor.of(context).icPurple : CustomAppColor.of(context).bgContainer,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget categoryCard() {
    return Container(
      padding: EdgeInsets.only(left: AppSizes.setWidth(10)),
      height: AppSizes.setHeight(111),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          final category = categoryList[index];
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.setWidth(8),
            ),
            child: GestureDetector(
              onTap: () {},
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20), vertical: AppSizes.setHeight(20)),
                    height: AppSizes.setHeight(84),
                    width: AppSizes.setWidth(84),
                    decoration: BoxDecoration(color: category.color, borderRadius: BorderRadius.circular(14)),
                    child: Image.asset(
                      category.imagePath ?? ' ',
                      height: AppSizes.setHeight(44),
                      width: AppSizes.setWidth(44),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: AppSizes.setHeight(4)),
                    child: CommonText(
                      text: category.name ?? '',
                      fontWeight: FontWeight.w600,
                      fontSize: AppSizes.setFontSize(12),
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget trendingCard() {
    return Container(
      padding: EdgeInsets.only(left: AppSizes.setWidth(10)),
      height: AppSizes.setHeight(220),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: trendingDealsList.length,
        itemBuilder: (context, index) {
          final category = trendingDealsList[index];
          return Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                height: AppSizes.setHeight(220),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(8), vertical: AppSizes.setHeight(10)),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).bgScaffold,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: CustomAppColor.of(context).black.withOpacityPercent(0.1),
                            blurRadius: AppSizes.setHeight(10),
                            offset: Offset(0, AppSizes.setHeight(4)),
                          ),
                        ],
                      ),
                      height: AppSizes.setHeight(220),
                      width: AppSizes.setWidth(148),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: AppSizes.setHeight(22), bottom: AppSizes.setHeight(10)),
                            child: Container(
                              height: AppSizes.setHeight(130),
                              width: AppSizes.setWidth(130),
                              decoration: BoxDecoration(
                                color: category.color,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Image.asset(
                                  category.imagePath ?? ' ',
                                  height: AppSizes.setHeight(130),
                                  width: AppSizes.setWidth(130),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: AppSizes.setHeight(5)),
                            child: CommonText(
                              text: category.name ?? '',
                              fontWeight: FontWeight.w600,
                              fontSize: AppSizes.setFontSize(15),
                              textColor: CustomAppColor.of(context).txtBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: AppSizes.setWidth(50),
                top: -AppSizes.setHeight(0),
                child: Container(
                  width: AppSizes.setWidth(70),
                  height: AppSizes.setHeight(22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: CustomAppColor.of(context).bgContainerRed,
                  ),
                  child: Center(
                    child: CommonText(
                      text: "${category.discount} % Off",
                      fontWeight: FontWeight.w700,
                      fontSize: AppSizes.setFontSize(12),
                      textColor: CustomAppColor.of(context).white,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void showSortByBottomSheet(BuildContext context) {
    customBottomSheet(
      isDone: false,
      maxHeightRatio: 0.45,
      context: context,
      title: Languages.of(context).sortBy,
      content: ListView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: sortByList.length,
        itemBuilder: (context, index) {
          final sortByData = sortByList[index];
          return InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: sortByData.label ?? '',
                  fontSize: AppSizes.setFontSize(15),
                  fontWeight: sortByData.isSelected ?? false ? FontWeight.bold : FontWeight.normal,
                  textColor: sortByData.isSelected ?? false ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).txtGrey,
                ),
                Radio<bool>(
                  value: true,
                  groupValue: sortByData.isSelected,
                  onChanged: (value) {
                    Navigator.pop(context);
                  },
                  activeColor: CustomAppColor.of(context).borderPurple,
                ),
              ],
            ),
          );
        },
      ),
      onDone: () {
        Navigator.pop(context);
      },
    );
  }

  void showCategoryBottomSheet(BuildContext context) {
    customBottomSheet(
      context: context,
      title: Languages.of(context).category,
      maxHeightRatio: 0.8,
      content: ListView.builder(
        shrinkWrap: true,
        itemCount: productsCategoryList.length,
        itemBuilder: (context, index) {
          final categoryData = productsCategoryList[index];
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: categoryData.label ?? '',
                fontSize: AppSizes.setFontSize(15),
                fontWeight: categoryData.isSelected ?? false ? FontWeight.w600 : FontWeight.w500,
                textColor: categoryData.isSelected ?? false ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).txtGrey,
              ),
              Checkbox(
                value: categoryData.isSelected,
                onChanged: (value) {},
                activeColor: CustomAppColor.of(context).borderPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          );
        },
      ),
      onDone: () {
        Navigator.pop(context);
      },
    );
  }

  void showGenderBottomSheet(BuildContext context) {
    customBottomSheet(
      context: context,
      title: Languages.of(context).gender,
      maxHeightRatio: 0.7,
      content: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(22)),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 16,
        ),
        itemCount: genderList.length,
        itemBuilder: (context, index) {
          final genderData = genderList[index];
          return Container(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(15)),
            width: AppSizes.setWidth(150),
            height: AppSizes.setHeight(171),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: CustomAppColor.of(context).borderGrey),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(
                      text: genderData.label ?? '',
                      fontSize: AppSizes.setFontSize(15),
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).txtGrey,
                    ),
                    Radio<bool>(
                      value: true,
                      groupValue: genderData.isSelected,
                      onChanged: (value) {
                        Navigator.pop(context);
                      },
                      activeColor: CustomAppColor.of(context).borderPurple,
                    ),
                  ],
                ),
                Expanded(
                  child: Image.asset(
                    genderData.imagePath ?? '',
                    height: AppSizes.setHeight(115),
                    width: AppSizes.setWidth(100),
                    fit: BoxFit.fill,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      onDone: () {
        Navigator.pop(context);
      },
    );
  }

  void showFilterBottomSheet(BuildContext context) {
    int selectedIndex = filterList.indexWhere((filter) => filter.isSelected ?? false);
    if (selectedIndex == -1) {
      selectedIndex = 0;
    }
    customBottomSheet(
      catalogCount: AppStrings.catalogs2,
      isClearVisible: true,
      maxHeightRatio: 0.90,
      context: context,
      isPaddingRequired: false,
      isDone: true,
      title: Languages.of(context).filter.toUpperCase(),
      content: StatefulBuilder(
        builder: (context, setState) {
          return Row(
            children: [
              SizedBox(
                width: AppSizes.setWidth(152),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: filterList.length,
                  itemBuilder: (context, index) {
                    final filter = filterList[index];
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.symmetric(
                          vertical: AppSizes.setHeight(12),
                          horizontal: AppSizes.setWidth(12),
                        ),
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? CustomAppColor.of(context).bgFilter
                              : CustomAppColor.of(context).bgContainerGrey.withOpacityPercent(0.2),
                          border: selectedIndex == index
                              ? Border(
                                  left: BorderSide(
                                    color: CustomAppColor.of(context).borderPurple,
                                    width: 5,
                                  ),
                                )
                              : Border(
                                  bottom: BorderSide(
                                    color: CustomAppColor.of(context).bgContainerGrey.withOpacityPercent(0.5),
                                    width: 0.5,
                                  ),
                                  top: BorderSide(
                                    color: CustomAppColor.of(context).bgContainerGrey.withOpacityPercent(0.5),
                                    width: 0.5,
                                  ),
                                ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: CommonText(
                                text: filter.label ?? '',
                                textColor: selectedIndex == index ? CustomAppColor.of(context).txtPurple : CustomAppColor.of(context).txtGrey,
                                textAlign: TextAlign.start,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis,
                                fontSize: AppSizes.setFontSize(14),
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CommonText(
                        text: filterList[selectedIndex].label?.toUpperCase() ?? ' ',
                        fontWeight: FontWeight.w700,
                        fontSize: AppSizes.setFontSize(17),
                      ),
                      const SizedBox(height: 12),
                      if (filterList[selectedIndex].label == Languages.of(context).colors) ...[
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            ...List.generate(
                              colorList.length,
                              (index) => FilterOptionChip(
                                label: "${colorList[index].label ?? ''} ",
                                isSelected: colorList[index].isSelected ?? false,
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                      ] else if (filterList[selectedIndex].label == 'Size') ...[
                        Expanded(
                          child: Column(
                            children: [
                              CommonTextFormField(
                                radius: 4,
                                borderColor: CustomAppColor.of(context).bgContainerGrey.withOpacityPercent(0.3),
                                leadingIcon: Image.asset(
                                  AppAssets.icSearch,
                                  height: AppSizes.setHeight(24),
                                  width: AppSizes.setWidth(24),
                                  color: CustomAppColor.of(context).txtGrey,
                                ),
                                hintText: Languages.of(context).search,
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: AppSizes.setFontSize(15), color: CustomAppColor.of(context).txtGrey),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: sizeList.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Checkbox(
                                          value: sizeList[index].isSelected,
                                          onChanged: (value) {},
                                          activeColor: CustomAppColor.of(context).borderPurple,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                        ),
                                        CommonText(
                                          text: sizeList[index].label ?? '',
                                          fontSize: AppSizes.setFontSize(15),
                                          fontWeight: sizeList[index].isSelected ?? false ? FontWeight.w600 : FontWeight.w500,
                                          textColor: sizeList[index].isSelected ?? false
                                              ? CustomAppColor.of(context).txtBlack
                                              : CustomAppColor.of(context).txtGrey,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ] else if (filterList[selectedIndex].label == 'Category') ...[
                        Expanded(
                          child: Column(
                            children: [
                              CommonTextFormField(
                                radius: 4,
                                borderColor: CustomAppColor.of(context).bgContainerGrey.withOpacityPercent(0.3),
                                leadingIcon: Image.asset(
                                  AppAssets.icSearch,
                                  height: AppSizes.setHeight(24),
                                  width: AppSizes.setWidth(24),
                                  color: CustomAppColor.of(context).txtGrey,
                                ),
                                hintText: Languages.of(context).search,
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: AppSizes.setFontSize(15), color: CustomAppColor.of(context).txtGrey),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  itemCount: filterCategoryList.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Checkbox(
                                          value: filterCategoryList[index].isSelected,
                                          onChanged: (value) {},
                                          activeColor: CustomAppColor.of(context).borderPurple,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                        ),
                                        CommonText(
                                          text: filterCategoryList[index].label ?? '',
                                          fontSize: AppSizes.setFontSize(15),
                                          fontWeight: sizeList[index].isSelected ?? false ? FontWeight.w600 : FontWeight.w500,
                                          textColor: sizeList[index].isSelected ?? false
                                              ? CustomAppColor.of(context).txtBlack
                                              : CustomAppColor.of(context).txtGrey,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ] else if (filterList[selectedIndex].label == 'Fabric') ...[
                        Expanded(
                          child: Column(
                            children: [
                              CommonTextFormField(
                                radius: 6,
                                borderColor: CustomAppColor.of(context).bgContainerGrey.withOpacityPercent(0.3),
                                leadingIcon: Image.asset(
                                  AppAssets.icSearch,
                                  height: AppSizes.setHeight(24),
                                  width: AppSizes.setWidth(24),
                                  color: CustomAppColor.of(context).txtGrey,
                                ),
                                hintText: Languages.of(context).search,
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: AppSizes.setFontSize(15), color: CustomAppColor.of(context).txtGrey),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: fabricList.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Checkbox(
                                          value: fabricList[index].isSelected,
                                          onChanged: (value) {},
                                          activeColor: CustomAppColor.of(context).borderPurple,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                        ),
                                        CommonText(
                                          text: fabricList[index].label ?? '',
                                          fontSize: AppSizes.setFontSize(15),
                                          fontWeight: fabricList[index].isSelected ?? false ? FontWeight.w600 : FontWeight.w500,
                                          textColor: fabricList[index].isSelected ?? false
                                              ? CustomAppColor.of(context).txtBlack
                                              : CustomAppColor.of(context).txtGrey,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ] else if (filterList[selectedIndex].label == 'Gender') ...[
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: filterGenderList.length,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: filterGenderList[index].isSelected,
                                    onChanged: (value) {},
                                    activeColor: CustomAppColor.of(context).borderPurple,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  CommonText(
                                    text: filterGenderList[index].label ?? '',
                                    fontSize: AppSizes.setFontSize(15),
                                    fontWeight: filterGenderList[index].isSelected ?? false ? FontWeight.w600 : FontWeight.w500,
                                    textColor: filterGenderList[index].isSelected ?? false
                                        ? CustomAppColor.of(context).txtBlack
                                        : CustomAppColor.of(context).txtGrey,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ] else if (filterList[selectedIndex].label == 'Price') ...[
                        Expanded(
                          child: ListView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            children: [
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: List.generate(
                                  priceList.length,
                                  (index) => FilterOptionChip(
                                    label: priceList[index].label ?? '',
                                    isSelected: priceList[index].isSelected ?? false,
                                    onTap: () {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ] else if (filterList[selectedIndex].label == 'Rating') ...[
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: ratingList.length,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: ratingList[index].isSelected,
                                    onChanged: (value) {},
                                    activeColor: CustomAppColor.of(context).borderPurple,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  CommonText(
                                    text: ratingList[index].label ?? '',
                                    fontSize: AppSizes.setFontSize(15),
                                    fontWeight: ratingList[index].isSelected ?? false ? FontWeight.w600 : FontWeight.w500,
                                    textColor: ratingList[index].isSelected ?? false
                                        ? CustomAppColor.of(context).txtBlack
                                        : CustomAppColor.of(context).txtGrey,
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      ] else if (filterList[selectedIndex].label == 'Occasion') ...[
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: occasionList.length,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: occasionList[index].isSelected,
                                    onChanged: (value) {},
                                    activeColor: CustomAppColor.of(context).borderPurple,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  CommonText(
                                    text: occasionList[index].label ?? '',
                                    fontSize: AppSizes.setFontSize(15),
                                    fontWeight: occasionList[index].isSelected ?? false ? FontWeight.w600 : FontWeight.w500,
                                    textColor: occasionList[index].isSelected ?? false
                                        ? CustomAppColor.of(context).txtBlack
                                        : CustomAppColor.of(context).txtGrey,
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      ] else if (filterList[selectedIndex].label == 'Combo') ...[
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: comboList.length,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: comboList[index].isSelected,
                                    onChanged: (value) {},
                                    activeColor: CustomAppColor.of(context).borderPurple,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  CommonText(
                                    text: comboList[index].label ?? '',
                                    fontSize: AppSizes.setFontSize(15),
                                    fontWeight: comboList[index].isSelected ?? false ? FontWeight.w600 : FontWeight.w500,
                                    textColor: comboList[index].isSelected ?? false
                                        ? CustomAppColor.of(context).txtBlack
                                        : CustomAppColor.of(context).txtGrey,
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      ] else if (filterList[selectedIndex].label == 'Discount') ...[
                        Wrap(
                          spacing: 4,
                          runSpacing: 4,
                          children: List.generate(
                            discountList.length,
                            (index) => FilterOptionChip(
                              label: discountList[index].label ?? '',
                              isSelected: discountList[index].isSelected ?? false,
                              onTap: () {},
                            ),
                          ),
                        )
                      ] else if (filterList[selectedIndex].label == 'Reversible') ...[
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: List.generate(
                            reversibleList.length,
                            (index) => FilterOptionChip(
                              label: reversibleList[index].label ?? '',
                              isSelected: reversibleList[index].isSelected ?? false,
                              onTap: () {},
                            ),
                          ),
                        )
                      ] else if (filterList[selectedIndex].label == 'Fit/Shape') ...[
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: fitShapeList.length,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: fitShapeList[index].isSelected,
                                    onChanged: (value) {},
                                    activeColor: CustomAppColor.of(context).borderPurple,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  CommonText(
                                    text: fitShapeList[index].label ?? '',
                                    fontSize: AppSizes.setFontSize(15),
                                    fontWeight: fitShapeList[index].isSelected ?? false ? FontWeight.w600 : FontWeight.w500,
                                    textColor: fitShapeList[index].isSelected ?? false
                                        ? CustomAppColor.of(context).txtBlack
                                        : CustomAppColor.of(context).txtGrey,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ] else if (filterList[selectedIndex].label == 'Material') ...[
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: materialList.length,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: materialList[index].isSelected,
                                    onChanged: (value) {},
                                    activeColor: CustomAppColor.of(context).borderPurple,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  CommonText(
                                    text: materialList[index].label ?? '',
                                    fontSize: AppSizes.setFontSize(15),
                                    fontWeight: materialList[index].isSelected ?? false ? FontWeight.w600 : FontWeight.w500,
                                    textColor: materialList[index].isSelected ?? false
                                        ? CustomAppColor.of(context).txtBlack
                                        : CustomAppColor.of(context).txtGrey,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ] else if (filterList[selectedIndex].label == 'Pattern Type') ...[
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: patternList.length,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: patternList[index].isSelected,
                                    onChanged: (value) {},
                                    activeColor: CustomAppColor.of(context).borderPurple,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  CommonText(
                                    text: patternList[index].label ?? '',
                                    fontSize: AppSizes.setFontSize(15),
                                    fontWeight: patternList[index].isSelected ?? false ? FontWeight.w600 : FontWeight.w500,
                                    textColor: patternList[index].isSelected ?? false
                                        ? CustomAppColor.of(context).txtBlack
                                        : CustomAppColor.of(context).txtGrey,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ] else if (filterList[selectedIndex].label == 'Shade') ...[
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: shadeList.length,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: shadeList[index].isSelected,
                                    onChanged: (value) {},
                                    activeColor: CustomAppColor.of(context).borderPurple,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  CommonText(
                                    text: shadeList[index].label ?? '',
                                    fontSize: AppSizes.setFontSize(15),
                                    fontWeight: shadeList[index].isSelected ?? false ? FontWeight.w600 : FontWeight.w500,
                                    textColor: shadeList[index].isSelected ?? false
                                        ? CustomAppColor.of(context).txtBlack
                                        : CustomAppColor.of(context).txtGrey,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ] else if (filterList[selectedIndex].label == 'Type Of Skin') ...[
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: typeOfSkinList.length,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: typeOfSkinList[index].isSelected,
                                    onChanged: (value) {},
                                    activeColor: CustomAppColor.of(context).borderPurple,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  CommonText(
                                    text: typeOfSkinList[index].label ?? '',
                                    fontSize: AppSizes.setFontSize(15),
                                    fontWeight: typeOfSkinList[index].isSelected ?? false ? FontWeight.w600 : FontWeight.w500,
                                    textColor: typeOfSkinList[index].isSelected ?? false
                                        ? CustomAppColor.of(context).txtBlack
                                        : CustomAppColor.of(context).txtGrey,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ] else if (filterList[selectedIndex].label == 'Concern') ...[
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: concernList.length,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: concernList[index].isSelected,
                                    onChanged: (value) {},
                                    activeColor: CustomAppColor.of(context).borderPurple,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  CommonText(
                                    text: concernList[index].label ?? '',
                                    fontSize: AppSizes.setFontSize(15),
                                    fontWeight: concernList[index].isSelected ?? false ? FontWeight.w600 : FontWeight.w500,
                                    textColor: concernList[index].isSelected ?? false
                                        ? CustomAppColor.of(context).txtBlack
                                        : CustomAppColor.of(context).txtGrey,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ] else if (filterList[selectedIndex].label == 'Heel Type') ...[
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: List.generate(
                            heelTypeList.length,
                            (index) => FilterOptionChip(
                              label: heelTypeList[index].label ?? '',
                              isSelected: heelTypeList[index].isSelected ?? false,
                              onTap: () {},
                            ),
                          ),
                        )
                      ] else if (filterList[selectedIndex].label == 'Bottom Type') ...[
                        Wrap(
                          spacing: 4,
                          runSpacing: 4,
                          children: List.generate(
                            bottomTypeList.length,
                            (index) => FilterOptionChip(
                              label: bottomTypeList[index].label ?? '',
                              isSelected: bottomTypeList[index].isSelected ?? false,
                              onTap: () {},
                            ),
                          ),
                        )
                      ] else if (filterList[selectedIndex].label == 'Warranty Period') ...[
                        Wrap(
                          spacing: 4,
                          runSpacing: 4,
                          children: List.generate(
                            warrantyList.length,
                            (index) => FilterOptionChip(
                              label: warrantyList[index].label ?? '',
                              isSelected: warrantyList[index].isSelected ?? false,
                              onTap: () {},
                            ),
                          ),
                        )
                      ] else if (filterList[selectedIndex].label == 'Brand') ...[
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: warrantyList.length,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: warrantyList[index].isSelected,
                                    onChanged: (value) {},
                                    activeColor: CustomAppColor.of(context).borderPurple,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  CommonText(
                                    text: warrantyList[index].label ?? '',
                                    fontSize: AppSizes.setFontSize(15),
                                    fontWeight: warrantyList[index].isSelected ?? false ? FontWeight.w600 : FontWeight.w500,
                                    textColor: warrantyList[index].isSelected ?? false
                                        ? CustomAppColor.of(context).txtBlack
                                        : CustomAppColor.of(context).txtGrey,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ] else if (filterList[selectedIndex].label == 'Top Type') ...[
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: topTypeList.length,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: topTypeList[index].isSelected,
                                    onChanged: (value) {},
                                    activeColor: CustomAppColor.of(context).borderPurple,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  CommonText(
                                    text: topTypeList[index].label ?? '',
                                    fontSize: AppSizes.setFontSize(15),
                                    fontWeight: topTypeList[index].isSelected ?? false ? FontWeight.w600 : FontWeight.w500,
                                    textColor: topTypeList[index].isSelected ?? false
                                        ? CustomAppColor.of(context).txtBlack
                                        : CustomAppColor.of(context).txtGrey,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ] else if (filterList[selectedIndex].label == 'BackType') ...[
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: backTypeList.length,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: backTypeList[index].isSelected,
                                    onChanged: (value) {},
                                    activeColor: CustomAppColor.of(context).borderPurple,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  CommonText(
                                    text: backTypeList[index].label ?? '',
                                    fontSize: AppSizes.setFontSize(15),
                                    fontWeight: backTypeList[index].isSelected ?? false ? FontWeight.w600 : FontWeight.w500,
                                    textColor: backTypeList[index].isSelected ?? false
                                        ? CustomAppColor.of(context).txtBlack
                                        : CustomAppColor.of(context).txtGrey,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ] else if (filterList[selectedIndex].label == 'Border') ...[
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: borderList.length,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: borderList[index].isSelected,
                                    onChanged: (value) {},
                                    activeColor: CustomAppColor.of(context).borderPurple,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  CommonText(
                                    text: borderList[index].label ?? '',
                                    fontSize: AppSizes.setFontSize(15),
                                    fontWeight: borderList[index].isSelected ?? false ? FontWeight.w600 : FontWeight.w500,
                                    textColor: borderList[index].isSelected ?? false
                                        ? CustomAppColor.of(context).txtBlack
                                        : CustomAppColor.of(context).txtGrey,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ] else if (filterList[selectedIndex].label == 'Bottom Pattern Type') ...[
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: bottomPatternTypeList.length,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: bottomPatternTypeList[index].isSelected,
                                    onChanged: (value) {},
                                    activeColor: CustomAppColor.of(context).borderPurple,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  CommonText(
                                    text: bottomPatternTypeList[index].label ?? '',
                                    fontSize: AppSizes.setFontSize(15),
                                    fontWeight: bottomPatternTypeList[index].isSelected ?? false ? FontWeight.w600 : FontWeight.w500,
                                    textColor: bottomPatternTypeList[index].isSelected ?? false
                                        ? CustomAppColor.of(context).txtBlack
                                        : CustomAppColor.of(context).txtGrey,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ] else if (filterList[selectedIndex].label == 'Bottomwear Fabric') ...[
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: bottomWearFabricList.length,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: bottomWearFabricList[index].isSelected,
                                    onChanged: (value) {},
                                    activeColor: CustomAppColor.of(context).borderPurple,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  CommonText(
                                    text: bottomWearFabricList[index].label ?? '',
                                    fontSize: AppSizes.setFontSize(15),
                                    fontWeight: bottomWearFabricList[index].isSelected ?? false ? FontWeight.w600 : FontWeight.w500,
                                    textColor: bottomWearFabricList[index].isSelected ?? false
                                        ? CustomAppColor.of(context).txtBlack
                                        : CustomAppColor.of(context).txtGrey,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
      onDone: () {
        Navigator.pop(context);
      },
    );
  }
}
