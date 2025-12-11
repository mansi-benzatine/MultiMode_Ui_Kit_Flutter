import 'package:cinemix_screens_app/utils/app_color.dart';
import 'package:cinemix_screens_app/utils/constant.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:cinemix_screens_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../../explore_movie/views/explore_movie_screen.dart';
import '../datamodel/home_data.dart';

class ContinueWatchingListView extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  final bool showRank;
  final VoidCallback? onSeeAll;

  const ContinueWatchingListView({
    super.key,
    required this.title,
    required this.movies,
    this.showRank = false,
    this.onSeeAll,
  });

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
            padding: EdgeInsets.only(left: 20.setWidth),
            child: Wrap(
              spacing: 12.setWidth,
              runSpacing: 12.setHeight,
              children: movies.map((movie) {
                double progress = _getProgress(movie.watchTime, movie.totalTime);

                return IgnorePointer(
                  ignoring: true,
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, ExploreMovieScreen.route(movie: movie, isFromContinueWatching: true)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                movie.image,
                                height: 130.setHeight,
                                width: 240.setHeight,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              height: 130.setHeight,
                              width: 240.setHeight,
                              decoration: BoxDecoration(
                                color: CustomAppColor.of(context).black.withValues(alpha: 0.4),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            Positioned(
                              right: 5,
                              top: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: CustomAppColor.of(context).black.withValues(alpha: 0.7),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 5.setHeight,
                                  horizontal: 5.setWidth,
                                ),
                                child: Icon(
                                  Icons.more_horiz,
                                  size: 12,
                                  color: CustomAppColor.of(context).white,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: CustomAppColor.of(context).primary,
                                ),
                                color: CustomAppColor.of(context).black.withValues(alpha: 0.5),
                              ),
                              padding: const EdgeInsets.all(3),
                              child: Icon(
                                Icons.play_arrow_sharp,
                                color: CustomAppColor.of(context).primary,
                              ),
                            ),
                            Positioned(
                              bottom: 10.setHeight,
                              left: 10.setWidth,
                              right: 10.setWidth,
                              child: Column(
                                children: [
                                  CommonText(
                                    text: movie.totalTime ?? '',
                                    textColor: CustomAppColor.of(context).white,
                                    fontSize: 11.setFontSize,
                                    fontFamily: Constant.fontFamilyClashDisplayMedium500,
                                  ),
                                  SizedBox(height: 5.setHeight),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 3.setHeight,
                                        width: 220.setHeight,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withValues(alpha: 0.4),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                      Container(
                                        height: 3.setHeight,
                                        width: 220.setHeight * progress,
                                        decoration: BoxDecoration(
                                          color: CustomAppColor.of(context).primary,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }
}
