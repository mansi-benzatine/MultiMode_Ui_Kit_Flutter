import 'package:cinemix_app/interfaces/top_bar_click_listener.dart';
import 'package:cinemix_app/localization/language/languages.dart';
import 'package:cinemix_app/ui/fullscreen/view/fullscreen_screen.dart';
import 'package:cinemix_app/ui/home/datamodel/home_data.dart';
import 'package:cinemix_app/ui/home/page/horizontal_movie_list.dart';
import 'package:cinemix_app/utils/app_assets.dart';
import 'package:cinemix_app/utils/app_color.dart';
import 'package:cinemix_app/utils/constant.dart';
import 'package:cinemix_app/utils/sizer_utils.dart';
import 'package:cinemix_app/utils/utils.dart';
import 'package:cinemix_app/widgets/alert_dialog/download_alert_dialog.dart';
import 'package:cinemix_app/widgets/alert_dialog/review_alert_dialog.dart';
import 'package:cinemix_app/widgets/bottom_sheet/share_bottom_sheet.dart';
import 'package:cinemix_app/widgets/text/common_text.dart';
import 'package:cinemix_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

class ExploreMovieScreen extends StatefulWidget {
  final Movie movie;
  final bool isFromContinueWatching;

  static Route<void> route({required Movie movie, bool isFromContinueWatching = false}) {
    return MaterialPageRoute(
      builder: (_) => ExploreMovieScreen(
        movie: movie,
        isFromContinueWatching: isFromContinueWatching,
      ),
    );
  }

  const ExploreMovieScreen({super.key, required this.movie, this.isFromContinueWatching = false});

  @override
  State<ExploreMovieScreen> createState() => _ExploreMovieScreenState();
}

class _ExploreMovieScreenState extends State<ExploreMovieScreen> implements TopBarClickListener {
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
  bool isWatching = false;
  bool isPlaying = true;

  double _getProgress(String? watchTime, String? totalTime) {
    if (watchTime == null || totalTime == null) return 0;
    int toMinutes(String time) {
      int h = 0, m = 0;
      if (time.contains('h')) {
        var parts = time.split('h');
        h = int.tryParse(parts[0].trim()) ?? 0;
        if (parts.length > 1) {
          m = int.tryParse(parts[1].replaceAll('min', '').trim()) ?? 0;
        }
      } else {
        m = int.tryParse(time.replaceAll('min', '').trim()) ?? 0;
      }
      return h * 60 + m;
    }

    final watched = toMinutes(watchTime);
    final total = toMinutes(totalTime);
    return total > 0 ? watched / total : 0;
  }

  @override
  void initState() {
    super.initState();
    isWatching = widget.isFromContinueWatching;
  }

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;

    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            isShowBack: true,
            title: "",
            isShowShare: true,
            isShowRating: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(movie),
                  _buildMovieInfo(movie),
                  _buildButtons(),
                  _buildDescription(movie),
                  _buildCast(movie.cast),
                  movie.subCategory == "Series"
                      ? HorizontalMovieList(
                          title: "Episodes",
                          width: 180.setWidth,
                          height: 120.setHeight,
                          movies: movies.where((m) => m.category == "New Release").toList(),
                        )
                      : const SizedBox(),
                  SizedBox(height: 14.setHeight),
                  HorizontalMovieList(
                    title: "More Like This",
                    movies: movies.where((m) => m.category == "New Release").toList(),
                  ),
                  HorizontalMovieList(
                    title: "More Like This",
                    movies: movies.where((m) => m.category == "Continue Watching").toList(),
                    isShowTitle: false,
                  ),
                  SizedBox(height: 55.setHeight)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(Movie movie) {
    double progress = _getProgress(movie.watchTime, movie.totalTime);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              movie.image,
              width: double.infinity,
              height: 200.setHeight,
              fit: BoxFit.cover,
            ),
            if (isWatching)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    AppAssets.icSkipBack,
                    height: 32.setHeight,
                    width: 32.setHeight,
                  ),
                  Icon(
                    Icons.play_arrow_rounded,
                    color: CustomAppColor.of(context).white,
                    size: 60,
                  ),
                  Image.asset(
                    AppAssets.icSkipForward,
                    height: 32.setHeight,
                    width: 32.setHeight,
                  ),
                ],
              ),
            if (isWatching)
              Positioned(
                bottom: 10.setHeight,
                right: 20.setWidth,
                left: 20.setWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppAssets.icGauge,
                          height: 16.setHeight,
                          width: 16.setHeight,
                        ),
                        SizedBox(width: 5.setWidth),
                        CommonText(
                          text: "Speed(1x)",
                          fontSize: 12.setFontSize,
                          fontFamily: Constant.fontFamilyClashGroteskMedium500,
                          textColor: CustomAppColor.of(context).white,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          AppAssets.icLock,
                          height: 16.setHeight,
                          width: 16.setHeight,
                        ),
                        SizedBox(width: 5.setWidth),
                        CommonText(
                          text: "Sperre",
                          fontSize: 12.setFontSize,
                          fontFamily: Constant.fontFamilyClashGroteskMedium500,
                          textColor: CustomAppColor.of(context).white,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          AppAssets.icMsg,
                          height: 16.setHeight,
                          width: 16.setHeight,
                        ),
                        SizedBox(width: 5.setWidth),
                        CommonText(
                          text: "Subtitle",
                          fontSize: 12.setFontSize,
                          fontFamily: Constant.fontFamilyClashGroteskMedium500,
                          textColor: CustomAppColor.of(context).white,
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(context, FullscreenScreen.route(movie: movie)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.screen_rotation_rounded,
                            size: 16,
                            color: CustomAppColor.of(context).white,
                          ),
                          SizedBox(width: 5.setWidth),
                          CommonText(
                            text: "Zoom",
                            fontSize: 12.setFontSize,
                            fontFamily: Constant.fontFamilyClashGroteskMedium500,
                            textColor: CustomAppColor.of(context).white,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            if (isWatching)
              Positioned(
                bottom: 30.setHeight,
                left: 20.setWidth,
                right: 20.setWidth,
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            height: 3.setHeight,
                            width: 0.screenWidth,
                            decoration: BoxDecoration(
                              color: Colors.grey.withValues(alpha: 0.4),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          Container(
                            height: 3.setHeight,
                            width: 0.screenWidth * progress,
                            decoration: BoxDecoration(
                              color: CustomAppColor.of(context).primary,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5.setWidth),
                    CommonText(
                      text: movie.totalTime ?? '',
                      textColor: CustomAppColor.of(context).white,
                      fontSize: 11.setFontSize,
                      fontFamily: Constant.fontFamilyClashDisplayMedium500,
                    ),
                  ],
                ),
              ),
          ],
        ),
        Positioned(
          bottom: -22.setHeight,
          right: 16,
          child: isWatching
              ? const SizedBox()
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      movie.isAddedInMyList = !movie.isAddedInMyList;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: movie.isAddedInMyList ? CustomAppColor.of(context).primary : CustomAppColor.of(context).bgScreen,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: movie.isAddedInMyList ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtBlack,
                        width: 0.6,
                      ),
                    ),
                    child: Icon(
                      movie.isAddedInMyList ? Icons.check : Icons.add,
                      size: 26,
                      color: movie.isAddedInMyList ? CustomAppColor.of(context).white : CustomAppColor.of(context).icBlackWhite,
                    ),
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildMovieInfo(Movie movie) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 6.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: movie.title,
            fontSize: 34.setFontSize,
            fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
          ),
          Row(
            children: [
              CommonText(
                text: movie.year,
                fontFamily: Constant.fontFamilyClashGroteskMedium500,
              ),
              SizedBox(width: 15.setWidth),
              Container(
                height: 3.setHeight,
                width: 3.setWidth,
                color: CustomAppColor.of(context).txtBlack,
              ),
              SizedBox(width: 8.setWidth),
              Row(
                children: [
                  Wrap(
                    direction: Axis.horizontal,
                    children: [
                      for (int i = 0; i < movie.languages.length; i++) ...[
                        Row(
                          children: [
                            CommonText(
                              text: movie.languages[i],
                              fontFamily: Constant.fontFamilyClashGroteskMedium500,
                            ),
                            if (i != movie.languages.length - 1) ...[
                              SizedBox(width: 8.setWidth),
                              Container(
                                height: 3.setHeight,
                                width: 3.setWidth,
                                color: CustomAppColor.of(context).txtBlack,
                              ),
                              SizedBox(width: 8.setWidth),
                            ],
                          ],
                        ),
                      ],
                    ],
                  ),
                ],
              ),
              SizedBox(width: 12.setWidth),
              Container(
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).btnGrey,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8.setWidth, vertical: 2.setHeight),
                child: Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    SizedBox(width: 2.setWidth),
                    CommonText(
                      text: movie.rank.toString(),
                      fontSize: 10.setFontSize,
                      fontFamily: Constant.fontFamilyClashDisplayMedium500,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.setHeight),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).btnGrey,
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.symmetric(horizontal: 5.setWidth, vertical: 2.setHeight),
                child: CommonText(
                  text: "U/A 20+",
                  fontSize: 10.setFontSize,
                  fontFamily: Constant.fontFamilyClashDisplayMedium500,
                ),
              ),
              SizedBox(width: 10.setWidth),
              Wrap(
                direction: Axis.horizontal,
                children: [
                  for (int i = 0; i < movie.genres.length; i++) ...[
                    Row(
                      children: [
                        CommonText(
                          text: movie.genres[i],
                          fontFamily: Constant.fontFamilyClashGroteskMedium500,
                        ),
                        if (i != movie.genres.length - 1) ...[
                          SizedBox(width: 8.setWidth),
                          Container(
                            height: 12.setHeight,
                            width: 1.setWidth,
                            color: CustomAppColor.of(context).txtBlack,
                          ),
                          SizedBox(width: 8.setWidth),
                        ],
                      ],
                    ),
                  ],
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return (!isWatching)
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setHeight, vertical: 5.setHeight),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isWatching = true;
                      isPlaying = true;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: 46.setHeight,
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).primary,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.play_arrow_rounded,
                            color: CustomAppColor.of(context).white,
                          ),
                          SizedBox(width: 8.setWidth),
                          CommonText(
                            text: Languages.of(context).txtWatchNow,
                            textColor: CustomAppColor.of(context).white,
                            fontSize: 16.setFontSize,
                            fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.setHeight),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return DownloadAlertDialog(parentContext: context);
                      },
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 46.setHeight,
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).transparent,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: CustomAppColor.of(context).txtBlack,
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.download_rounded,
                            color: CustomAppColor.of(context).icBlackWhite,
                          ),
                          SizedBox(width: 8.setWidth),
                          CommonText(
                            text: Languages.of(context).txtDownload,
                            textColor: CustomAppColor.of(context).txtBlack,
                            fontSize: 16.setFontSize,
                            fontFamily: Constant.fontFamilyClashDisplayMedium500,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : const SizedBox();
  }

  Widget _buildDescription(Movie movie) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
      child: CommonText(
        // text: movie.description ?? '',
        text: Languages.of(context).txtDummyText,
        fontSize: 12.setFontSize,
        textColor: CustomAppColor.of(context).txtGray,
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget _buildCast(List<Cast> castList) {
    return Padding(
      padding: EdgeInsets.only(top: 8.setHeight, bottom: 20.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: "Cast",
                  fontSize: 16.setFontSize,
                  fontFamily: Constant.fontFamilyClashDisplayMedium500,
                ),
                Icon(
                  Icons.navigate_next_rounded,
                  color: CustomAppColor.of(context).icGray,
                )
              ],
            ),
          ),
          SizedBox(height: 12.setHeight),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(right: 20.setWidth),
              child: Wrap(
                spacing: 0,
                children: List.generate(
                  castList.length,
                  (index) {
                    final cast = castList[index];
                    return Container(
                      margin: EdgeInsets.only(left: 15.setWidth),
                      child: Column(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              cast.image,
                              height: 70.setHeight,
                              width: 70.setWidth,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 6.setHeight),
                          SizedBox(
                            width: 60.setWidth,
                            child: CommonText(
                              text: cast.name,
                              fontSize: 12.setFontSize,
                              fontFamily: Constant.fontFamilyClashDisplayMedium500,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
    if (name == Constant.strRating) {
      showDialog(
        context: context,
        builder: (context) {
          return const ReviewAlertDialog();
        },
      );
    }
    if (name == Constant.strShare) {
      Utils.showBottomSheetDialog(context, widgets: const ShareBottomSheet());
    }
  }
}
