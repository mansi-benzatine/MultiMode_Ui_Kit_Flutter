import 'package:cinemix_screens_app/ui/explore_movie/views/explore_movie_screen.dart';
import 'package:cinemix_screens_app/utils/app_color.dart';
import 'package:cinemix_screens_app/utils/constant.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:cinemix_screens_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../datamodel/home_data.dart';

class HorizontalMovieList extends StatelessWidget {
  final String title;
  final List<Movie> movies;

  final VoidCallback? onSeeAll;
  final bool isShowTitle;
  final double width;
  final double height;

  const HorizontalMovieList({
    super.key,
    required this.title,
    required this.movies,
    this.isShowTitle = true,
    this.onSeeAll,
    this.width = 150,
    this.height = 150,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isShowTitle
            ? Padding(
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
              )
            : const SizedBox(),
        SizedBox(height: 14.setHeight),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth),
            child: Wrap(
              spacing: 12.setWidth,
              runSpacing: 12.setHeight,
              children: movies.map((movie) {
                return IgnorePointer(
                  ignoring: true,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, ExploreMovieScreen.route(movie: movie));
                    },
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            movie.image,
                            height: height.setHeight,
                            width: width.setWidth,
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
                              padding: EdgeInsets.symmetric(vertical: 3.setHeight, horizontal: 5.setWidth),
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
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
