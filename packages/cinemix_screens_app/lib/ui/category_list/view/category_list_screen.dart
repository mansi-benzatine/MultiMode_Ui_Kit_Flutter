import 'package:cinemix_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:cinemix_screens_app/ui/dashboard/view/dashboard_screen.dart';
import 'package:cinemix_screens_app/ui/explore_movie/views/explore_movie_screen.dart' show ExploreMovieScreen;
import 'package:cinemix_screens_app/ui/home/datamodel/home_data.dart';
import 'package:cinemix_screens_app/utils/app_color.dart';
import 'package:cinemix_screens_app/utils/constant.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:cinemix_screens_app/widgets/text/common_text.dart';
import 'package:cinemix_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

class CategoryListScreen extends StatefulWidget {
  final List<Movie> allMovies;
  final String title;
  final bool isFromTopTen;

  static Route<void> route({List<Movie> allMovies = const [], String title = "", bool isFromTopTen = false}) {
    return MaterialPageRoute(
        builder: (_) => CategoryListScreen(
              allMovies: allMovies,
              title: title,
              isFromTopTen: isFromTopTen,
            ));
  }

  const CategoryListScreen({super.key, required this.allMovies, required this.title, this.isFromTopTen = false});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            isShowBack: true,
            title: widget.title,
            isShowSearch: true,
          ),
          SizedBox(height: 15.setHeight),
          Expanded(
            child: Align(
              alignment: Alignment.topLeft,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: widget.isFromTopTen ? 30.setWidth : 20.setWidth),
                  child: Wrap(
                    spacing: widget.isFromTopTen ? 35.setWidth : 10.setWidth,
                    runSpacing: widget.isFromTopTen ? 35.setWidth : 10.setHeight,
                    children: List.generate(widget.allMovies.length, (index) {
                      final movie = widget.allMovies[index];
                      return GestureDetector(
                        onTap: () => Navigator.push(context, ExploreMovieScreen.route(movie: movie)),
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          clipBehavior: Clip.none,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                movie.image,
                                height: widget.isFromTopTen ? 162.setHeight : 180.setHeight,
                                width: widget.isFromTopTen ? 140.setWidth : 155.setHeight,
                                fit: BoxFit.cover,
                              ),
                            ),
                            if (widget.isFromTopTen)
                              Positioned(
                                left: -25,
                                bottom: -25,
                                child: Stack(
                                  children: [
                                    Text(
                                      "${index + 1}",
                                      style: TextStyle(
                                        fontSize: 100.setFontSize,
                                        fontFamily: Constant.fontFamilyClashGroteskSemiBold600,
                                        package: "cinemix_screens_app",
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 4
                                          ..color = Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "${index + 1}",
                                      style: TextStyle(
                                        fontSize: 100.setFontSize,
                                        fontFamily: Constant.fontFamilyClashGroteskSemiBold600,
                                        package: "cinemix_screens_app",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
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
                      );
                    }),
                  ),
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
    if (name == Constant.strSearch) {
      Navigator.push(context, DashboardScreen.route(currentIndex: 1));
    }
  }
}
