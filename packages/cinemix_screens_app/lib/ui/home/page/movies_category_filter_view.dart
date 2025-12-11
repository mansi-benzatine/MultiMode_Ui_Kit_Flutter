import 'package:cinemix_screens_app/ui/new_release/views/new_release_screen.dart';
import 'package:cinemix_screens_app/utils/app_color.dart';
import 'package:cinemix_screens_app/utils/constant.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:cinemix_screens_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

import '../datamodel/home_data.dart';
import 'horizontal_movie_list.dart';

class MovieCategoryTabView extends StatefulWidget {
  final List<Movie> allMovies;
  const MovieCategoryTabView({super.key, required this.allMovies});

  @override
  State<MovieCategoryTabView> createState() => _MovieCategoryTabViewState();
}

class _MovieCategoryTabViewState extends State<MovieCategoryTabView> {
  final List<String> categories = [
    "All",
    "Movie",
    "Show",
    "Series",
    "Anime",
    "Drama",
  ];
  int selectedIndex = 0;

  List<Movie> get filteredMovies {
    if (selectedIndex == 0) return widget.allMovies;
    final selectedCategory = categories[selectedIndex];
    return widget.allMovies.where((m) => m.subCategory == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          child: Row(
            children: [
              CommonText(
                text: "New Release",
                fontSize: 18.setFontSize,
                fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
              ),
              const Spacer(),
              IgnorePointer(
                ignoring: true,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, NewReleaseScreen.route(allMovies: widget.allMovies));
                  },
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
        SizedBox(
          height: 45.setHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final isSelected = index == selectedIndex;
              return GestureDetector(
                onTap: () {
                  setState(() => selectedIndex = index);
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 22.setWidth),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CommonText(
                        text: categories[index],
                        textColor: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).hintText,
                        fontFamily: Constant.fontFamilyClashDisplayMedium500,
                        fontSize: 14.setFontSize,
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        height: isSelected ? 3.setHeight : 0,
                        width: 25.setWidth,
                        child: Icon(
                          Icons.arrow_drop_up_rounded,
                          color: isSelected ? CustomAppColor.of(context).primary : Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        HorizontalMovieList(
          title: "",
          movies: filteredMovies,
          isShowTitle: false,
        ),
      ],
    );
  }
}
