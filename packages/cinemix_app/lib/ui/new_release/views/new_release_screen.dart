import 'package:cinemix_app/interfaces/top_bar_click_listener.dart';
import 'package:cinemix_app/ui/explore_movie/views/explore_movie_screen.dart';
import 'package:cinemix_app/utils/app_color.dart';
import 'package:cinemix_app/utils/constant.dart';
import 'package:cinemix_app/utils/sizer_utils.dart';
import 'package:cinemix_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../../widgets/text/common_text.dart';
import '../../dashboard/view/dashboard_screen.dart';
import '../../home/datamodel/home_data.dart';

class NewReleaseScreen extends StatefulWidget {
  final List<Movie> allMovies;
  static Route<void> route({List<Movie> allMovies = const []}) {
    return MaterialPageRoute(builder: (_) => NewReleaseScreen(allMovies: allMovies));
  }

  const NewReleaseScreen({super.key, required this.allMovies});

  @override
  State<NewReleaseScreen> createState() => _NewReleaseScreenState();
}

class _NewReleaseScreenState extends State<NewReleaseScreen> implements TopBarClickListener {
  final List<String> categories = ["All", "Movie", "Show", "Series", "Anime", "Drama"];
  int selectedIndex = 0;

  List<Movie> get filteredMovies {
    if (selectedIndex == 0) return widget.allMovies;
    final selectedCategory = categories[selectedIndex];
    return widget.allMovies.where((m) => m.subCategory == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            isShowBack: true,
            title: "New Release",
            isShowSearch: true,
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
          SizedBox(height: 15.setHeight),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
              child: Align(
                alignment: Alignment.topLeft,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Wrap(
                    spacing: 12.setWidth,
                    runSpacing: 12.setHeight,
                    children: filteredMovies.map((movie) {
                      return GestureDetector(
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
                                height: 180.setHeight,
                                width: 160.setWidth,
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
                      );
                    }).toList(),
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
