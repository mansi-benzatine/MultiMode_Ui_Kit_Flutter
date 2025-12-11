import 'package:cinemix_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:cinemix_screens_app/localization/language/languages.dart';
import 'package:cinemix_screens_app/ui/dashboard/view/dashboard_screen.dart';
import 'package:cinemix_screens_app/ui/explore_movie/views/explore_movie_screen.dart';
import 'package:cinemix_screens_app/ui/home/datamodel/home_data.dart';
import 'package:cinemix_screens_app/utils/app_assets.dart';
import 'package:cinemix_screens_app/utils/app_color.dart';
import 'package:cinemix_screens_app/utils/constant.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:cinemix_screens_app/widgets/text/common_text.dart';
import 'package:cinemix_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

class MyListScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const MyListScreen());
  }

  const MyListScreen({super.key});

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> implements TopBarClickListener {
  String selectedTab = "All";

  List<String> tabs = ["All", "Movie", "Show", "Series", "Anime", "Sport"];

  @override
  Widget build(BuildContext context) {
    List<Movie> filteredList = selectedTab == "All" ? movies : movies.where((item) => item.subCategory == selectedTab).toList();

    return Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: Column(children: [
          TopBar(
            this,
            title: Languages.of(context).txtMyList,
            isShowBack: true,
            isShowSearch: true,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.setHeight,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 20.setWidth),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: tabs.length,
                    itemBuilder: (context, index) {
                      String tab = tabs[index];
                      bool isSelected = selectedTab == tab;

                      return GestureDetector(
                        onTap: () => setState(() => selectedTab = tab),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonText(
                                text: tab,
                                textColor: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtGray,
                                fontFamily: Constant.fontFamilyClashDisplayMedium500,
                                fontSize: 16,
                              ),
                              if (isSelected)
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 250),
                                  height: isSelected ? 3.setHeight : 0,
                                  width: 25.setWidth,
                                  child: Icon(
                                    Icons.arrow_drop_up_rounded,
                                    color: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).transparent,
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
                  child: filteredList.isNotEmpty
                      ? ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                          shrinkWrap: true,
                          itemCount: filteredList.length,
                          separatorBuilder: (_, __) => Divider(height: 0.5, color: CustomAppColor.of(context).dividerColor),
                          itemBuilder: (context, index) {
                            final item = filteredList[index];

                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.setHeight),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      item.image,
                                      height: 120.setHeight,
                                      width: 120.setWidth,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 12.setWidth),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 15.setHeight),
                                        CommonText(
                                          text: item.title,
                                          fontSize: 16.setFontSize,
                                          fontFamily: Constant.fontFamilyClashDisplayMedium500,
                                        ),
                                        SizedBox(height: 4.setHeight),
                                        CommonText(
                                          text: "2h 20min",
                                          textColor: CustomAppColor.of(context).txtLightGrey,
                                          fontSize: 12.setFontSize,
                                        ),
                                        SizedBox(height: 10.setHeight),
                                        IgnorePointer(
                                          ignoring: true,
                                          child: GestureDetector(
                                            child: Container(
                                              padding: EdgeInsets.symmetric(vertical: 6.setHeight, horizontal: 8.setWidth),
                                              decoration: BoxDecoration(
                                                color: CustomAppColor.of(context).btnPrimary,
                                                borderRadius: BorderRadius.circular(30),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(
                                                    Icons.play_arrow,
                                                    color: CustomAppColor.of(context).white,
                                                    size: 18,
                                                  ),
                                                  SizedBox(width: 4.setWidth),
                                                  CommonText(
                                                    text: "Watch Now",
                                                    textColor: Colors.white,
                                                    fontSize: 11.setFontSize,
                                                    fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            onTap: () => Navigator.push(context, ExploreMovieScreen.route(movie: item)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        movies.remove(item);
                                      });
                                    },
                                    child: Image.asset(
                                      AppAssets.icTrash,
                                      height: 20.setHeight,
                                      width: 20.setWidth,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      : Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                            child: Column(
                              children: [
                                SizedBox(height: 150.setHeight),
                                Image.asset(
                                  AppAssets.imgEmpty,
                                  width: 200.setWidth,
                                  height: 200.setHeight,
                                ),
                                CommonText(
                                  text: "Oops! Not Found ",
                                  fontSize: 24.setFontSize,
                                  fontFamily: Constant.fontFamilyClashDisplayMedium500,
                                  textColor: CustomAppColor.of(context).txtPrimary,
                                ),
                                CommonText(
                                  text: Languages.of(context).txtDummyText,
                                  fontSize: 12.setFontSize,
                                  textColor: CustomAppColor.of(context).txtGray,
                                )
                              ],
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.setHeight)
        ]));
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
    if (name == Constant.strSearch) {
      Navigator.push(context, DashboardScreen.route(currentIndex: 1));
    }
  }
}
