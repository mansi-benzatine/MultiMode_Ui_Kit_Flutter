import 'dart:ui';

import 'package:cinemix_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:cinemix_screens_app/ui/category_list/view/category_list_screen.dart';
import 'package:cinemix_screens_app/ui/home/page/continue_watching_list_view.dart';
import 'package:cinemix_screens_app/ui/home/page/language_list_view.dart';
import 'package:cinemix_screens_app/ui/home/page/top_10_list_view.dart';
import 'package:cinemix_screens_app/utils/app_assets.dart';
import 'package:cinemix_screens_app/utils/app_color.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:cinemix_screens_app/utils/utils.dart';
import 'package:cinemix_screens_app/widgets/bottom_sheet/edit_avatar_bottom_sheet.dart';
import 'package:cinemix_screens_app/widgets/bottom_sheet/switch_profile_bottom_sheet.dart';
import 'package:cinemix_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../explore_languages/view/explore_languages_screen.dart';
import '../datamodel/home_data.dart';
import '../page/featured_carousel_view.dart';
import '../page/horizontal_movie_list.dart';
import '../page/movies_category_filter_view.dart';

class HomeScreen extends StatefulWidget {
  final bool isShowSwitchProfileBs;
  final bool isShowEditProfileBs;

  static Route<void> route({bool isShowSwitchProfileBs = false, bool isShowEditProfileBs = false}) {
    return MaterialPageRoute(
      builder: (_) => HomeScreen(
        isShowSwitchProfileBs: isShowSwitchProfileBs,
        isShowEditProfileBs: isShowEditProfileBs,
      ),
    );
  }

  const HomeScreen({
    super.key,
    this.isShowSwitchProfileBs = false,
    this.isShowEditProfileBs = false,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements TopBarClickListener {
  final List<LanguagesList> languagesList = [
    LanguagesList(language: "English", languageImage: AppAssets.imgLanguageDummy),
    LanguagesList(language: "Korean", languageImage: AppAssets.imgLanguageDummy),
    LanguagesList(language: "French", languageImage: AppAssets.imgLanguageDummy),
    LanguagesList(language: "Spanish", languageImage: AppAssets.imgLanguageDummy),
    LanguagesList(language: "Arabic", languageImage: AppAssets.imgLanguageDummy),
    LanguagesList(language: "Russian", languageImage: AppAssets.imgLanguageDummy),
    LanguagesList(language: "Japanese", languageImage: AppAssets.imgLanguageDummy),
  ];
  final List<String> subCategories = ["Movie", "Tv", "Series", "Sport"];
  int selectedIndex = -1;
  bool _isBottomSheetOpen = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.isShowSwitchProfileBs) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _isBottomSheetOpen = true;
        });
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          enableDrag: false,
          isDismissible: true,
          backgroundColor: Colors.transparent,
          builder: (_) => const SwitchProfileBottomSheet(),
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

    if (widget.isShowEditProfileBs) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _isBottomSheetOpen = true;
        });
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          enableDrag: false,
          isDismissible: true,
          backgroundColor: Colors.transparent,
          builder: (context) => EditAvatarBottomSheet(),
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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: PopScope(
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
            bottom: false,
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            buildSelectedCategorySections(),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: TopBar(
                          this,
                          appBarColor: CustomAppColor.of(context).transparent,
                          isShowBack: false,
                          title: "",
                          isShowAppLogo: true,
                          isShowProfile: true,
                          isShowTelecast: true,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20.setHeight),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              if (selectedIndex == -1)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 250),
                                      padding: EdgeInsets.symmetric(
                                        vertical: 8.setHeight,
                                        horizontal: 14.setWidth,
                                      ),
                                      decoration: BoxDecoration(
                                        color: CustomAppColor.of(context).bgTextFormFieldShadow.withValues(alpha: 0.5),
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: CustomAppColor.of(context).border,
                                        ),
                                      ),
                                      child: Row(
                                        children: List.generate(subCategories.length, (index) {
                                          return GestureDetector(
                                            onTap: () => setState(() => selectedIndex = index),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 12.setWidth),
                                              child: CommonText(
                                                text: subCategories[index],
                                                fontFamily: Constant.fontFamilyClashDisplayMedium500,
                                                fontSize: 14.setFontSize,
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  ),
                                ),
                              if (selectedIndex != -1)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 250),
                                      padding: EdgeInsets.symmetric(
                                        vertical: 6.setHeight,
                                        horizontal: 10.setWidth,
                                      ),
                                      decoration: BoxDecoration(
                                        color: CustomAppColor.of(context).bgTextFormFieldShadow.withValues(alpha: 0.5),
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: CustomAppColor.of(context).primary,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          CommonText(
                                            text: subCategories[selectedIndex],
                                            fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
                                            fontSize: 15.setFontSize,
                                            textColor: CustomAppColor.of(context).primary,
                                          ),
                                          GestureDetector(
                                            onTap: () => setState(() => selectedIndex = -1),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 8.0),
                                              child: Icon(
                                                Icons.close,
                                                size: 18,
                                                color: CustomAppColor.of(context).primary,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSelectedCategorySections() {
    final String? selected = selectedIndex == -1 ? null : subCategories[selectedIndex];

    final List<Movie> filtered = selected == null ? movies : movies.where((m) => m.subCategory == selected).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (filtered.any((m) => m.category == "Featured"))
          FeaturedCarousel(
            featuredMovies: filtered.where((m) => m.category == "Featured").toList(),
          ),
        if (filtered.any((m) => m.category == "Featured")) SizedBox(height: 20.setHeight),
        MovieCategoryTabView(allMovies: movies),
        SizedBox(height: 20.setHeight),
        if (filtered.any((m) => m.isTop10))
          TopTenListView(
            title: "Top 10 In USA",
            movies: filtered.where((m) => m.isTop10).toList(),
            showRank: true,
            onSeeAll: () {
              Navigator.push(
                context,
                CategoryListScreen.route(
                  allMovies: filtered.where((m) => m.isTop10).toList(),
                  title: "Top 10 In USA ",
                  isFromTopTen: true,
                ),
              );
            },
          ),
        if (filtered.any((m) => m.isTop10)) SizedBox(height: 20.setHeight),
        if (filtered.any((m) => m.category == "Continue Watching"))
          ContinueWatchingListView(
            title: "Continue Watching",
            movies: filtered.where((m) => m.category == "Continue Watching").toList(),
            onSeeAll: () {
              Navigator.push(
                context,
                CategoryListScreen.route(
                  allMovies: filtered.where((m) => m.category == "Continue Watching").toList(),
                  title: "Continue Watching",
                ),
              );
            },
          ),
        if (filtered.any((m) => m.category == "Continue Watching")) SizedBox(height: 20.setHeight),
        if (filtered.any((m) => m.category == "Popular Movies"))
          HorizontalMovieList(
            title: "Popular Movies",
            movies: filtered.where((m) => m.category == "Popular Movies").toList(),
            onSeeAll: () {
              Navigator.push(
                context,
                CategoryListScreen.route(
                  allMovies: filtered.where((m) => m.category == "Popular Movies").toList(),
                  title: "Popular Movies",
                ),
              );
            },
          ),
        if (filtered.any((m) => m.category == "Popular Movies")) SizedBox(height: 20.setHeight),
        if (filtered.any((m) => m.category == "Movies From The 2010s"))
          HorizontalMovieList(
            title: "Movies From The 2010s",
            movies: filtered.where((m) => m.category == "Movies From The 2010s").toList(),
            onSeeAll: () {
              Navigator.push(
                context,
                CategoryListScreen.route(
                  allMovies: filtered.where((m) => m.category == "Movies From The 2010s").toList(),
                  title: "Movies From The 2010s",
                ),
              );
            },
          ),
        if (filtered.any((m) => m.category == "Movies From The 2010s")) SizedBox(height: 20.setHeight),
        if (filtered.any((m) => m.category == "Superhit Biopic"))
          HorizontalMovieList(
            title: "Superhit Biopic",
            movies: filtered.where((m) => m.category == "Superhit Biopic").toList(),
            onSeeAll: () {
              Navigator.push(
                context,
                CategoryListScreen.route(
                  allMovies: filtered.where((m) => m.category == "Superhit Biopic").toList(),
                  title: "Superhit Biopic",
                ),
              );
            },
          ),
        if (filtered.any((m) => m.category == "Superhit Biopic")) SizedBox(height: 20.setHeight),
        if (filtered.any((m) => m.category == "Best In Comedy"))
          HorizontalMovieList(
            title: "Best In Comedy",
            movies: filtered.where((m) => m.category == "Best In Comedy").toList(),
            onSeeAll: () {
              Navigator.push(
                context,
                CategoryListScreen.route(
                  allMovies: filtered.where((m) => m.category == "Best In Comedy").toList(),
                  title: "Best In Comedy",
                ),
              );
            },
          ),
        if (filtered.any((m) => m.category == "Best In Comedy")) SizedBox(height: 20.setHeight),
        if (filtered.any((m) => m.category == "Non-Stop Sport"))
          HorizontalMovieList(
            title: "Non-Stop Sport",
            width: 180.setWidth,
            height: 120.setHeight,
            movies: filtered.where((m) => m.category == "Non-Stop Sport").toList(),
            onSeeAll: () {
              Navigator.push(
                context,
                CategoryListScreen.route(
                  allMovies: filtered.where((m) => m.category == "Non-Stop Sport").toList(),
                  title: "Non-Stop Sport",
                ),
              );
            },
          ),
        if (filtered.any((m) => m.category == "Non-Stop Sport")) SizedBox(height: 20.setHeight),
        if (filtered.any((m) => m.category == "For Anime Fans"))
          HorizontalMovieList(
            title: "For Anime Fans",
            movies: filtered.where((m) => m.category == "For Anime Fans").toList(),
            onSeeAll: () {
              Navigator.push(
                context,
                CategoryListScreen.route(
                  allMovies: filtered.where((m) => m.category == "For Anime Fans").toList(),
                  title: "For Anime Fans",
                ),
              );
            },
          ),
        if (filtered.any((m) => m.category == "For Anime Fans")) SizedBox(height: 20.setHeight),
        if (filtered.any((m) => m.category == "Action Movies"))
          HorizontalMovieList(
            title: "Action Movies",
            movies: filtered.where((m) => m.category == "Action Movies").toList(),
            onSeeAll: () {
              Navigator.push(
                context,
                CategoryListScreen.route(
                  allMovies: filtered.where((m) => m.category == "Action Movies").toList(),
                  title: "Action Movies",
                ),
              );
            },
          ),
        if (filtered.any((m) => m.category == "Action Movies")) SizedBox(height: 20.setHeight),
        if (filtered.any((m) => m.category == "Popular Show"))
          HorizontalMovieList(
            title: "Popular Shows",
            movies: filtered.where((m) => m.category == "Popular Show").toList(),
            onSeeAll: () {
              Navigator.push(
                context,
                CategoryListScreen.route(
                  allMovies: filtered.where((m) => m.category == "Popular Show").toList(),
                  title: "Popular Shows",
                ),
              );
            },
          ),
        if (filtered.any((m) => m.category == "Popular Show")) SizedBox(height: 20.setHeight),
        LanguageListView(
          language: languagesList,
          title: "Explore In Your Language",
          onSeeAll: () {
            Navigator.push(
                context,
                ExploreLanguagesScreen.route(
                  title: "Explore In Your Language",
                  language: languagesList,
                ));
          },
        ),
        SizedBox(height: 65.setHeight)
      ],
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strProfile) {
      Utils.showBottomSheetDialog(context, widgets: const SwitchProfileBottomSheet());
    }
  }
}
