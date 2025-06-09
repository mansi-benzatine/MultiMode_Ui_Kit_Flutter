import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:goozzy_e_commerce_screens_app_package/utils/utils.dart';

import '../../../../../../interfaces/top_bar_click_listener.dart';
import '../../../../../../localization/language/languages.dart';
import '../../../../../../utils/app_assets.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../utils/string_constant.dart';
import '../../../../../../widgets/button/common_button.dart';
import '../../../../../../widgets/text/common_text.dart';
import '../../../../../../widgets/textfield/common_textformfield.dart';
import '../../../../../../widgets/topbar/topbar.dart';
import '../../../widgets/bottom_sheet/bottom_sheet.dart';
import '../../../widgets/product/product_details.dart';
import '../../../widgets/product/product_ratings.dart';
import '../../../widgets/product/product_reviews.dart';
import '../../../widgets/product/product_services.dart';
import '../../view_product/datamodel/view_product_data.dart';
import '../datamodel/view_inner_product_data.dart';

class ViewInnerProductScreen extends StatefulWidget {
  const ViewInnerProductScreen({super.key});

  static Route route() {
    return MaterialPageRoute(builder: (context) => const ViewInnerProductScreen());
  }

  @override
  State<ViewInnerProductScreen> createState() => _ViewInnerProductScreenState();
}

class _ViewInnerProductScreenState extends State<ViewInnerProductScreen> implements TopBarClickListener {
  int currentIndex = 0;
  List<ProductSize> productSize = [];
  List<RatingData> mockRatings = [];

  void fillData() {
    productSize = [
      ProductSize(size: Languages.of(context).s, isSelected: false),
      ProductSize(size: Languages.of(context).m, isSelected: true),
      ProductSize(size: Languages.of(context).l, isSelected: false),
      ProductSize(size: Languages.of(context).xl, isSelected: false),
      ProductSize(size: Languages.of(context).xxl, isSelected: false),
      ProductSize(size: Languages.of(context).free, isSelected: false),
    ];
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
                topBarColor: CustomAppColor.of(context).bgBlackWhiteScaffold,
                isShowSearchField: true,
                isShowShadow: true,
                isShowLike: true,
                isShowCart: true,
                isShowCartCount: false,
                isShowTitle: false,
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: productDetail.map((product) {
                  return Column(
                    children: [
                      productImageSlider(),
                      productDetails(context, product),
                      Padding(
                        padding: EdgeInsets.only(top: AppSizes.setHeight(8)),
                        child: selectSize(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: AppSizes.setHeight(8)),
                        child: checkDeliveryDate(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: AppSizes.setHeight(8)),
                        child: productDescription(context),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: AppSizes.setHeight(8)),
                        child: serviceHighlights(context),
                      ),
                      CategoryReviewWidget(
                        forBottomSheet: false,
                        images: imageList,
                        ratings: mockRatings,
                        ratingScore: 4.5,
                        onTap: () => catalogReviewBottomSheet(context),
                      ),
                      ReviewsWidget(reviews: reviewList),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(8)),
                        child: bottomActionButton(context),
                      )
                    ],
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget productImageSlider() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(20)),
      color: CustomAppColor.of(context).bgScaffold,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CarouselSlider(
            items: productDetail[0].productImages.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return Image.asset(
                    image,
                    fit: BoxFit.fill,
                    width: AppSizes.setWidth(170),
                    height: AppSizes.setHeight(252),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: AppSizes.setHeight(252),
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: AppSizes.setHeight(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: productDetail[0].productImages.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => setState(() {
                    currentIndex = entry.key;
                  }),
                  child: Container(
                    width: AppSizes.setWidth(15),
                    height: AppSizes.setHeight(4),
                    margin: EdgeInsets.symmetric(
                      horizontal: AppSizes.setWidth(2),
                      vertical: AppSizes.setHeight(4),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: CustomAppColor.of(context).borderGrey.withOpacityPercent(0.3)),
                      color: currentIndex == entry.key ? CustomAppColor.of(context).borderPurple : CustomAppColor.of(context).white,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget productDetails(BuildContext context, ProductDetail product) {
    return Container(
      color: CustomAppColor.of(context).bgScaffold,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.setWidth(22),
          vertical: AppSizes.setHeight(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: AppSizes.setWidth(238),
                  height: AppSizes.setHeight(40),
                  child: CommonText(
                    text: product.productName,
                    fontWeight: FontWeight.w600,
                    fontSize: AppSizes.setFontSize(15),
                    textColor: CustomAppColor.of(context).txtGrey,
                    textAlign: TextAlign.start,
                    maxLines: 2,
                  ),
                ),
                const Spacer(),
                Image.asset(
                  AppAssets.icShare,
                  height: AppSizes.setHeight(24),
                  width: AppSizes.setWidth(24),
                  color: CustomAppColor.of(context).icBlack,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(10)),
              child: Row(
                children: [
                  CommonText(
                    text: "\$${product.productPrice}",
                    fontWeight: FontWeight.w700,
                    fontSize: AppSizes.setFontSize(24),
                  ),
                  SizedBox(width: AppSizes.setWidth(10)),
                  CommonText(
                    text: "${Languages.of(context).mrp} ",
                    textColor: CustomAppColor.of(context).txtGrey,
                    fontWeight: FontWeight.w600,
                    fontSize: AppSizes.setFontSize(10),
                  ),
                  CommonText(
                    text: "\$${product.productMrp}",
                    textDecoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.w600,
                    fontSize: AppSizes.setFontSize(10),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Image.asset(
                  AppAssets.icDiscount,
                  height: AppSizes.setHeight(11),
                  width: AppSizes.setWidth(10),
                ),
                SizedBox(width: AppSizes.setWidth(2)),
                CommonText(
                  text: product.productDiscount,
                  fontWeight: FontWeight.w600,
                  fontSize: AppSizes.setFontSize(12),
                  textColor: CustomAppColor.of(context).txtBlack,
                ),
              ],
            ),
            SizedBox(height: AppSizes.setHeight(5)),
            CommonText(
              text: "Price inclusive of GST",
              fontWeight: FontWeight.w600,
              fontSize: AppSizes.setFontSize(12),
              textColor: CustomAppColor.of(context).txtBlack,
            ),
            Padding(
              padding: EdgeInsets.only(top: AppSizes.setHeight(20), left: AppSizes.setWidth(3)),
              child: Row(
                children: [
                  Image.asset(
                    AppAssets.icLabel,
                    height: AppSizes.setHeight(17),
                    width: AppSizes.setWidth(17),
                    color: CustomAppColor.of(context).icGrey,
                  ),
                  SizedBox(width: AppSizes.setWidth(8)),
                  CommonText(
                    text: Languages.of(context).freeDelivery,
                    textColor: CustomAppColor.of(context).txtGrey,
                    fontSize: AppSizes.setFontSize(14),
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(10)),
              child: Row(
                children: [
                  Image.asset(
                    AppAssets.icCalender,
                    height: AppSizes.setHeight(21),
                    width: AppSizes.setWidth(20),
                    color: CustomAppColor.of(context).icGrey,
                  ),
                  SizedBox(width: AppSizes.setWidth(8)),
                  CommonText(
                    text: product.deliverDate,
                    textColor: CustomAppColor.of(context).txtGrey,
                    fontSize: AppSizes.setFontSize(14),
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: AppSizes.setWidth(3)),
              child: Row(
                children: [
                  Image.asset(
                    AppAssets.icTrust,
                    height: AppSizes.setHeight(14),
                    width: AppSizes.setWidth(14),
                  ),
                  SizedBox(width: AppSizes.setWidth(8)),
                  Container(
                    width: AppSizes.setWidth(50),
                    height: AppSizes.setHeight(16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: CustomAppColor.of(context).btnPurple.withOpacityPercent(0.1),
                    ),
                    child: CommonText(
                      text: Languages.of(context).trusted,
                      fontWeight: FontWeight.w500,
                      fontSize: AppSizes.setFontSize(10),
                      textColor: CustomAppColor.of(context).txtPurple,
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

  Widget selectSize() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20), vertical: AppSizes.setHeight(16)),
      color: CustomAppColor.of(context).bgScaffold,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CommonText(
            text: Languages.of(context).selectSize.toUpperCase(),
            fontWeight: FontWeight.w800,
            fontSize: AppSizes.setFontSize(18),
          ),
          SizedBox(height: AppSizes.setHeight(10)),
          GridView.builder(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(10)),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 18,
              mainAxisSpacing: 16,
              childAspectRatio: 2,
            ),
            itemCount: productSize.length,
            itemBuilder: (context, index) {
              final size = productSize[index];
              return Container(
                width: AppSizes.setWidth(70),
                height: AppSizes.setHeight(36),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: size.isSelected ? CustomAppColor.of(context).borderPurple.withOpacityPercent(0.2) : CustomAppColor.of(context).bgScaffold,
                  border: Border.all(
                    color: size.isSelected ? CustomAppColor.of(context).borderPurple : CustomAppColor.of(context).borderGrey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: CommonText(
                  text: size.size,
                  textColor: size.isSelected ? CustomAppColor.of(context).txtPurple : CustomAppColor.of(context).txtGrey,
                  fontWeight: FontWeight.w800,
                  fontSize: AppSizes.setFontSize(18),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget checkDeliveryDate() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20), vertical: AppSizes.setHeight(16)),
      color: CustomAppColor.of(context).bgScaffold,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).checkDeliveryDate.toUpperCase(),
            fontWeight: FontWeight.w800,
            fontSize: AppSizes.setFontSize(18),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(18)),
            child: CommonTextFormField(
              radius: 4,
              fillColor: CustomAppColor.of(context).bgScaffold,
              borderColor: CustomAppColor.of(context).containerBorder,
              hintText: Languages.of(context).enterDeliveryPinCode,
              hintStyle: TextStyle(
                fontSize: AppSizes.setFontSize(15),
                color: CustomAppColor.of(context).txtGrey,
                fontWeight: FontWeight.w500,
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(10), horizontal: AppSizes.setWidth(10)),
                child: CommonText(
                  text: Languages.of(context).check.toUpperCase(),
                  fontSize: AppSizes.setFontSize(15),
                  textColor: CustomAppColor.of(context).txtPurple.withOpacityPercent(0.6),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Image.asset(
                AppAssets.icShipping,
                height: AppSizes.setHeight(20),
                width: AppSizes.setWidth(19),
                color: CustomAppColor.of(context).icBlackPurple,
              ),
              SizedBox(width: AppSizes.setWidth(8)),
              CommonText(
                text: Languages.of(context).enterPinCodeForEstimated,
                fontWeight: FontWeight.w500,
                fontSize: AppSizes.setFontSize(14),
                textColor: CustomAppColor.of(context).txtGrey,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: AppSizes.setHeight(11)),
            child: Row(
              children: [
                Image.asset(
                  AppAssets.icCalender,
                  height: AppSizes.setHeight(20),
                  width: AppSizes.setWidth(19),
                  color: CustomAppColor.of(context).icBlackPurple,
                ),
                SizedBox(width: AppSizes.setWidth(8)),
                CommonText(
                  text: AppStrings.dispatch,
                  fontWeight: FontWeight.w500,
                  fontSize: AppSizes.setFontSize(14),
                  textColor: CustomAppColor.of(context).txtGrey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget productDescription(BuildContext context) {
    return CommonDetailCard(
      title: Languages.of(context).productDetails.toUpperCase(),
      textColor: CustomAppColor.of(context).txtBlack,
      detailRows: [
        DetailRowData(label: Languages.of(context).material, value: AppStrings.suede),
        DetailRowData(label: Languages.of(context).pattern, value: AppStrings.banarasiJacquard),
        DetailRowData(label: Languages.of(context).noOfComparments, value: AppStrings.withPieceBlouse),
        DetailRowData(label: Languages.of(context).multipack, value: "1"),
        DetailRowData(label: Languages.of(context).size, value: AppStrings.free),
        DetailRowData(label: Languages.of(context).countryOfOrigin, value: AppStrings.india),
      ],
      isCopyVisible: true,
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

  Widget bottomActionButton(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).txtWhite,
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(10), horizontal: AppSizes.setWidth(22)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonButton(
            width: AppSizes.setWidth(158),
            height: AppSizes.setHeight(40),
            radius: 4,
            isButtonShadow: false,
            borderColor: CustomAppColor.of(context).darkGreen,
            buttonColor: CustomAppColor.of(context).bgBlackWhiteScaffold,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.icWhatsapp,
                  height: AppSizes.setHeight(20),
                  width: AppSizes.setWidth(20),
                  color: CustomAppColor.of(context).darkGreen,
                ),
                SizedBox(width: AppSizes.setWidth(4)),
                CommonText(
                  text: Languages.of(context).shareNow,
                  textColor: CustomAppColor.of(context).darkGreen,
                  fontSize: AppSizes.setFontSize(14),
                )
              ],
            ),
          ),
          CommonButton(
            width: AppSizes.setWidth(158),
            height: AppSizes.setHeight(40),
            btnText: Languages.of(context).buyNow.toUpperCase(),
            fontSize: AppSizes.setFontSize(14),
            radius: 4,
          )
        ],
      ),
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
  }
}
