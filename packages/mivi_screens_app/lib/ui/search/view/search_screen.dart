import 'package:flutter/material.dart';
import 'package:mivi_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:mivi_screens_app/localization/language/languages.dart';
import 'package:mivi_screens_app/utils/app_assets.dart';
import 'package:mivi_screens_app/utils/app_color.dart';
import 'package:mivi_screens_app/utils/sizer_utils.dart';
import 'package:mivi_screens_app/widgets/top_bar/topbar.dart';

import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text_field/text_form_field.dart' show CommonTextFormFieldWithPrefix;

class ExploreData {
  final String exploreImage;
  final String exploreHeading;
  bool isVideo;
  bool isArticle;

  ExploreData({
    required this.exploreHeading,
    required this.exploreImage,
    this.isArticle = false,
    this.isVideo = false,
  });
}

class SearchScreen extends StatefulWidget {
  final bool isForEmptySearchView;

  static Route<void> route({bool isForEmptySearchView = false}) {
    return MaterialPageRoute(
      builder: (_) => SearchScreen(isForEmptySearchView: isForEmptySearchView),
    );
  }

  const SearchScreen({super.key, this.isForEmptySearchView = false});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> implements TopBarClickListener {
  final TextEditingController searchController = TextEditingController();
  List<String> recentSearches = ["Exercise", "Body", "Nutrition", "Baby", "Medical", "Feeding", "Relationship", "Feel"];
  List<ExploreData> exerciseList = [];
  List<ExploreData> nutritionList = [];
  List<ExploreData> filteredNewArrivalList = [];
  bool isSearchPerformed = false;
  bool hasResults = true;

  void _fillData() {
    exerciseList = [
      ExploreData(exploreHeading: "Pregnancy Exercises", exploreImage: AppAssets.imgRecentProject2),
      ExploreData(exploreHeading: "Exercises safely during Pregnancy", exploreImage: AppAssets.imgRecentProject2),
      ExploreData(exploreHeading: "Pregnancy Exercises", exploreImage: AppAssets.imgRecentProject2),
    ];
    nutritionList = [
      ExploreData(exploreHeading: "Nutrients for pregnant women", exploreImage: AppAssets.imgRecentProject2),
      ExploreData(exploreHeading: "Nutrients for pregnant women", exploreImage: AppAssets.imgRecentProject2),
      ExploreData(exploreHeading: "Nutrients for pregnant women", exploreImage: AppAssets.imgRecentProject2),
    ];
  }

  @override
  void initState() {
    super.initState();
    _fillData();
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
              Column(
                children: [
                  TopBar(
                    this,
                    isShowBack: true,
                    title: Languages.of(context).txtSearch,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                    child: CommonTextFormFieldWithPrefix(
                      controller: searchController,
                      hintText: "Search ...",
                      onSubmitted: _onSearch,
                      prefixIcon: AppAssets.icSearch,
                      fillColor: CustomAppColor.of(context).transparent,
                      radius: 8,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: widget.isForEmptySearchView ?  _emptyStateWidget() : _buildInitialContent(),
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
              AppAssets.icSearchNotFound,
              height: 120.setHeight,
              width: 120.setWidth,
            ),
            SizedBox(height: 15.setHeight),
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
                      backgroundColor: CustomAppColor.of(context).bgScreen.withValues(alpha: 0.5),
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
        _headingView(heading: Languages.of(context).txtPhotos),
        _gridList(exploreList: exerciseList),
        SizedBox(height: 15.setHeight),
        _headingView(heading: Languages.of(context).txtVideos),
        _gridList(exploreList: nutritionList),
        SizedBox(height: 55.setHeight),
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
        _headingView(heading: Languages.of(context).txtTemplates),
        _gridList(exploreList: filteredNewArrivalList),
      ],
    );
  }

  Widget _gridList({required List<ExploreData> exploreList}) {
    final screenWidth = MediaQuery.of(context).size.width;
    const crossAxisCount = 2;
    const spacing = 12.0;

    final itemWidth = (screenWidth - (20.setWidth * 2) - (crossAxisCount - 1) * spacing) / crossAxisCount;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.setWidth,
          right: 20.setWidth,
        ),
        child: Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: exploreList.map((item) {
            return SizedBox(
              width: itemWidth,
              height: itemWidth,
              child: _buildTemplateCard(item),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildTemplateCard(ExploreData item) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Stack(
        children: [
          Image.asset(
            item.exploreImage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black.withValues(alpha: 0.8)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.5, 0.9],
              ),
            ),
          ),
          Positioned(
            left: 10.setWidth,
            bottom: 10.setHeight,
            right: 10.setWidth,
            child: CommonText(
              text: item.exploreHeading,
              textColor: Colors.white,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w600,
              maxLines: 1,
              fontSize: 12.setFontSize,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
