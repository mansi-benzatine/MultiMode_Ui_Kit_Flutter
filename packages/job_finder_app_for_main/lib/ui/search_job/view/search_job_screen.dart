import 'package:flutter/material.dart';
import 'package:job_finder_app_package_for_main/utils/utils.dart';

import '../../../../../../localization/language/languages.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/constant.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/text/common_text.dart';
import '../../../../../../widgets/top_bar/topbar.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../utils/app_assets.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../filter_options/view/filter_options_screen.dart';
import '../../home/datamodel/home_data.dart';

class SearchJobScreen extends StatefulWidget {
  const SearchJobScreen({super.key});
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const SearchJobScreen());
  }

  @override
  State<SearchJobScreen> createState() => _SearchJobScreenState();
}

class _SearchJobScreenState extends State<SearchJobScreen> implements TopBarClickListener {
  List<String> recentSearchList = [];
  List<JobDetailsModel> recentlyViewedList = [];
  List<JobDetailsModel> searchList = [];

  void fillData() {
    recentSearchList = ["Product Manager", "UX Designer", "Product Designer"];
    searchList = [
      JobDetailsModel(
        jobProfileImagePath: AppAssets.icAvatarTwitch,
        jobName: "UI/UX Designer",
        jobType: ["Full-Time"],
        salary: "4500",
        city: "United States",
      ),
      JobDetailsModel(
        jobProfileImagePath: AppAssets.icAvatarVkontakte,
        jobName: "Web Designer",
        jobType: ["Part-Time"],
        salary: "3200",
        city: "New York City",
      ),
      JobDetailsModel(
        jobProfileImagePath: AppAssets.icAvatarMeetup,
        jobName: "Visual Designer",
        companyName: "Google",
        jobType: ["Freelance"],
        salary: "6400",
        city: "Los Angels",
        state: " US",
      ),
      JobDetailsModel(
        jobProfileImagePath: AppAssets.icAvatarXing,
        jobName: "Full Stack Designer",
        jobType: ["Full-Time"],
        salary: "9600",
        city: "California",
        state: " USA",
      ),
      JobDetailsModel(
        jobProfileImagePath: AppAssets.icAvatarAcademia,
        jobName: "Graphics Designer",
        jobType: ["Full-Time"],
        salary: "4500",
        city: "United States",
      ),
      JobDetailsModel(
        jobProfileImagePath: AppAssets.icAvatarTwitch,
        jobName: "UI/UX Designer",
        jobType: ["Part-Time"],
        salary: "3200",
        city: "New York City",
      ),
    ];
    recentlyViewedList = [
      JobDetailsModel(
        jobProfileImagePath: AppAssets.icAvatarTwitch,
        jobName: "UI/UX Designer",
        jobType: ["Full-Time"],
        salary: "4500",
        city: "United States",
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtSearch,
            isShowTitle: true,
            textColor: CustomAppColor.of(context).txtSecondaryWhite,
            isShowCancel: true,
            iconColor: CustomAppColor.of(context).bgDetailsCard,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _SearchAndFilterView(
                    recentSearch: searchList,
                    recentSearches: recentSearchList,
                    recentViewed: recentlyViewedList,
                  ),
                ],
              ),
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

class _SearchAndFilterView extends StatefulWidget {
  final List<JobDetailsModel> recentSearch;
  final List<JobDetailsModel> recentViewed;
  final List<String> recentSearches;
  const _SearchAndFilterView({required this.recentSearch, required this.recentSearches, required this.recentViewed});

  @override
  State<_SearchAndFilterView> createState() => _SearchAndFilterViewState();
}

class _SearchAndFilterViewState extends State<_SearchAndFilterView> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<JobDetailsModel> _filteredJobs = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterJobs);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _filterJobs() {
    String query = _searchController.text.toLowerCase().trim();
    setState(() {
      _filteredJobs = query.isEmpty ? [] : widget.recentSearch.where((job) => job.jobName.toLowerCase().contains(query)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isSearching = _searchController.text.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 16.setWidth),
                  child: CommonTextFormFieldWithPrefix(
                    controller: _searchController,
                    focusNode: _focusNode,
                    hintText: Languages.of(context).txtSearchAJobOrPosition,
                    prefixIcon: AppAssets.icSearch,
                    fillColor: CustomAppColor.of(context).bgTextFormFieldGreySecondary,
                    hintTextFontSize: 14.setFontSize,
                    hintFontWeight: FontWeight.w400,
                    hintWordSpacing: 0.1,
                    borderColor: CustomAppColor.of(context).transparent,
                    prefixIconColor: CustomAppColor.of(context).icGrey,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(context, FilterOptionsScreen.route()),
                child: Container(
                  width: 52.setWidth,
                  height: 52.setHeight,
                  padding: EdgeInsets.symmetric(vertical: 12.setHeight, horizontal: 12.setWidth),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: CustomAppColor.of(context).icPrimary,
                  ),
                  child: Image.asset(
                    AppAssets.icFilter,
                    height: 24.setHeight,
                    width: 24.setWidth,
                  ),
                ),
              ),
            ],
          ),
          isSearching
              ? (_filteredJobs.isNotEmpty ? _SearchedView(recentViewList: _filteredJobs) : const _EmptySearchView())
              : _SearchingView(
                  recentSearchList: widget.recentSearches,
                  recentViewList: widget.recentViewed,
                ),
        ],
      ),
    );
  }
}

class _SearchingView extends StatelessWidget {
  final List<String> recentSearchList;
  final List<JobDetailsModel> recentViewList;
  const _SearchingView({required this.recentSearchList, required this.recentViewList});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.setHeight),
        CommonText(
          text: Languages.of(context).txtRecentSearches,
          fontWeight: FontWeight.w700,
          fontSize: 16.setFontSize,
          textColor: CustomAppColor.of(context).txtSecondaryWhite,
        ),
        SizedBox(height: 10.setHeight),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: recentSearchList.length,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final jobType = recentSearchList[index];
            return Container(
              height: 44.setHeight,
              width: 280.setWidth,
              padding: EdgeInsets.symmetric(vertical: 10.setHeight),
              decoration: BoxDecoration(
                  color: CustomAppColor.of(context).bgScreenWhite,
                  border: Border(bottom: BorderSide(color: CustomAppColor.of(context).containerGrey))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    AppAssets.icHistory,
                    width: 16.setWidth,
                    height: 16.setHeight,
                    color: CustomAppColor.of(context).icGrey,
                  ),
                  SizedBox(width: 14.setWidth),
                  Expanded(
                    child: CommonText(
                      text: jobType,
                      textAlign: TextAlign.start,
                      fontSize: 13.setFontSize,
                      textColor: CustomAppColor.of(context).txtGrey,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Image.asset(
                    AppAssets.icClose,
                    width: 14.setWidth,
                    height: 14.setHeight,
                    color: CustomAppColor.of(context).icGrey,
                  ),
                ],
              ),
            );
          },
        ),
        SizedBox(height: 25.setHeight),
        CommonText(
          text: Languages.of(context).txtRecentlyViewed,
          fontWeight: FontWeight.w700,
          fontSize: 16.setFontSize,
          textColor: CustomAppColor.of(context).txtSecondaryWhite,
        ),
        SizedBox(height: 10.setHeight),
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          itemCount: recentViewList.length,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final jobType = recentViewList[index];
            return Container(
              width: 280.setWidth,
              padding: EdgeInsets.symmetric(vertical: 20.setHeight, horizontal: 15.setWidth),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 8),
                    blurRadius: 20,
                    spreadRadius: 0,
                    color: CustomAppColor.of(context).black.withOpacityPercent(.04),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                color: CustomAppColor.of(context).bgWhiteSecondary,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    jobType.jobProfileImagePath,
                    height: 50.setHeight,
                    width: 50.setWidth,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: 20.setWidth),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: CommonText(
                                text: jobType.jobName,
                                textAlign: TextAlign.start,
                                fontSize: 16.setFontSize,
                                textColor: CustomAppColor.of(context).txtBlack,
                                fontWeight: FontWeight.w700,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 10.setWidth),
                            CommonText(
                              text: "\$${jobType.salary}/m",
                              fontSize: 12.setFontSize,
                              fontWeight: FontWeight.w500,
                              textColor: CustomAppColor.of(context).txtGrey,
                            ),
                          ],
                        ),
                        SizedBox(height: 10.setHeight),
                        Row(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AppAssets.icJobTitle,
                                  width: 15.setWidth,
                                  height: 15.setHeight,
                                  color: CustomAppColor.of(context).icPrimary,
                                ),
                                SizedBox(width: 4.setWidth),
                                CommonText(
                                  text: jobType.jobType.first,
                                  fontSize: 12.setFontSize,
                                  textColor: CustomAppColor.of(context).txtGrey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                            SizedBox(width: 16.setWidth),
                            Row(
                              children: [
                                Image.asset(
                                  AppAssets.icLocation,
                                  width: 15.setWidth,
                                  height: 15.setHeight,
                                  color: CustomAppColor.of(context).icPrimary,
                                ),
                                SizedBox(width: 4.setWidth),
                                Row(
                                  children: [
                                    CommonText(
                                      text: jobType.city,
                                      fontSize: 12.setFontSize,
                                      fontWeight: FontWeight.w400,
                                      textColor: CustomAppColor.of(context).txtGrey,
                                    ),
                                    Visibility(
                                      visible: jobType.state != null,
                                      child: CommonText(
                                        text: ",${jobType.state}",
                                        fontSize: 12.setFontSize,
                                        fontWeight: FontWeight.w400,
                                        textColor: CustomAppColor.of(context).txtGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class _SearchedView extends StatelessWidget {
  final List<JobDetailsModel> recentViewList;

  const _SearchedView({required this.recentViewList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.setHeight),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: "177 Jobs Found",
                fontSize: 14.setFontSize,
                fontWeight: FontWeight.w500,
                textColor: CustomAppColor.of(context).txtSecondary,
              ),
              Image.asset(
                AppAssets.icSwap,
                height: 18.setHeight,
                width: 18.setWidth,
              )
            ],
          ),
        ),
        SizedBox(height: 10.setHeight),
        ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.zero,
          itemCount: recentViewList.length,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final jobType = recentViewList[index];

            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.setWidth),
              child: Container(
                height: 80.setHeight,
                width: 280.setWidth,
                padding: EdgeInsets.symmetric(vertical: 10.setHeight, horizontal: 15.setWidth),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 8),
                      blurRadius: 20,
                      spreadRadius: 0,
                      color: CustomAppColor.of(context).black.withOpacityPercent(.04),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: CustomAppColor.of(context).bgWhiteSecondary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      jobType.jobProfileImagePath,
                      height: 50.setHeight,
                      width: 50.setWidth,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 20.setWidth),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: CommonText(
                                  text: jobType.jobName,
                                  textAlign: TextAlign.start,
                                  fontSize: 16.setFontSize,
                                  textColor: CustomAppColor.of(context).txtSecondaryWhite,
                                  fontWeight: FontWeight.w700,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(width: 10.setWidth),
                              CommonText(
                                text: "\$${jobType.salary}/m",
                                fontSize: 12.setFontSize,
                                fontWeight: FontWeight.w500,
                                textColor: CustomAppColor.of(context).txtGrey,
                              ),
                            ],
                          ),
                          SizedBox(height: 10.setHeight),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    AppAssets.icJobTitle,
                                    width: 15.setWidth,
                                    height: 15.setHeight,
                                    color: CustomAppColor.of(context).icPrimary,
                                  ),
                                  SizedBox(width: 4.setWidth),
                                  CommonText(
                                    text: jobType.jobType.first,
                                    fontSize: 12.setFontSize,
                                    textColor: CustomAppColor.of(context).txtGrey,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                              SizedBox(width: 16.setWidth),
                              Row(
                                children: [
                                  Image.asset(
                                    AppAssets.icLocation,
                                    width: 15.setWidth,
                                    height: 15.setHeight,
                                    color: CustomAppColor.of(context).icPrimary,
                                  ),
                                  SizedBox(width: 4.setWidth),
                                  Row(
                                    children: [
                                      CommonText(
                                        text: jobType.city,
                                        fontSize: 12.setFontSize,
                                        fontWeight: FontWeight.w400,
                                        textColor: CustomAppColor.of(context).txtGrey,
                                      ),
                                      Visibility(
                                        visible: jobType.state != null,
                                        child: CommonText(
                                          text: ",${jobType.state}",
                                          fontSize: 12.setFontSize,
                                          fontWeight: FontWeight.w400,
                                          textColor: CustomAppColor.of(context).txtGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _EmptySearchView extends StatelessWidget {
  const _EmptySearchView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 146.setHeight),
          Image.asset(
            AppAssets.imgBgNoSearchFound,
            width: 175.setWidth,
            height: 197.setHeight,
          ),
          SizedBox(height: 25.setHeight),
          CommonText(
            text: Languages.of(context).txtNoResultsFound,
            fontWeight: FontWeight.w700,
            fontSize: 18.setFontSize,
            textColor: CustomAppColor.of(context).txtSecondary,
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: Languages.of(context).txtTheSearchCouldNotBeFound,
            fontWeight: FontWeight.w400,
            fontSize: 11.setFontSize,
            textColor: CustomAppColor.of(context).txtGrey,
          ),
        ],
      ),
    );
  }
}
