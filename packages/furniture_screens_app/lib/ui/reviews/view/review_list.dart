import 'package:flutter/material.dart';
import 'package:furniture_screens_app_package/ui/reviews/datamodel/reviews_data.dart';
import 'package:furniture_screens_app_package/utils/app_assets.dart';
import 'package:furniture_screens_app_package/utils/app_color.dart';
import 'package:furniture_screens_app_package/utils/constant.dart';
import 'package:furniture_screens_app_package/utils/sizer_utils.dart';
import 'package:furniture_screens_app_package/widgets/text/common_text.dart';

class ReviewList extends StatefulWidget {
  const ReviewList({super.key});

  @override
  State<ReviewList> createState() => _ReviewListState();
}

class _ReviewListState extends State<ReviewList> {
  int selectedFilter = 0;
  final List<int> filters = [0, 5, 4, 3, 2, 1];

  final List<Review> reviews = [
    Review(
      name: "Jenny Welson",
      avatar: AppAssets.imgDummyProfile,
      date: "Nov 12, 2023",
      rating: 5,
      review: "Lorem Ipsum Is Simply Dummy Text Of The To Printing And Typesetting Text.",
    ),
    Review(
      name: "Sendy Howkins",
      avatar: AppAssets.imgDummyProfile,
      date: "Nov 12, 2023",
      rating: 5,
      review: "Lorem Ipsum Is Simply Dummy Text Of The To Printing And Typesetting Text.",
    ),
    Review(
      name: "Krinshi Sen",
      avatar: AppAssets.imgDummyProfile,
      date: "Nov 12, 2023",
      rating: 5,
      review: "Lorem Ipsum Is Simply Dummy Text Of The To Printing And Text. Dummy Text Of The To Printing And Typesetting Text.",
    ),
    Review(
      name: "Jenny Golsa",
      avatar: AppAssets.imgDummyProfile,
      date: "Nov 12, 2023",
      rating: 5,
      review: "Lorem Ipsum Is Simply Dummy Text Of The To Printing And Typesetting Text.",
    ),
    Review(
      name: "Sendy Howkins",
      avatar: AppAssets.imgDummyProfile,
      date: "Nov 12, 2023",
      rating: 1,
      review: "Lorem Ipsum Is Simply Dummy Text Of The To Printing And Typesetting Text.",
    ),
    Review(
      name: "Krinshi Sen",
      avatar: AppAssets.imgDummyProfile,
      date: "Nov 12, 2023",
      rating: 4,
      review: "Lorem Ipsum Is Simply Dummy Text Of The To Printing And Text. Dummy Text Of The To Printing And Typesetting Text.",
    ),
    Review(
      name: "Jenny Golsa",
      avatar: AppAssets.imgDummyProfile,
      date: "Nov 12, 2023",
      rating: 4,
      review: "Lorem Ipsum Is Simply Dummy Text Of The To Printing And Typesetting Text.",
    ),
    Review(
      name: "Sendy Howkins",
      avatar: AppAssets.imgDummyProfile,
      date: "Nov 12, 2023",
      rating: 3,
      review: "Lorem Ipsum Is Simply Dummy Text Of The To Printing And Typesetting Text.",
    ),
    Review(
      name: "Krinshi Sen",
      avatar: AppAssets.imgDummyProfile,
      date: "Nov 12, 2023",
      rating: 3,
      review: "Lorem Ipsum Is Simply Dummy Text Of The To Printing And Text. Dummy Text Of The To Printing And Typesetting Text.",
    ),
    Review(
      name: "Jenny Golsa",
      avatar: AppAssets.imgDummyProfile,
      date: "Nov 12, 2023",
      rating: 2,
      review: "Lorem Ipsum Is Simply Dummy Text Of The To Printing And Typesetting Text.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredReviews = selectedFilter == 0 ? reviews : reviews.where((r) => r.rating == selectedFilter).toList();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 20.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: filters.map((filter) {
                final bool isSelected = filter == selectedFilter;

                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 18.setWidth, vertical: 6.setHeight),
                      decoration: BoxDecoration(
                        color: isSelected ? CustomAppColor.of(context).primary : Colors.transparent,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtBlack.withValues(alpha: 0.20),
                          width: 0.5,
                        ),
                      ),
                      child: filter == 0
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.setWidth),
                              child: CommonText(
                                text: "All",
                                textColor: isSelected ? Colors.white : CustomAppColor.of(context).txtBlack,
                                fontFamily: Constant.fontFamilySemiBold600,
                                fontSize: 14.setFontSize,
                              ),
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 2.setHeight),
                                  child: Image.asset(
                                    AppAssets.icStar,
                                    height: 14.setHeight,
                                    width: 14.setWidth,
                                  ),
                                ),
                                SizedBox(width: 6.setWidth),
                                CommonText(
                                  text: "$filter",
                                  textColor: isSelected ? Colors.white : CustomAppColor.of(context).txtBlack,
                                  fontFamily: Constant.fontFamilySemiBold600,
                                  fontSize: 14.setFontSize,
                                )
                              ],
                            ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: filteredReviews.length,
            separatorBuilder: (_, __) => Divider(
              height: 38.setHeight,
              color: CustomAppColor.of(context).dividerColor,
              thickness: 0.5,
            ),
            itemBuilder: (context, index) {
              final review = filteredReviews[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundImage: AssetImage(review.avatar),
                      ),
                      SizedBox(width: 12.setWidth),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: review.name,
                              fontFamily: Constant.fontFamilySemiBold600,
                              fontSize: 16.setFontSize,
                            ),
                            CommonText(
                              text: review.date,
                              textColor: CustomAppColor.of(context).txtGray,
                              fontSize: 14.setFontSize,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.setHeight),
                            child: Image.asset(
                              AppAssets.icStar,
                              height: 13.setHeight,
                              width: 13.setHeight,
                            ),
                          ),
                          SizedBox(width: 6.setWidth),
                          CommonText(
                            text: review.rating.toString(),
                            textColor: Colors.amber,
                            fontFamily: Constant.fontFamilyMedium500,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15.setHeight),
                  CommonText(
                    text: review.review,
                    fontSize: 14.setFontSize,
                    textColor: CustomAppColor.of(context).txtGray,
                    textAlign: TextAlign.start,
                    height: 0,
                  ),
                ],
              );
            },
          ),
          SizedBox(height: 30.setHeight)
        ],
      ),
    );
  }
}
