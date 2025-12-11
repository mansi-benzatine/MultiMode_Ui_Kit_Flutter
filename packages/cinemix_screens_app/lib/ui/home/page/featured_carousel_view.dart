import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinemix_screens_app/ui/home/datamodel/home_data.dart';
import 'package:cinemix_screens_app/utils/app_color.dart';
import 'package:cinemix_screens_app/utils/constant.dart';
import 'package:cinemix_screens_app/utils/sizer_utils.dart';
import 'package:cinemix_screens_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

class FeaturedCarousel extends StatefulWidget {
  final List<Movie> featuredMovies;
  const FeaturedCarousel({super.key, required this.featuredMovies});

  @override
  State<FeaturedCarousel> createState() => _FeaturedCarouselState();
}

class _FeaturedCarouselState extends State<FeaturedCarousel> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: widget.featuredMovies.length,
      options: CarouselOptions(
        onPageChanged: (index, reason) {
          setState(() {
            currentIndex = index;
          });
        },
        height: 420.setHeight,
        enlargeCenterPage: true,
        viewportFraction: 1,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
      ),
      itemBuilder: (context, index, realIndex) {
        final movie = widget.featuredMovies[index];
        return _buildMovieCard(context, movie);
      },
    );
  }

  Widget _buildMovieCard(BuildContext context, Movie movie) {
    return GestureDetector(
      // onTap: () => Navigator.push(context, ExploreMovieScreen.route(movie: movie)),
      child: Container(
        margin: EdgeInsets.only(bottom: 16.setHeight),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              offset: const Offset(0, 6),
              blurRadius: 12,
            )
          ],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
              child: Stack(
                children: [
                  Image.asset(
                    movie.image,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                        colors: [
                          CustomAppColor.of(context).transparent,
                          CustomAppColor.of(context).transparent,
                          CustomAppColor.of(context).transparent,
                          CustomAppColor.of(context).txtWhite.withValues(alpha: 0.2),
                          CustomAppColor.of(context).txtWhite.withValues(alpha: 0.8),
                          CustomAppColor.of(context).txtWhite,
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 25.setHeight,
                    left: 55.setWidth,
                    right: 55.setWidth,
                    child: Row(
                      children: [
                        _buildButton(
                          label: "Watch Now",
                          color: CustomAppColor.of(context).primary,
                          icon: Icons.play_arrow,
                        ),
                        SizedBox(width: 16.setWidth),
                        _buildMyListButton(movie),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10.setHeight,
                    right: 0,
                    left: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        widget.featuredMovies.length,
                        (dotIndex) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 1),
                          height: 5.setHeight,
                          width: 5.setWidth,
                          decoration: BoxDecoration(
                            color: currentIndex == dotIndex ? CustomAppColor.of(context).primary : CustomAppColor.of(context).hintText,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required String label,
    required Color color,
    required IconData icon,
    Color textColor = Colors.white,
    bool outlined = false,
  }) {
    return Expanded(
      child: Container(
        height: 42.setHeight,
        decoration: BoxDecoration(
          color: outlined ? CustomAppColor.of(context).transparent : color,
          borderRadius: BorderRadius.circular(12),
          border: outlined ? Border.all(color: CustomAppColor.of(context).black) : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20, color: textColor),
            CommonText(
              text: label,
              textColor: textColor,
              fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
              fontSize: 12.setFontSize,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMyListButton(Movie movie) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            movie.isAddedInMyList = !movie.isAddedInMyList;
          });
        },
        child: Container(
          height: 42.setHeight,
          decoration: BoxDecoration(
            color: movie.isAddedInMyList ? CustomAppColor.of(context).primary : CustomAppColor.of(context).transparent,
            borderRadius: BorderRadius.circular(12),
            border: movie.isAddedInMyList ? null : Border.all(color: CustomAppColor.of(context).txtBlack),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                movie.isAddedInMyList ? Icons.check : Icons.add,
                size: 20,
                color: movie.isAddedInMyList ? CustomAppColor.of(context).white : CustomAppColor.of(context).icBlackWhite,
              ),
              SizedBox(width: 12.setWidth),
              CommonText(
                text: movie.isAddedInMyList ? "Added To List" : "My List",
                textColor: movie.isAddedInMyList ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtBlack,
                fontFamily: Constant.fontFamilyClashDisplaySemiBold600,
                fontSize: 12.setFontSize,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
