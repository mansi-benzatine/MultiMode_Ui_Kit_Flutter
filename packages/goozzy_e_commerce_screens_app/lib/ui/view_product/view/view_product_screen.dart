import 'package:flutter/material.dart';
import 'package:goozzy_e_commerce_screens_app_package/utils/utils.dart';

import '../../../../../../localization/language/languages.dart';
import '../../../../../../ui/view_inner_product/view/view_inner_product_screen.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../utils/string_constant.dart';
import '../../../../../../widgets/text/common_text.dart';
import '../../../../../../widgets/topbar/topbar.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/bottom_sheet/bottom_sheet.dart';
import '../../../widgets/product/product_card.dart';
import '../../../widgets/product/product_details.dart';
import '../../../widgets/product/product_ratings.dart';
import '../../../widgets/product/product_reviews.dart';
import '../../../widgets/product/product_services.dart';
import '../../cart/views/cart_screen.dart';
import '../../home_screen/datamodel/home_screen_data.dart';
import '../../search/view/search_screen.dart';
import '../../wishlist/view/wishlist_screen.dart';
import '../datamodel/view_product_data.dart';

class ViewProductScreen extends StatefulWidget {
  const ViewProductScreen({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (context) => const ViewProductScreen());
  }

  @override
  State<ViewProductScreen> createState() => _ViewProductScreenState();
}

class _ViewProductScreenState extends State<ViewProductScreen> implements TopBarClickListener {
  List<RatingData> mockRatings = [];
  void fillData() {
    mockRatings = [
      RatingData(
        label: Languages.of(context).excellent,
        percentage: 57,
        color: AppColor.darkGreen,
      ),
      RatingData(
        label: Languages.of(context).veryGood,
        percentage: 27,
        color: AppColor.green,
      ),
      RatingData(
        label: Languages.of(context).good,
        percentage: 12,
        color: AppColor.yellow,
      ),
      RatingData(
        label: Languages.of(context).average,
        percentage: 7,
        color: AppColor.orange,
      ),
      RatingData(
        label: Languages.of(context).poor,
        percentage: 13,
        color: AppColor.red,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgTopBar,
        body: Column(
          children: [
            IgnorePointer(
              ignoring: true,
              child: TopBar(
                this,
                isShowBack: true,
                isShowSearchField: true,
                isShowLike: true,
                isShowCart: true,
                isShowCartCount: false,
                isShowTitle: false,
                topBarColor: CustomAppColor.of(context).txtWhite,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    productDetails(context),
                    IgnorePointer(
                      ignoring: true,
                      child: ProductsDetail(
                        onTap: () => Navigator.push(context, ViewInnerProductScreen.route()),
                        productsList: anniDesignerSareeList,
                        isShowMrp: true,
                        isShowTrusted: true,
                        isRatingShown: false,
                        btnText: Languages.of(context).buyNow,
                      ),
                    ),
                    serviceHighlights(context),
                    CategoryReviewWidget(
                      forBottomSheet: false,
                      images: imageList,
                      ratings: mockRatings,
                      ratingScore: 4.5,
                      onTap: () => catalogReviewBottomSheet(context),
                    ),
                    ReviewsWidget(reviews: reviewList),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(36)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppAssets.icTrust,
                                height: AppSizes.setHeight(24),
                                width: AppSizes.setWidth(24),
                              ),
                              SizedBox(width: AppSizes.setWidth(8)),
                              Container(
                                width: AppSizes.setWidth(73),
                                height: AppSizes.setHeight(24),
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: CustomAppColor.of(context).txtPurple.withOpacityPercent(0.2),
                                ),
                                child: CommonText(
                                  text: Languages.of(context).trusted,
                                  fontWeight: FontWeight.w500,
                                  fontSize: AppSizes.setFontSize(13),
                                  textColor: CustomAppColor.of(context).txtPurple,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: AppSizes.setHeight(23), bottom: AppSizes.setHeight(20)),
                            child: CommonText(
                              text: Languages.of(context).bestQualityProductFromTrustedSuppliers,
                              fontWeight: FontWeight.w600,
                              fontSize: AppSizes.setFontSize(13),
                              textColor: CustomAppColor.of(context).txtBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget productDetails(BuildContext context) {
    return CommonDetailCard(
      title: AppStrings.anniDesignerWomenArt,
      rating: "3.8",
      ratingText: AppStrings.fourRating,
      detailRows: [
        DetailRowData(label: Languages.of(context).material, value: AppStrings.suede),
        DetailRowData(label: Languages.of(context).pattern, value: AppStrings.banarasiJacquard),
        DetailRowData(label: Languages.of(context).noOfComparments, value: AppStrings.withPieceBlouse),
        DetailRowData(label: Languages.of(context).multipack, value: "1"),
        DetailRowData(label: Languages.of(context).size, value: AppStrings.free),
        DetailRowData(label: Languages.of(context).dispatch, value: AppStrings.day),
      ],
      onCopyPressed: () {
        // Handle copy action
      },
      onWishlistPressed: () {
        // Handle wishlist action
      },
    );
  }

  Widget serviceHighlights(BuildContext context) {
    return ServiceHighlightsWidget(
      highlights: [
        ServiceHighlight(
          text: Languages.of(context).freeCashOnDelivery,
          imagePath: AppAssets.icCod,
          backgroundColor: AppColor.cardBlue,
        ),
        ServiceHighlight(
          text: Languages.of(context).sevenDaysEasyReturn,
          subText: Languages.of(context).knowMore,
          subTextColor: CustomAppColor.of(context).bgContainerRed,
          imagePath: AppAssets.icReturn,
          backgroundColor: AppColor.cardPink,
        ),
        ServiceHighlight(
          text: Languages.of(context).lowestPriceGuaranteed,
          subText: Languages.of(context).knowMore,
          subTextColor: CustomAppColor.of(context).txtOrange,
          imagePath: AppAssets.icPriceTag,
          backgroundColor: AppColor.cardYellow,
        ),
      ],
    );
  }

  void catalogReviewBottomSheet(BuildContext context) {
    customBottomSheet(
      isDone: false,
      isPaddingRequired: false,
      maxHeightRatio: 0.9,
      context: context,
      title: AppStrings.trendyAttractiveSarees.toUpperCase(),
      content: SingleChildScrollView(
        child: Column(
          children: [
            CategoryReviewWidget(
              forBottomSheet: true,
              images: imageList,
              ratings: mockRatings,
              ratingScore: 4.5,
            ),
            ReviewsWidget(reviews: reviewList),
          ],
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {String value = ""}) {
    if (name == AppStrings.back) {
      Navigator.pop(context);
    }
    if (name == AppStrings.search) {
      Navigator.push(context, SearchScreen.route());
    }
    if (name == AppStrings.wishlist) {
      Navigator.push(context, WishlistScreen.route());
    }
    if (name == AppStrings.cart) {
      Navigator.push(context, CartScreen.route());
    }
  }
}
