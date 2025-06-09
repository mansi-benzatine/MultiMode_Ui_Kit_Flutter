import 'package:flutter/material.dart';
import 'package:goozzy_e_commerce_app_package/utils/utils.dart';

import '../../../../../../interfaces/top_bar_click_listener.dart';
import '../../../../../../localization/language/languages.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../utils/string_constant.dart';
import '../../../../../../widgets/textfield/common_textformfield.dart';
import '../../../../../../widgets/topbar/topbar.dart';
import '../../../utils/app_assets.dart';
import '../../../widgets/text/common_text.dart';
import '../datamodel/search_data.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SearchScreen());
  }

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> implements TopBarClickListener {
  List<String> recentSearchList = [];
  List<String> filteredSearchList = [];
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    fillData();
    searchController.addListener(_onSearchChanged);
  }

  void fillData() {
    recentSearchList = ["Banarasi Saree", "Dinner Set", "Designer Kurta Set"];
    filteredSearchList = List.from(recentSearchList);
  }

  void _onSearchChanged() {
    setState(() {
      String query = searchController.text.trim().toLowerCase();
      if (query.isEmpty) {
        filteredSearchList = List.from(recentSearchList);
        isSearching = false;
      } else {
        filteredSearchList = recentSearchList.where((item) => item.toLowerCase().contains(query)).toList();
        isSearching = true;
      }
    });
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgBlackWhiteScaffold,
      body: Column(
        children: [
          TopBar(
            this,
            isShowBack: true,
            title: Languages.of(context).search,
            textColor: CustomAppColor.of(context).txtBlack,
            topBarColor: CustomAppColor.of(context).bgBlackWhiteScaffold,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(10), horizontal: AppSizes.setWidth(22)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
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
                        controller: searchController,
                        leadingIcon: Image.asset(
                          AppAssets.icSearch,
                          height: AppSizes.setHeight(18),
                          width: AppSizes.setWidth(18),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            AppAssets.icVoice,
                            scale: 3,
                          ),
                        ),
                        borderColor: CustomAppColor.of(context).transparent,
                        hintText: Languages.of(context).searchHere,
                      ),
                    ),
                    _buildSearchResults(),
                    if (!isSearching) trendingCard(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    if (filteredSearchList.isEmpty) {
      return const EmptyView();
    }
    return _SearchingView(recentSearchList: filteredSearchList);
  }

  Widget trendingCard() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: Languages.of(context).recentlyViewed,
          fontWeight: FontWeight.w700,
          fontSize: AppSizes.setFontSize(16),
        ),
        SizedBox(
          height: AppSizes.setHeight(210),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (context, index) {
              final category = recentlyViewedList[index];
              return Padding(
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
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void onTopBarClick(String name, {String value = ""}) {
    if (name == AppStrings.back) {
      Navigator.pop(context);
    }
  }
}

class _SearchingView extends StatelessWidget {
  final List<String> recentSearchList;

  const _SearchingView({required this.recentSearchList});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppSizes.setHeight(20)),
        CommonText(
          text: Languages.of(context).recentSearches,
          fontWeight: FontWeight.w700,
          fontSize: AppSizes.setFontSize(16),
        ),
        SizedBox(height: AppSizes.setHeight(10)),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: recentSearchList.length,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final jobType = recentSearchList[index];
            return Container(
              height: AppSizes.setHeight(44),
              width: AppSizes.setWidth(280),
              padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(10)),
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: CustomAppColor.of(context).containerBorder))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    AppAssets.icHistory,
                    width: AppSizes.setWidth(16),
                    height: AppSizes.setHeight(16),
                    color: CustomAppColor.of(context).borderGrey,
                  ),
                  SizedBox(width: AppSizes.setWidth(14)),
                  Expanded(
                    child: CommonText(
                      text: jobType,
                      textAlign: TextAlign.start,
                      fontSize: AppSizes.setFontSize(13),
                      textColor: CustomAppColor.of(context).txtGrey,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    Icons.close,
                    color: CustomAppColor.of(context).borderGrey,
                  )
                ],
              ),
            );
          },
        ),
        SizedBox(height: AppSizes.setHeight(24)),
      ],
    );
  }
}

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: AppSizes.setHeight(104)),
        Image.asset(
          AppAssets.imgEmptySearch,
          width: AppSizes.setWidth(250),
          height: AppSizes.setHeight(180),
        ),
        Padding(
          padding: EdgeInsets.only(top: AppSizes.setHeight(20)),
          child: CommonText(
            text: Languages.of(context).searchNotFound,
            fontWeight: FontWeight.w700,
            fontSize: AppSizes.setFontSize(20),
            textColor: CustomAppColor.of(context).txtPurple,
          ),
        ),
        SizedBox(height: AppSizes.setHeight(10)),
        CommonText(
          text: Languages.of(context).searchNotFoundDesc,
          fontWeight: FontWeight.w400,
          textColor: CustomAppColor.of(context).txtGrey,
          fontSize: AppSizes.setFontSize(15),
        ),
      ],
    );
  }
}
