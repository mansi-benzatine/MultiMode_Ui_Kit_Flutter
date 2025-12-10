import 'package:baby_bloom_screens_app/localization/language/languages.dart';
import 'package:baby_bloom_screens_app/utils/app_assets.dart';
import 'package:baby_bloom_screens_app/utils/app_color.dart';
import 'package:baby_bloom_screens_app/utils/sizer_utils.dart';
import 'package:baby_bloom_screens_app/widgets/text_field/text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../explore/datamodel/explore_data.dart';

class SearchScreen extends StatefulWidget {
  final int currentViewIndex;
  static Route<void> route({int currentViewIndex = 0}) {
    return MaterialPageRoute(
      builder: (_) => SearchScreen(currentViewIndex: currentViewIndex),
    );
  }

  const SearchScreen({super.key, this.currentViewIndex = 0});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  List<String> recentSearches = ["Exercise", "Body", "Nutrition", "Baby", "Medical", "Feeding", "Relationship", "Feel"];
  List<ExploreData> exerciseList = [];
  List<ExploreData> nutritionList = [];
  List<ExploreData> filteredNewArrivalList = [];
  bool isSearchPerformed = false;
  bool hasResults = true;

  void _fillData() {
    exerciseList = [
      ExploreData(exploreHeading: "Pregnancy Exercises", exploreImage: AppAssets.imgArticle1),
      ExploreData(exploreHeading: "Exercises safely during Pregnancy", exploreImage: AppAssets.imgArticle1),
      ExploreData(exploreHeading: "Pregnancy Exercises", exploreImage: AppAssets.imgArticle1),
    ];
    nutritionList = [
      ExploreData(exploreHeading: "Nutrients for pregnant women", exploreImage: AppAssets.imgArticle3),
      ExploreData(exploreHeading: "Nutrients for pregnant women", exploreImage: AppAssets.imgArticle3),
      ExploreData(exploreHeading: "Nutrients for pregnant women", exploreImage: AppAssets.imgArticle3),
    ];
  }

  @override
  void initState() {
    super.initState();
    _fillData();
    if (widget.currentViewIndex == 1) {
      searchController.text = "Pregnancy";
      _onSearch("Pregnancy");
    }
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
      filteredNewArrivalList = exerciseList.where((item) {
        final name = item.exploreHeading.toLowerCase();

        return name.contains(query.toLowerCase());
      }).toList();

      hasResults = filteredNewArrivalList.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              SizedBox(height: 40.setHeight),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 15.setWidth),
                child: Row(
                  children: [
                    IgnorePointer(
                      ignoring: true,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Image.asset(
                          AppAssets.icBack,
                          color: CustomAppColor.of(context).icBlackWhite,
                          height: 24.setHeight,
                          width: 24.setWidth,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.setWidth),
                    Expanded(
                      child: CommonTextFormFieldWithPrefix(
                        controller: searchController,
                        hintText: "Search ...",
                        onSubmitted: _onSearch,
                        prefixIcon: AppAssets.icSearch,
                        radius: 8,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: widget.currentViewIndex == 0
                  ? _buildInitialContent()
                  : widget.currentViewIndex == 1
                      ? _buildSearchResults()
                      : _emptyStateWidget(),
            ),
          ),
        ],
      ),
    );
  }

  _headingView({required String heading}) {
    return Padding(
      padding: EdgeInsets.only(left: 20.setWidth, bottom: 10.setHeight),
      child: CommonText(
        text: heading,
        textAlign: TextAlign.start,
        fontFamily: Constant.fontFamilySemiBold600,
        fontSize: 18.setFontSize,
      ),
    );
  }

  Widget _emptyStateWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.setWidth),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 150.setHeight),
            Image.asset(
              AppAssets.icSearch,
              height: 120.setHeight,
              width: 120.setWidth,
              color: CustomAppColor.of(context).icGray,
            ),
            SizedBox(height: 5.setHeight),
            CommonText(
              text: Languages.of(context).txtSearchNotFound,
              fontSize: 18.setFontSize,
              fontFamily: Constant.fontFamilyBold700,
            ),
            SizedBox(height: 10.setHeight),
            CommonText(
              text: Languages.of(context).txtSearchNotFoundDesc,
              fontSize: 14.setFontSize,
              textColor: CustomAppColor.of(context).txtLightGrey,
            ),
            SizedBox(height: 8.setHeight),
          ],
        ),
      ),
    );
  }

  Widget _buildInitialContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
          child: Wrap(
            spacing: 6,
            alignment: WrapAlignment.start,
            children: recentSearches
                .map((item) => Chip(
                      visualDensity: VisualDensity.compact,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.2, color: CustomAppColor.of(context).icBlackWhite.withValues(alpha: 0.2)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: CustomAppColor.of(context).setYourDueDateBtn.withValues(alpha: 0.5),
                      label: CommonText(
                        text: item,
                        fontFamily: Constant.fontFamilyMedium500,
                        fontSize: 12.setFontSize,
                      ),
                      deleteIcon: const Icon(Icons.close, size: 18),
                      onDeleted: () => setState(() => recentSearches.remove(item)),
                    ))
                .toList(),
          ),
        ),
        _headingView(heading: Languages.of(context).txtExercise),
        _cardListView(exploreList: exerciseList),
        _headingView(heading: Languages.of(context).txtNutrition),
        _cardListView(exploreList: nutritionList),
      ],
    );
  }

  Widget _buildSearchResults() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
          child: Wrap(
            spacing: 6,
            alignment: WrapAlignment.start,
            children: recentSearches
                .map((item) => Chip(
                      visualDensity: VisualDensity.compact,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.2, color: CustomAppColor.of(context).icBlackWhite.withValues(alpha: 0.2)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: CustomAppColor.of(context).grey.withValues(alpha: 0.5),
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
        _headingView(heading: Languages.of(context).txtExercise),
        _cardListView(exploreList: filteredNewArrivalList),
      ],
    );
  }

  _cardListView({required List<ExploreData> exploreList}) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, bottom: 10.setHeight),
        child: Wrap(
          spacing: 12,
          children: exploreList.map((item) {
            return Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: CustomAppColor.of(context).txtBlack.withValues(alpha: 0.3),
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          item.exploreImage,
                          fit: BoxFit.cover,
                          height: 136.setHeight,
                          width: 146.setWidth,
                        ),
                      ),
                      SizedBox(height: 3.setHeight),
                      SizedBox(
                        width: 146.setWidth,
                        child: CommonText(
                          text: item.exploreHeading,
                          fontSize: 14.setFontSize,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          fontFamily: Constant.fontFamilySemiBold600,
                        ),
                      ),
                      SizedBox(
                        width: 146.setWidth,
                        child: CommonText(
                          text: Languages.of(context).txtDummy,
                          fontSize: 10.setFontSize,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          textColor: CustomAppColor.of(context).txtLightGrey,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 20.setHeight,
                  left: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).black.withValues(alpha: 0.3),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 4.setHeight,
                      horizontal: 8.setWidth,
                    ),
                    child: item.isArticle
                        ? Row(
                            children: [
                              Image.asset(
                                AppAssets.icArticle,
                                height: 16.setHeight,
                                width: 16.setWidth,
                              ),
                              SizedBox(width: 6.setWidth),
                              CommonText(
                                text: "Article",
                                fontSize: 10.setFontSize,
                                fontFamily: Constant.fontFamilyMedium500,
                                textColor: CustomAppColor.of(context).white,
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Image.asset(
                                AppAssets.icVideo,
                                height: 16.setHeight,
                                width: 16.setWidth,
                              ),
                              SizedBox(width: 6.setWidth),
                              CommonText(
                                text: "Video",
                                fontSize: 10.setFontSize,
                                fontFamily: Constant.fontFamilyMedium500,
                                textColor: CustomAppColor.of(context).white,
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
