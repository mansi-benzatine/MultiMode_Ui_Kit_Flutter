import 'package:cinemix_screens_app/ui/explore_movie/views/explore_movie_screen.dart';
import 'package:cinemix_screens_app/ui/home/datamodel/home_data.dart';
import 'package:cinemix_screens_app/utils/app_color.dart';
import 'package:cinemix_screens_app/utils/constant.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:cinemix_screens_app/utils/utils.dart';
import 'package:cinemix_screens_app/widgets/text/common_text.dart';
import 'package:cinemix_screens_app/widgets/text_field/text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../widgets/bottom_sheet/filter_bottom_sheet.dart';

class SearchScreen extends StatefulWidget {
  final bool isShowFilterBs;
  final bool isShowEmptySearchView;

  const SearchScreen({
    super.key,
    this.isShowFilterBs = false,
    this.isShowEmptySearchView = false,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Movie> results = [];
  final List<Movie> movies = [
    Movie(
      title: "Chhlaawa",
      image: AppAssets.imgGetStarted4,
      category: "Featured",
      rank: 9.8,
    ),
    Movie(
      title: "Miroo",
      image: AppAssets.imgInterest7,
      category: "Continue Watching",
      watchTime: "1h 45min",
      totalTime: "2h 00mim",
      rank: 9.8,
    ),
    Movie(
      title: "Miroo",
      image: AppAssets.imgInterest5,
      category: "Continue Watching",
      watchTime: "2h 40min",
      totalTime: "3h 00mim",
      rank: 9.8,
    ),
    Movie(
      title: "Miroo",
      image: AppAssets.imgInterest3,
      category: "Continue Watching",
      watchTime: "1h 20min",
      totalTime: "3h 00mim",
      rank: 9.8,
    ),
    Movie(
      title: "Miroo",
      image: AppAssets.imgInterest4,
      category: "Continue Watching",
      watchTime: "1h 5min",
      totalTime: "3h 00mim",
      rank: 9.8,
    ),
    Movie(
      title: "Miroo",
      image: AppAssets.imgInterest1,
      category: "Continue Watching",
      watchTime: "1h 55min",
      rank: 9.8,
      totalTime: "2h 00mim",
    ),
    Movie(
      title: "Miroo",
      image: AppAssets.imgInterest6,
      category: "Continue Watching",
      watchTime: "20min",
      totalTime: "1h 00mim",
      rank: 9.8,
    ),
    Movie(
      title: "Miroo",
      image: AppAssets.imgGetStarted3,
      category: "Non-Stop Sport",
      rank: 9.8,
    ),
    Movie(
      title: "Miroo",
      image: AppAssets.imgGetStarted5,
      category: "Non-Stop Sport",
      rank: 9.8,
    ),
    Movie(
      title: "Miroo",
      image: AppAssets.imgGetStarted9,
      category: "Non-Stop Sport",
      rank: 9.8,
    ),
    Movie(
      title: "XO Kitty",
      image: AppAssets.imgGetStarted4,
      category: "Non-Stop Sport",
      rank: 9.8,
    ),
    Movie(
      title: "Miroo",
      image: AppAssets.imgGetStarted3,
      category: "Best In Comedy",
      rank: 9.8,
    ),
    Movie(
      title: "Miroo",
      image: AppAssets.imgGetStarted5,
      category: "Best In Comedy",
      rank: 9.8,
    ),
    Movie(
      title: "Miroo",
      image: AppAssets.imgGetStarted9,
      category: "Best In Comedy",
      rank: 9.8,
    ),
    Movie(
      title: "XO Kitty",
      image: AppAssets.imgGetStarted4,
      category: "Best In Comedy",
      rank: 9.8,
    ),
    Movie(
      title: "Miroo",
      image: AppAssets.imgGetStarted3,
      category: "Superhit Biopic",
      rank: 9.8,
    ),
    Movie(
      title: "Miroo",
      image: AppAssets.imgGetStarted5,
      category: "Superhit Biopic",
      rank: 9.8,
    ),
    Movie(
      title: "Miroo",
      image: AppAssets.imgGetStarted9,
      category: "Superhit Biopic",
      rank: 9.8,
    ),
    Movie(
      title: "XO Kitty",
      image: AppAssets.imgGetStarted4,
      category: "Superhit Biopic",
      rank: 9.8,
    ),
    Movie(
      title: "Miroo",
      image: AppAssets.imgGetStarted3,
      category: "Movies From The 2010s",
      rank: 9.8,
    ),
    Movie(
      title: "Miroo",
      image: AppAssets.imgGetStarted5,
      category: "Movies From The 2010s",
      rank: 9.8,
    ),
    Movie(
      title: "Miroo",
      image: AppAssets.imgGetStarted9,
      category: "Movies From The 2010s",
      rank: 9.8,
    ),
    Movie(
      title: "XO Kitty",
      image: AppAssets.imgGetStarted4,
      category: "Movies From The 2010s",
      rank: 9.8,
    ),
    Movie(
      title: "Miroo",
      image: AppAssets.imgGetStarted3,
      category: "Popular Movies",
      rank: 9.8,
    ),
    Movie(
      title: "Miroo",
      image: AppAssets.imgGetStarted5,
      category: "Popular Movies",
      rank: 9.8,
    ),
    Movie(
      title: "Miroo",
      image: AppAssets.imgGetStarted9,
      category: "Popular Movies",
      rank: 9.8,
    ),
    Movie(
      title: "XO Kitty",
      image: AppAssets.imgGetStarted4,
      category: "Popular Movies",
      rank: 9.8,
    ),
    Movie(
      title: "Miroo",
      image: AppAssets.imgGetStarted3,
      category: "New Release",
      rank: 9.8,
      subCategory: "Movie",
    ),
    Movie(
      title: "Miroo",
      image: AppAssets.imgGetStarted5,
      category: "New Release",
      rank: 9.8,
      subCategory: "Movie",
    ),
    Movie(
      title: "Miroo",
      image: AppAssets.imgGetStarted9,
      category: "New Release",
      rank: 9.8,
      subCategory: "Movie",
    ),
    Movie(
      title: "Miroo",
      image: AppAssets.imgGetStarted5,
      category: "New Release",
      rank: 9.8,
      subCategory: "Show",
    ),
    Movie(
      title: "Miroo",
      image: AppAssets.imgGetStarted9,
      category: "New Release",
      rank: 9.8,
      subCategory: "Series",
    ),
    Movie(
      title: "Miroo",
      image: AppAssets.imgGetStarted5,
      category: "New Release",
      rank: 9.8,
      subCategory: "Anime",
    ),
    Movie(
      title: "Miroo",
      image: AppAssets.imgGetStarted9,
      category: "New Release",
      rank: 9.8,
      subCategory: "Show",
    ),
    Movie(
      title: "XO Kitty",
      image: AppAssets.imgGetStarted4,
      category: "New Release",
      rank: 9.8,
      subCategory: "Movie",
    ),
    Movie(
      title: "XO Kitty",
      image: AppAssets.imgGetStarted4,
      category: "New Release",
      rank: 9.8,
      subCategory: "Drama",
    ),
  ];

  bool _isBottomSheetOpen = false;

  @override
  void initState() {
    super.initState();
    results = movies;

    if (widget.isShowFilterBs) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _isBottomSheetOpen = true;
        });
        Utils.showBottomSheetDialog(
          context,
          isDismissible: true,
          widgets: const SortFilterBottomSheet(),
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

  void _onSearch(String value) {
    setState(() {
      results = movies.where((movie) => movie.title.toLowerCase().contains(value.toLowerCase())).toList();
    });
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.setHeight),
                Row(
                  children: [
                    Expanded(
                      child: CommonTextFormFieldWithPrefix(
                        controller: _controller,
                        onTextChanged: _onSearch,
                        hintText: "Search ...",
                        prefixIcon: AppAssets.icSearch,
                        radius: 12,
                      ),
                    ),
                    SizedBox(width: 10.setWidth),
                    IgnorePointer(
                      ignoring: true,
                      child: GestureDetector(
                        onTap: () {
                          Utils.showBottomSheetDialog(context, widgets: const SortFilterBottomSheet());
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                CustomAppColor.of(context).bgTextFormFieldShadow,
                                CustomAppColor.of(context).bgTextFormFieldShadowLight,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.tune_rounded,
                            color: CustomAppColor.of(context).txtGray,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.setHeight),
                if (!widget.isShowEmptySearchView)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        text: "Recent",
                        fontSize: 16.setFontSize,
                        fontFamily: Constant.fontFamilyClashDisplayMedium500,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: CommonText(
                          text: "Clear All",
                          fontSize: 14.setFontSize,
                          fontWeight: FontWeight.w500,
                          textColor: CustomAppColor.of(context).primary,
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 12.setHeight),
                if (!widget.isShowEmptySearchView)
                  Column(
                    children: [
                      _buildRecentItem("Pushpa 2"),
                      _buildRecentItem("The Monkey King"),
                      _buildRecentItem("Houseful 3"),
                    ],
                  ),
                if (widget.isShowEmptySearchView) const Expanded(child: SearchNotFoundScreen()),
                if (!widget.isShowEmptySearchView)
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.setHeight),
                          CommonText(
                            text: "Recommend For You",
                            fontSize: 16.setFontSize,
                            fontFamily: Constant.fontFamilyClashDisplayMedium500,
                          ),
                          SizedBox(height: 10.setHeight),
                          Wrap(
                            spacing: 12.setWidth,
                            runSpacing: 12.setHeight,
                            children: List.generate(results.length, (index) {
                              final movie = results[index];
                              return IgnorePointer(
                                ignoring: true,
                                child: GestureDetector(
                                  onTap: () => Navigator.push(context, ExploreMovieScreen.route(movie: movie)),
                                  child: Stack(
                                    alignment: Alignment.bottomLeft,
                                    clipBehavior: Clip.none,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.asset(
                                          movie.image,
                                          height: 180.setHeight,
                                          width: 155.setHeight,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      if (movie.rank != null)
                                        Positioned(
                                          right: 5,
                                          top: 5,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: CustomAppColor.of(context).black.withValues(alpha: 0.7),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              vertical: 3.setHeight,
                                              horizontal: 5.setWidth,
                                            ),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.star_outlined,
                                                  size: 10,
                                                  color: Colors.amber,
                                                ),
                                                SizedBox(width: 3.setWidth),
                                                CommonText(
                                                  text: movie.rank.toString(),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  textColor: CustomAppColor.of(context).white,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRecentItem(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.setHeight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonText(
            text: title,
            fontSize: 14,
            textColor: CustomAppColor.of(context).txtGray,
          ),
          Icon(
            Icons.close,
            size: 18,
            color: CustomAppColor.of(context).icGray,
          ),
        ],
      ),
    );
  }
}

class SearchNotFoundScreen extends StatelessWidget {
  const SearchNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.imgSearchNotFound, height: 120.setHeight),
          SizedBox(height: 20.setHeight),
          CommonText(
            text: "Oops! Not Found",
            fontSize: 20.setFontSize,
            fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
            textColor: CustomAppColor.of(context).primary,
          ),
          SizedBox(height: 8.setHeight),
          CommonText(
            text: "Whoops… this information is not available for a moment",
            textAlign: TextAlign.center,
            fontFamily: Constant.fontFamilyClashGroteskMedium500,
            textColor: CustomAppColor.of(context).txtGray,
          ),
        ],
      ),
    );
  }
}
