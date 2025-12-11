import 'package:cinemix_screens_app/utils/app_color.dart';
import 'package:cinemix_screens_app/utils/constant.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:cinemix_screens_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../../explore_movie/views/explore_movie_screen.dart';
import '../datamodel/home_data.dart';

class TopTenListView extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  final bool showRank;
  final VoidCallback? onSeeAll;

  const TopTenListView({
    super.key,
    required this.title,
    required this.movies,
    this.showRank = false,
    this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          child: Row(
            children: [
              CommonText(
                text: title,
                fontSize: 18.setFontSize,
                fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
              ),
              const Spacer(),
              IgnorePointer(
                ignoring: true,
                child: GestureDetector(
                  onTap: onSeeAll,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: CustomAppColor.of(context).cardBorder,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 14.setHeight),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.only(left: 40.setWidth, right: 20.setWidth),
            child: Wrap(
              spacing: 30.setWidth,
              children: List.generate(movies.length, (index) {
                final movie = movies[index];
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
                            height: 162.setHeight,
                            width: 140.setHeight,
                            fit: BoxFit.cover,
                          ),
                        ),
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
                        if (showRank && movie.rank != null)
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
          ),
        )
      ],
    );
  }
}
