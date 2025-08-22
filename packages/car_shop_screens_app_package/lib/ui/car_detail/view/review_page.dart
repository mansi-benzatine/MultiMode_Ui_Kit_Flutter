import 'package:car_shop_screens_app_package/utils/sizer_utils.dart';
import 'package:car_shop_screens_app_package/utils/utils.dart';
import 'package:car_shop_screens_app_package/widgets/view/dotted_divider_view.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  int selectedRatingFilter = 0; // 0 = All, 1-5 = star ratings

  final List<ReviewItem> reviews = [
    ReviewItem(
      name: "Devin Jorje",
      rating: 5.0,
      date: "Yesterday",
      review: "Lorem Ipsum is simply dummy text of the printing typesetting dummy text of the printing typesetting industry Lorem Ipsum is simply dummy text of the printing.",
      profileImage: "https://via.placeholder.com/50",
    ),
    ReviewItem(
      name: "Stock Lee",
      rating: 4.9,
      date: "July 12, 2025",
      review:
          "Lorem Ipsum is simply dummy text of the printing typesetting dummy text of the printing typesetting industry Lorem Ipsum is simply dummy text of the printing the printing typesetting industry Lorem Ipsum is simply dummy.",
      profileImage: "https://via.placeholder.com/50",
    ),
    ReviewItem(
      name: "David Warner",
      rating: 4.7,
      date: "July 04, 2025",
      review: "Lorem Ipsum is simply dummy text of the printing typesetting dummy text of the printing typesetting industry Lorem Ipsum is simply dummy text of the printing.",
      profileImage: "https://via.placeholder.com/50",
    ),
    ReviewItem(
      name: "John Doe",
      rating: 3.5,
      date: "July 04, 2025",
      review: "Lorem Ipsum is simply dummy text of the printing typesetting dummy text of the printing typesetting industry Lorem Ipsum is simply dummy text of the printing.",
      profileImage: "https://via.placeholder.com/50",
    ),
    ReviewItem(
      name: "Jane Doe",
      rating: 2.5,
      date: "July 04, 2025",
      review: "Lorem Ipsum is simply dummy text of the printing typesetting dummy text of the printing typesetting industry Lorem Ipsum is simply dummy text of the printing.",
      profileImage: "https://via.placeholder.com/50",
    ),
    ReviewItem(
      name: "Jane Doe",
      rating: 1.5,
      date: "July 04, 2025",
      review: "Lorem Ipsum is simply dummy text of the printing typesetting dummy text of the printing typesetting industry Lorem Ipsum is simply dummy text of the printing.",
      profileImage: "https://via.placeholder.com/50",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 15.setHeight),
      child: Column(
        children: [
          _buildReviewWidget(),
          _buildRatingChipView(),
          _buildReviewList(),
        ],
      ),
    );
  }

  _buildReviewWidget() {
    return Container(
      padding: EdgeInsets.all(20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: "Tesla Model Y Review",
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 20.setHeight),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left side - Rating and stars
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommonText(
                      text: "4.8",
                      fontSize: 48.setFontSize,
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return Icon(
                          Icons.star,
                          color: (index < 4) ? CustomAppColor.of(context).bgStar : CustomAppColor.of(context).txtGray,
                          size: 20.setWidth,
                        );
                      }),
                    ),
                    SizedBox(height: 5.setHeight),
                    CommonText(
                      text: "4,487 Review",
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w600,
                      textColor: CustomAppColor.of(context).txtBlack.withOpacityPercent(0.7),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.setWidth),
              // Right side - Rating breakdown
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    _buildRatingRow(5, 75),
                    SizedBox(height: 8.setHeight),
                    _buildRatingRow(4, 12),
                    SizedBox(height: 8.setHeight),
                    _buildRatingRow(3, 28),
                    SizedBox(height: 8.setHeight),
                    _buildRatingRow(2, 1),
                    SizedBox(height: 8.setHeight),
                    _buildRatingRow(1, 52),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRatingRow(int stars, int percentage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Star icon
        Icon(
          Icons.star,
          color: CustomAppColor.of(context).bgStar,
          size: 16.setWidth,
        ),
        SizedBox(width: 4.setWidth),
        // Star number
        CommonText(
          text: stars.toString(),
          fontSize: 12.setFontSize,
          fontWeight: FontWeight.w400,
          textColor: const Color(0xFFFABD3B),
        ),
        SizedBox(width: 6.setWidth),
        // Progress bar
        Container(
          height: 3.setHeight,
          width: 120.setWidth,
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).txtBlack.withOpacityPercent(0.1),
            borderRadius: BorderRadius.circular(4.setWidth),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: percentage / 100,
            child: Container(
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).bgStar,
                borderRadius: BorderRadius.circular(4.setWidth),
              ),
            ),
          ),
        ),

        // Percentage
        Container(
          padding: EdgeInsets.only(left: 7.setWidth),
          child: CommonText(
            text: "$percentage%",
            fontSize: 13.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
        ),
      ],
    );
  }

  _buildRatingChipView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.setHeight),
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildRatingChip(
                text: "All",
                isSelected: selectedRatingFilter == 0,
                onTap: () {
                  setState(() {
                    selectedRatingFilter = 0;
                  });
                },
              ),
              SizedBox(width: 12.setWidth),
              ...List.generate(5, (index) {
                int rating = 5 - index; // 5, 4, 3, 2, 1
                return Padding(
                  padding: EdgeInsets.only(right: 12.setWidth),
                  child: _buildRatingChip(
                    text: rating.toString(),
                    isSelected: selectedRatingFilter == rating,
                    showStar: true,
                    onTap: () {
                      setState(() {
                        selectedRatingFilter = rating;
                      });
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRatingChip({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
    bool showStar = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15.setWidth,
          vertical: 4.setHeight,
        ),
        decoration: BoxDecoration(
          color: isSelected ? CustomAppColor.of(context).primary : Colors.transparent,
          gradient: isSelected ? CustomAppColor.of(context).primaryGradient : null,
          borderRadius: BorderRadius.circular(20.setWidth),
          border: Border.all(
            color: isSelected ? CustomAppColor.of(context).transparent : CustomAppColor.of(context).containerBorder,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showStar) ...[
              Icon(
                Icons.star,
                size: 16.setWidth,
                color: isSelected ? Colors.white : CustomAppColor.of(context).txtBlack,
              ),
              SizedBox(width: 4.setWidth),
            ],
            CommonText(
              text: text,
              fontSize: 12.setFontSize,
              fontWeight: FontWeight.w500,
              textColor: isSelected ? Colors.white : CustomAppColor.of(context).txtBlack,
            ),
          ],
        ),
      ),
    );
  }

  _buildReviewList() {
    List<ReviewItem> filteredReviews = selectedRatingFilter == 0 ? reviews : reviews.where((review) => review.rating.floor() == selectedRatingFilter).toList();

    return Column(
      children: [
        SizedBox(height: 20.setHeight),
        ...filteredReviews.map((review) => _buildReviewItem(review)),
      ],
    );
  }

  Widget _buildReviewItem(ReviewItem review) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image
              Container(
                width: 40.setWidth,
                height: 40.setHeight,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomAppColor.of(context).containerBorder,
                ),
                child: ClipOval(
                  child: Image.network(
                    review.profileImage,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: CustomAppColor.of(context).containerBorder,
                        child: Image.asset(
                          AppAssets.imgDummyGirl,
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(width: 12.setWidth),
              // Review Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Rating and Star
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: review.rating.toString(),
                              fontSize: 14.setFontSize,
                              fontWeight: FontWeight.w600,
                              textColor: CustomAppColor.of(context).txtBlack,
                              letterSpacing: 0.2,
                            ),
                            SizedBox(width: 4.setWidth),
                            Icon(
                              Icons.star,
                              color: CustomAppColor.of(context).bgStar,
                              size: 16.setWidth,
                            ),
                          ],
                        ),
                        const Spacer(),
                        // Date
                        CommonText(
                          text: review.date,
                          fontSize: 10.setFontSize,
                          fontWeight: FontWeight.w500,
                          textColor: CustomAppColor.of(context).txtGray,
                        ),
                      ],
                    ),
                    // Name
                    CommonText(
                      text: review.name,
                      fontSize: 12.setFontSize,
                      fontWeight: FontWeight.w500,
                      textColor: CustomAppColor.of(context).txtBlack,
                    ),
                    SizedBox(height: 8.setHeight),
                    // Review Text
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.setHeight),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.setWidth),
          child: CommonText(
            text: review.review,
            fontSize: 10.setFontSize,
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtDarkGray,
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(height: 15.setHeight),
        DottedDividerView(
          color: CustomAppColor.of(context).containerBorder,
          dashWidth: 5.setWidth,
          dashSpace: 2.setWidth,
          height: 1.setHeight,
        ),
        SizedBox(height: 15.setHeight),
      ],
    );
  }
}

class ReviewItem {
  final String name;
  final double rating;
  final String date;
  final String review;
  final String profileImage;

  ReviewItem({
    required this.name,
    required this.rating,
    required this.date,
    required this.review,
    required this.profileImage,
  });
}
