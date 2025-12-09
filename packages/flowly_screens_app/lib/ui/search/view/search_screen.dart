import 'package:flowly_screens_app/localization/language/languages.dart';
import 'package:flowly_screens_app/ui/explore_self_care/view/explore_self_care_screen.dart';
import 'package:flowly_screens_app/ui/home/datamodel/home_data.dart';
import 'package:flowly_screens_app/utils/app_assets.dart';
import 'package:flowly_screens_app/utils/app_color.dart';
import 'package:flowly_screens_app/utils/constant.dart';
import 'package:flowly_screens_app/utils/sizer_utils.dart';
import 'package:flowly_screens_app/widgets/text/common_text.dart';
import 'package:flowly_screens_app/widgets/text_field/text_form_field.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  final bool isForEmptyView;
  final bool isForSearchedView;

  static Route<void> route({
    bool isForEmptyView = false,
    bool isForSearchedView = false,
  }) {
    return MaterialPageRoute(
      builder: (_) => SearchScreen(
        isForEmptyView: isForEmptyView,
        isForSearchedView: isForSearchedView,
      ),
    );
  }

  const SearchScreen({super.key, this.isForEmptyView = false, this.isForSearchedView = false});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();

  List<String> searchHistory = ["Period pain", "Back pain"];

  List<SuggestedForYouModel> allList = [
    SuggestedForYouModel(
      title: "Period pain relief",
      imageName: AppAssets.imgSelfCare3,
      subTitle: "Lorem description",
      duration: "5:48",
      isVideo: true,
    ),
    SuggestedForYouModel(
      title: "Foot massage to relieve cramps",
      imageName: AppAssets.imgSelfCare2,
      subTitle: "Lorem description",
    ),
    SuggestedForYouModel(
      title: "Period hack",
      imageName: AppAssets.imgSelfCare1,
      subTitle: "Lorem description",
    ),
  ];

  List<SuggestedForYouModel> matchedList = [];

  @override
  void initState() {
    super.initState();

    searchController.addListener(() {
      filterSearchResults(searchController.text);
    });
  }

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() => matchedList = []);
      return;
    }

    setState(() {
      matchedList = allList.where((item) => item.title.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  void addToHistory(String text) {
    if (text.isEmpty) return;
    if (!searchHistory.contains(text)) {
      searchHistory.insert(0, text);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          IgnorePointer(
            ignoring: true,
            child: Padding(
              padding: EdgeInsets.only(top: 45.setHeight, left: 20.setWidth, right: 20.setWidth, bottom: 10.setHeight),
              child: CommonTextFormFieldWithPrefix(
                controller: searchController,
                hintText: Languages.of(context).txtSearch,
                prefixIcon: AppAssets.icBack,
                onPrefixClick: () => Navigator.pop(context),
                prefixIconColor: CustomAppColor.of(context).black,
                radius: 12,
                fillColor: CustomAppColor.of(context).cardBg,
              ),
            ),
          ),
          Expanded(
            child: IgnorePointer(
              ignoring: true,
              child: buildSearchStateUI(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearchStateUI() {
    String query = searchController.text;

    // Case 1 → Manually forced Empty View
    if (widget.isForEmptyView) {
      return buildNotFoundUI();
    }

    // Case 2 → Manually forced Searched View
    if (widget.isForSearchedView) {
      searchController.text = "Period";
      return buildMatchedUI();
    }

    // Normal Conditions (default behavior)
    if (query.isEmpty) {
      return buildHistoryUI();
    }

    if (matchedList.isEmpty) {
      return buildNotFoundUI();
    }

    return buildMatchedUI();
  }

  Widget buildHistoryUI() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: Languages.of(context).txtHistory,
                fontFamily: Constant.fontFamilyMulishExtraBold800,
                fontSize: 16.setFontSize,
              ),
              GestureDetector(
                onTap: () {
                  searchHistory.clear();
                  setState(() {});
                },
                child: CommonText(
                  text: Languages.of(context).txtClearAll,
                  textColor: CustomAppColor.of(context).primary,
                  fontSize: 14.setFontSize,
                  fontFamily: Constant.fontFamilyMulishSemiBold600,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10.setHeight),
              itemCount: searchHistory.length,
              itemBuilder: (_, i) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 8.setHeight),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        text: searchHistory[i],
                        fontSize: 14.setFontSize,
                        textColor: CustomAppColor.of(context).txtGray,
                      ),
                      GestureDetector(
                        onTap: () {
                          searchHistory.removeAt(i);
                          setState(() {});
                        },
                        child: Icon(
                          Icons.close,
                          size: 18,
                          color: CustomAppColor.of(context).txtGray,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMatchedUI() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 20.setWidth, right: 5.setWidth, top: 10.setHeight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              children: matchedList.map((item) {
                return GestureDetector(
                  onTap: () {
                    addToHistory(searchController.text);
                    Navigator.push(context, ExploreSelfCareScreen.route(selfCare: item));
                  },
                  child: Container(
                    height: 184.setHeight,
                    width: 150.setWidth,
                    margin: EdgeInsets.only(right: 15.setWidth, bottom: 15.setHeight),
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).cardBg,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: CustomAppColor.of(context).black.withValues(alpha: 0.08),
                          blurRadius: 20,
                          spreadRadius: 2,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          child: Image.asset(
                            item.imageName,
                            height: 140.setHeight,
                            width: 150.setWidth,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.setWidth, vertical: 6.setHeight),
                          child: CommonText(
                            text: item.title,
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            fontFamily: Constant.fontFamilyMulishBold700,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 12.setFontSize,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildNotFoundUI() {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 0.screenHeight / 3.5),
        child: Column(
          children: [
            Image.asset(
              AppAssets.icSearchNotFound,
              height: 80,
            ),
            SizedBox(height: 20.setHeight),
            CommonText(
              text: Languages.of(context).txtSearchNotFound,
              fontFamily: Constant.fontFamilyMulishExtraBold800,
              fontSize: 20,
            ),
            SizedBox(height: 10.setHeight),
            CommonText(
              text: Languages.of(context).txtSearchNotFoundDesc,
              textAlign: TextAlign.center,
              textColor: CustomAppColor.of(context).txtGray,
            )
          ],
        ),
      ),
    );
  }
}
