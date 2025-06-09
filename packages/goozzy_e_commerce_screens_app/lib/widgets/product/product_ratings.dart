import 'package:flutter/material.dart';
import 'package:goozzy_e_commerce_screens_app_package/utils/utils.dart';

import '../../localization/language/languages.dart';
import '../../ui/view_product/datamodel/view_product_data.dart';
import '../../utils/app_color.dart';
import '../../utils/sizer_utils.dart';
import '../../utils/string_constant.dart';
import '../heading/heading.dart';
import '../text/common_text.dart';

class CategoryReviewWidget extends StatelessWidget {
  final bool forBottomSheet;
  final List<Images> images;
  final List<RatingData> ratings;
  final double ratingScore;
  final Function()? onTap;
  const CategoryReviewWidget(
      {super.key, this.forBottomSheet = false, required this.images, required this.ratings, required this.ratingScore, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppSizes.setHeight(10)),
      child: Container(
        padding: forBottomSheet ? EdgeInsets.zero : EdgeInsets.symmetric(vertical: AppSizes.setHeight(10)),
        color: CustomAppColor.of(context).bgScaffold,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!forBottomSheet)
              Heading(
                  title: Languages.of(context).catalogReviews.toUpperCase(),
                  navigationTitle: Languages.of(context).seeAll.toUpperCase(),
                  onTap: onTap),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppSizes.setHeight(21),
                horizontal: AppSizes.setWidth(17),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRatingSummary(context),
                  SizedBox(width: AppSizes.setWidth(22)),
                  _buildRatingBars(context),
                ],
              ),
            ),
            if (forBottomSheet)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20)),
                child: Divider(
                  color: CustomAppColor.of(context).borderGrey.withOpacityPercent(0.3),
                ),
              ),
            if (!forBottomSheet) _buildImageList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingSummary(BuildContext context) {
    return SizedBox(
      // height: AppSizes.setHeight(130),
      width: AppSizes.setWidth(103),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: AppSizes.setHeight(10)),
            child: Column(
              children: [
                Row(
                  children: [
                    CommonText(
                      text: "$ratingScore",
                      fontSize: AppSizes.setFontSize(36),
                      fontWeight: FontWeight.w800,
                    ),
                    CommonText(
                      text: '/5',
                      fontSize: AppSizes.setFontSize(20),
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Row(
                  children: List.generate(5, (index) {
                    return Expanded(
                      child: Icon(
                        index < ratingScore.floor()
                            ? Icons.star
                            : index < ratingScore.ceil()
                                ? Icons.star_half
                                : Icons.star_border,
                        color: AppColor.yellow,
                        size: AppSizes.setWidth(20),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          CommonText(
            text: AppStrings.ratings,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtGrey,
          ),
          CommonText(
            text: AppStrings.reviews,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtGrey,
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBars(BuildContext context) {
    return SizedBox(
      width: AppSizes.setWidth(215),
      child: Column(
        children: ratings.map((rating) {
          return _buildRatingBar(
            label: rating.label,
            percentage: rating.percentage,
            color: rating.color,
            context: context,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildRatingBar({
    required String label,
    required int percentage,
    required Color color,
    required BuildContext context,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(4)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: CommonText(
              text: label,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w600,
              fontSize: AppSizes.setFontSize(12),
            ),
          ),
          Expanded(
            flex: 4,
            child: LinearProgressIndicator(
              value: percentage / 100,
              backgroundColor: AppColor.txtGrey.withOpacityPercent(0.2),
              valueColor: AlwaysStoppedAnimation(color),
              minHeight: AppSizes.setHeight(4),
            ),
          ),
          SizedBox(width: AppSizes.setWidth(10)),
          CommonText(
            text: '$percentage',
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w500,
            fontSize: AppSizes.setFontSize(12),
            textColor: CustomAppColor.of(context).txtGrey,
          ),
        ],
      ),
    );
  }

  Widget _buildImageList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            color: CustomAppColor.of(context).borderGrey.withOpacityPercent(0.3),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(10)),
            child: CommonText(
              text: Languages.of(context).realImagesAndVideoFromReseller,
              fontSize: AppSizes.setFontSize(16),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: AppSizes.setHeight(80),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Card(
                      margin: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(6)),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(
                          children: [
                            Image.asset(
                              images[index].imagePath,
                              fit: BoxFit.fitHeight,
                              height: AppSizes.setHeight(55),
                              width: AppSizes.setWidth(55),
                            ),
                            if (index == 4)
                              Container(
                                height: AppSizes.setHeight(55),
                                width: AppSizes.setWidth(55),
                                color: Colors.black.withOpacityPercent(0.5),
                                alignment: Alignment.center,
                                child: CommonText(
                                  text: '+10',
                                  fontWeight: FontWeight.w700,
                                  fontSize: AppSizes.setFontSize(18),
                                  textColor: CustomAppColor.of(context).white,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Divider(
            color: CustomAppColor.of(context).borderGrey.withOpacityPercent(0.3),
          ),
        ],
      ),
    );
  }
}
