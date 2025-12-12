import 'package:cinemix_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:cinemix_screens_app/localization/language/languages.dart';
import 'package:cinemix_screens_app/ui/dashboard/view/dashboard_screen.dart';
import 'package:cinemix_screens_app/utils/app_color.dart';
import 'package:cinemix_screens_app/utils/constant.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:cinemix_screens_app/widgets/alert_dialog/delete_download_alert_dialog.dart';
import 'package:cinemix_screens_app/widgets/text/common_text.dart';
import 'package:cinemix_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../explore_movie/views/explore_movie_screen.dart';
import '../../home/datamodel/home_data.dart';

class DownloadsScreen extends StatefulWidget {
  final bool isShowDeleteAlert;

  static Route<void> route({bool isShowDeleteAlert = false}) {
    return MaterialPageRoute(
      builder: (_) => DownloadsScreen(isShowDeleteAlert: isShowDeleteAlert),
    );
  }

  const DownloadsScreen({
    super.key,
    this.isShowDeleteAlert = false,
  });

  @override
  State<DownloadsScreen> createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends State<DownloadsScreen> implements TopBarClickListener {
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isShowDeleteAlert) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          barrierDismissible: true,
          context: context,
          builder: (dialogContext) {
            return PopScope(
              canPop: false,
              onPopInvokedWithResult: (didPop, result) {
                if (!didPop) {
                  Navigator.pop(dialogContext);
                  Navigator.pop(context);
                }
              },
              child: DeleteDownloadAlertDialog(
                movie: movies[1],
              ),
            );
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtDownload,
            isShowSearch: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: movies.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.setHeight),
                        Wrap(
                          spacing: 16.setWidth,
                          runSpacing: 16.setHeight,
                          children: List.generate(movies.length, (index) {
                            final movie = movies[index];
                            return IgnorePointer(
                              ignoring: true,
                              child: GestureDetector(
                                onTap: () => Navigator.push(context, ExploreMovieScreen.route(movie: movie)),
                                child: Stack(
                                  alignment: Alignment.center,
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
                                    Positioned(
                                      right: 5,
                                      top: 5,
                                      child: IgnorePointer(
                                        ignoring: true,
                                        child: GestureDetector(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: CustomAppColor.of(context).black.withValues(alpha: 0.7),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            padding: const EdgeInsets.all(5),
                                            child: Image.asset(
                                              AppAssets.icTrash,
                                              height: 14.setHeight,
                                              width: 14.setWidth,
                                            ),
                                          ),
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return DeleteDownloadAlertDialog(movie: movie);
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: CustomAppColor.of(context).black.withValues(alpha: 0.7),
                                        shape: BoxShape.circle,
                                      ),
                                      padding: const EdgeInsets.all(5),
                                      child: Icon(
                                        Icons.play_arrow_rounded,
                                        color: CustomAppColor.of(context).white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
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
          ),
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strSearch) {
      Navigator.push(context, DashboardScreen.route(currentIndex: 1));
    }
  }
}
