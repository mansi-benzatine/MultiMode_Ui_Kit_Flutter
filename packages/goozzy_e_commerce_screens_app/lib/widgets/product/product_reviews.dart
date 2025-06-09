import 'package:flutter/material.dart';
import 'package:goozzy_e_commerce_screens_app_package/utils/utils.dart';
import 'package:readmore/readmore.dart';

import '../../localization/language/languages.dart';
import '../../ui/view_product/datamodel/view_product_data.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../utils/constant.dart';
import '../../utils/sizer_utils.dart';
import '../text/common_text.dart';

class ReviewsWidget extends StatelessWidget {
  final List<ReviewData> reviews;

  const ReviewsWidget({
    super.key,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.setWidth(20),
        vertical: AppSizes.setHeight(20),
      ),
      color: CustomAppColor.of(context).bgScaffold,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          final review = reviews[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: review.username,
                fontSize: AppSizes.setFontSize(16),
                fontWeight: FontWeight.w500,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(15)),
                child: Row(
                  children: [
                    Container(
                      width: AppSizes.setWidth(41),
                      // height: AppSizes.setHeight(20),
                      decoration: BoxDecoration(
                        color: review.rating > 1 ? CustomAppColor.of(context).green : CustomAppColor.of(context).red,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CommonText(
                            text: review.rating.toStringAsFixed(1),
                            fontSize: AppSizes.setFontSize(12),
                            fontWeight: FontWeight.w600,
                            textColor: CustomAppColor.of(context).white,
                          ),
                          Image.asset(
                            AppAssets.icStar,
                            height: AppSizes.setHeight(10),
                            width: AppSizes.setWidth(10),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: AppSizes.setWidth(11)),
                    CommonText(
                      text: review.date,
                      fontWeight: FontWeight.w500,
                      fontSize: AppSizes.setFontSize(12),
                      textColor: CustomAppColor.of(context).txtGrey,
                    )
                  ],
                ),
              ),
              ReadMoreText(
                review.review,
                trimLines: 2,
                colorClickableText: CustomAppColor.of(context).btnPurple,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' Read more',
                trimExpandedText: ' Read less',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: Constant.fontFamilyUrbanist,
                  fontSize: AppSizes.setFontSize(14),
                  color: CustomAppColor.of(context).txtBlack,
                ),
                moreStyle: TextStyle(
                  color: CustomAppColor.of(context).btnPurple,
                  fontWeight: FontWeight.w600,
                ),
                lessStyle: TextStyle(
                  color: CustomAppColor.of(context).btnPurple,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (review.imagePath.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(15)),
                  child: SizedBox(
                    height: AppSizes.setHeight(55),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: review.imagePath.length,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, imageIndex) {
                        return Padding(
                          padding: EdgeInsets.only(right: AppSizes.setWidth(8)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              review.imagePath[imageIndex],
                              fit: BoxFit.fitHeight,
                              height: AppSizes.setHeight(55),
                              width: AppSizes.setWidth(55),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              Row(
                children: [
                  Image.asset(
                    AppAssets.icLike,
                    height: AppSizes.setHeight(18),
                    width: AppSizes.setWidth(18),
                    color: CustomAppColor.of(context).icBlackPurple,
                  ),
                  SizedBox(width: AppSizes.setWidth(11)),
                  CommonText(
                    text: "${Languages.of(context).helpful} (5)",
                    fontSize: AppSizes.setFontSize(12),
                    fontWeight: FontWeight.w500,
                    textColor: CustomAppColor.of(context).txtGrey,
                  )
                ],
              ),
              if (index != reviews.length - 1)
                Padding(
                  padding: EdgeInsets.only(
                    bottom: AppSizes.setHeight(22),
                    top: AppSizes.setHeight(22),
                  ),
                  child: Divider(
                    color: CustomAppColor.of(context).borderGrey.withOpacityPercent(0.3),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
