import 'package:car_shop_app_package/localization/language/languages.dart';
import 'package:car_shop_app_package/utils/app_assets.dart';
import 'package:car_shop_app_package/utils/sizer_utils.dart';
import 'package:car_shop_app_package/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../home/view/home_screen.dart';
import '../../popular_cars/view/polpular_cars_screen.dart';

class OverviewPage extends StatefulWidget {
  final bool isShowPriceList;
  const OverviewPage({super.key, this.isShowPriceList = false});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  final PageController _pageController = PageController();

  List<PopularCarItem> popularCars = [
    PopularCarItem(carName: "Tesla Model  Y", carImage: AppAssets.imgTesla, carPrice: "\$32,340", carDescription: "New Looks, Longer Range, And Faster Charging Rate"),
    PopularCarItem(carName: "Tesla Model  Y", carImage: AppAssets.imgTesla2, carPrice: "\$32,340", carDescription: "New Looks, Longer Range, And Faster Charging Rate"),
    PopularCarItem(carName: "Tesla Model  Y", carImage: AppAssets.imgMercedes, carPrice: "\$32,340", carDescription: "New Looks, Longer Range, And Faster Charging Rate"),
  ];
  bool isFavorite = false;
  final Set<int> favoriteIndexes = {};
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 15.setHeight),
      child: Column(
        children: [
          _buildCarImageTop(),
          _buildCarDescription(),
          if (!widget.isShowPriceList) ...{
            _buildCarFeatures(),
            _buildDesignImage(),
            _buildReviewWidget(),
            Divider(
              color: CustomAppColor.of(context).containerBorder,
              height: 7.setHeight,
            ),
            _buildSimilarCars(),
          },
          if (widget.isShowPriceList) ...{
            Divider(
              color: CustomAppColor.of(context).containerBorder,
              height: 7.setHeight,
              thickness: 3,
            ),
            _buildPriceList(),
          },
        ],
      ),
    );
  }

  Widget _buildCarImageTop() {
    return SizedBox(
      height: 280.setHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 250.setHeight,
              child: PageView.builder(
                controller: _pageController,
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 250.setHeight,
                    color: CustomAppColor.of(context).bgSearchBar,
                    padding: EdgeInsets.symmetric(horizontal: 38.setWidth),
                    child: Image.asset(
                      AppAssets.imgTeslaFull,
                      fit: BoxFit.contain,
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: 10.setHeight,
            right: 20.setWidth,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              child: Image.asset(
                isFavorite ? AppAssets.icTabFavouriteSelected : AppAssets.icFavourite,
                height: 24.setHeight,
                width: 22.setWidth,
              ),
            ),
          ),
          Positioned(
            left: 0,
            child: InkWell(
              onTap: () {
                _pageController.animateToPage(
                  (_pageController.page!.toInt() - 1).clamp(0, 10),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).black.withOpacityPercent(0.3),
                  shape: BoxShape.circle,
                ),
                height: 30.setHeight,
                width: 30.setWidth,
                margin: EdgeInsets.only(left: 10.setWidth, bottom: 25.setHeight),
                alignment: Alignment.center,
                child: Icon(
                  Icons.chevron_left_rounded,
                  size: 24.setFontSize,
                  color: CustomAppColor.of(context).white,
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: InkWell(
              onTap: () {
                _pageController.animateToPage(
                  (_pageController.page!.toInt() + 1).clamp(0, 10),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).black.withOpacityPercent(0.3),
                  shape: BoxShape.circle,
                ),
                height: 30.setHeight,
                width: 30.setWidth,
                margin: EdgeInsets.only(right: 10.setWidth, bottom: 25.setHeight),
                alignment: Alignment.center,
                child: Icon(
                  Icons.chevron_right_rounded,
                  size: 24.setFontSize,
                  color: CustomAppColor.of(context).white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            right: 20,
            child: Row(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      AppAssets.imgTesla,
                      fit: BoxFit.contain,
                      height: 45.setHeight,
                      width: 45.setWidth,
                    ),
                    Container(
                      height: 45.setHeight,
                      width: 45.setWidth,
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).black.withOpacityPercent(0.6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(text: "10+", style: TextStyle(fontSize: 12.setFontSize, fontWeight: FontWeight.w500, fontFamily: Constant.fontFamily, color: CustomAppColor.of(context).white)),
                            TextSpan(text: "\nImages", style: TextStyle(fontSize: 8.setFontSize, fontWeight: FontWeight.w500, fontFamily: Constant.fontFamily, color: CustomAppColor.of(context).white)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10.setWidth),
                Stack(
                  children: [
                    Image.asset(
                      AppAssets.imgTesla,
                      fit: BoxFit.contain,
                      height: 45.setHeight,
                      width: 45.setWidth,
                    ),
                    Container(
                      height: 45.setHeight,
                      width: 45.setWidth,
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).black.withOpacityPercent(0.6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(text: "+4", style: TextStyle(fontSize: 12.setFontSize, fontWeight: FontWeight.w500, fontFamily: Constant.fontFamily, color: CustomAppColor.of(context).white)),
                            TextSpan(text: "\nColors", style: TextStyle(fontSize: 8.setFontSize, fontWeight: FontWeight.w500, fontFamily: Constant.fontFamily, color: CustomAppColor.of(context).white)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarDescription() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 10.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CommonText(
                  text: "Tesla Model Y",
                  fontSize: 16.setFontSize,
                  fontWeight: FontWeight.w500,
                  textColor: CustomAppColor.of(context).txtBlack,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(width: 5.setWidth),
              CommonText(
                text: "⭐ 4.9",
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w400,
                textColor: CustomAppColor.of(context).txtDarkGray,
              ),
            ],
          ),
          SizedBox(height: 5.setHeight),
          CommonText(
            text: "\$32,340",
            fontSize: 20.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 5.setHeight),
          CommonText(
            text:
                "New tesla model y  Looks stanning , Longer Range, And Faster Charging Rate Lorem Ipsum is simply dummy text of the printing and typesetting industry. tesla model y Looks stanning , Longer Range, And Faster Charging Rate Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
            fontSize: 10.setFontSize,
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtGray,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }

  Widget _buildCarFeatures() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 10.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtFeatures,
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 10.setHeight),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: CustomAppColor.of(context).containerBorder),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 10.setHeight),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: CustomAppColor.of(context).bgSearchBar,
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(10.setWidth),
                          child: Image.asset(
                            AppAssets.icSeat,
                            height: 20.setHeight,
                            width: 20.setWidth,
                            color: CustomAppColor.of(context).txtBlack,
                          ),
                        ),
                        SizedBox(height: 13.setHeight),
                        CommonText(
                          text: Languages.of(context).txtTotalCapacity,
                          fontSize: 12.setFontSize,
                          fontWeight: FontWeight.w400,
                          textColor: CustomAppColor.of(context).txtGray,
                        ),
                        SizedBox(height: 6.setHeight),
                        CommonText(
                          text: "6 Seats",
                          fontSize: 15.setFontSize,
                          fontWeight: FontWeight.w600,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10.setWidth),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: CustomAppColor.of(context).containerBorder),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 10.setHeight),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: CustomAppColor.of(context).bgSearchBar,
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(10.setWidth),
                          child: Image.asset(
                            AppAssets.icSpeed,
                            height: 20.setHeight,
                            width: 20.setWidth,
                            color: CustomAppColor.of(context).txtBlack,
                          ),
                        ),
                        SizedBox(height: 13.setHeight),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
                          child: CommonText(
                            text: Languages.of(context).txtHigherSpeed,
                            fontSize: 12.setFontSize,
                            fontWeight: FontWeight.w400,
                            textColor: CustomAppColor.of(context).txtGray,
                          ),
                        ),
                        SizedBox(height: 6.setHeight),
                        CommonText(
                          text: "200 km/h",
                          fontSize: 15.setFontSize,
                          fontWeight: FontWeight.w600,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10.setWidth),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: CustomAppColor.of(context).containerBorder),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 10.setHeight),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: CustomAppColor.of(context).bgSearchBar,
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(10.setWidth),
                          child: Image.asset(
                            AppAssets.icEngine,
                            height: 20.setHeight,
                            width: 20.setWidth,
                            color: CustomAppColor.of(context).txtBlack,
                          ),
                        ),
                        SizedBox(height: 13.setHeight),
                        CommonText(
                          text: Languages.of(context).txtEngineOutput,
                          fontSize: 12.setFontSize,
                          fontWeight: FontWeight.w400,
                          textColor: CustomAppColor.of(context).txtGray,
                        ),
                        SizedBox(height: 6.setHeight),
                        CommonText(
                          text: "500 HP",
                          fontSize: 15.setFontSize,
                          fontWeight: FontWeight.w600,
                          textColor: CustomAppColor.of(context).txtBlack,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.setWidth),
            child: Row(
              children: [
                Icon(Icons.check_circle, size: 14.setHeight, color: CustomAppColor.of(context).txtBlack),
                SizedBox(width: 5.setWidth),
                CommonText(
                  text: "Lorem Ipsum is simply dummy text.",
                  fontSize: 10.setFontSize,
                  fontWeight: FontWeight.w400,
                  textColor: CustomAppColor.of(context).txtGray,
                ),
              ],
            ),
          ),
          SizedBox(height: 5.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.setWidth),
            child: Row(
              children: [
                Icon(Icons.check_circle, size: 14.setHeight, color: CustomAppColor.of(context).txtBlack),
                SizedBox(width: 5.setWidth),
                CommonText(
                  text: "Lorem Ipsum is simply dummy text of the printing.",
                  fontSize: 10.setFontSize,
                  fontWeight: FontWeight.w400,
                  textColor: CustomAppColor.of(context).txtGray,
                ),
              ],
            ),
          ),
          SizedBox(height: 5.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.setWidth),
            child: Row(
              children: [
                Icon(Icons.check_circle, size: 14.setHeight, color: CustomAppColor.of(context).txtBlack),
                SizedBox(width: 5.setWidth),
                CommonText(
                  text: "100% simply dummy text of the printing.",
                  fontSize: 10.setFontSize,
                  fontWeight: FontWeight.w400,
                  textColor: CustomAppColor.of(context).txtGray,
                ),
              ],
            ),
          ),
          SizedBox(height: 5.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.setWidth),
            child: Row(
              children: [
                Icon(Icons.check_circle, size: 14.setHeight, color: CustomAppColor.of(context).txtBlack),
                SizedBox(width: 5.setWidth),
                CommonText(
                  text: "Lorem Ipsum is simply dummy text of the industry.",
                  fontSize: 10.setFontSize,
                  fontWeight: FontWeight.w400,
                  textColor: CustomAppColor.of(context).txtGray,
                ),
              ],
            ),
          ),
          SizedBox(height: 15.setHeight),
          Divider(
            color: CustomAppColor.of(context).containerBorder,
            height: 1,
            indent: 5.setWidth,
            endIndent: 5.setWidth,
          ),
          SizedBox(height: 10.setHeight),
        ],
      ),
    );
  }

  Widget _buildDesignImage() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtDesignImages,
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 10.setHeight),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Image.asset(AppAssets.icCarDesign, fit: BoxFit.cover),
                ),
                SizedBox(width: 15.setWidth),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: 3.setHeight),
                      Image.asset(AppAssets.icCarDesign3, fit: BoxFit.contain),
                      SizedBox(height: 10.setHeight),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(AppAssets.icCarDesign2, fit: BoxFit.contain),
                          CommonText(
                            text: "10+ Images",
                            fontSize: 18.setFontSize,
                            fontWeight: FontWeight.w500,
                            textColor: CustomAppColor.of(context).white,
                          ),
                        ],
                      ),
                      SizedBox(height: 3.setHeight),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.setHeight),
          Divider(
            color: CustomAppColor.of(context).containerBorder,
            height: 1,
            indent: 5.setWidth,
            endIndent: 5.setWidth,
          ),
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
                    SizedBox(height: 8.setHeight),
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
                    SizedBox(height: 8.setHeight),
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
          textColor: Color(0xFFFABD3B),
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

  Widget _buildSimilarCars() {
    return Column(
      children: [
        SizedBox(height: 15.setHeight),
        Row(
          children: [
            SizedBox(width: 20.setWidth),
            CommonText(
              text: Languages.of(context).txtSimilarCars,
              fontSize: 16.setFontSize,
              fontWeight: FontWeight.w600,
              textColor: CustomAppColor.of(context).txtBlack,
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PolpularCarsScreen(cars: popularCars)));
              },
              child: CommonText(
                text: Languages.of(context).txtSeeAll,
                fontSize: 12.setFontSize,
                fontWeight: FontWeight.w600,
                textColor: CustomAppColor.of(context).txtSeeAll,
              ),
            ),
            SizedBox(width: 20.setWidth),
          ],
        ),
        SizedBox(height: 15.setHeight),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
          child: Row(
            children: List.generate(popularCars.length, (index) {
              return CarItemWidget(
                car: popularCars[index],
                marginRight: 15.setWidth,
                isFavorite: favoriteIndexes.contains(index),
                onFavoriteToggle: () {
                  setState(() {
                    if (favoriteIndexes.contains(index)) {
                      favoriteIndexes.remove(index);
                    } else {
                      favoriteIndexes.add(index);
                    }
                  });
                },
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15.setHeight),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.setWidth),
          child: CommonText(
            text: "Tesla Model Y Price List (Variant)",
            fontSize: 16.setFontSize,
            fontWeight: FontWeight.w600,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
        ),
        SizedBox(height: 20.setHeight),
        _buildVariantCard(
          title: "Tesla Model Y Base Variant",
          showroom: "\$26,000",
          rto: "\$04,000",
          insurance: "\$02,000",
          otherCharges: "\$340.0",
          totalPrice: "\$32,340",
        ),
        SizedBox(height: 16.setHeight),
        _buildVariantCard(
          title: "Tesla Model Y Top Variant",
          showroom: "\$26,000",
          rto: "\$04,000",
          insurance: "\$03,000",
          otherCharges: "\$340.0",
          totalPrice: "\$32,340",
        ),
      ],
    );
  }

  Widget _buildVariantCard({
    required String title,
    required String showroom,
    required String rto,
    required String insurance,
    required String otherCharges,
    required String totalPrice,
  }) {
    return Container(
      padding: EdgeInsets.all(16.setWidth),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgSearchBar,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: title,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w500,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          SizedBox(height: 8.setHeight),
          _buildPriceRow("Showroom", showroom, false),
          SizedBox(height: 4.setHeight),
          _buildPriceRow("RTO", rto, false),
          SizedBox(height: 4.setHeight),
          _buildPriceRow("Insurance", insurance, false),
          SizedBox(height: 4.setHeight),
          _buildPriceRow("Other Charges", otherCharges, false),
          SizedBox(height: 6.setHeight),
          Divider(
            color: CustomAppColor.of(context).containerBorder.withOpacityPercent(0.3),
            height: 1,
          ),
          _buildPriceRow("Total Price", totalPrice, true),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String price, bool isTotal) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommonText(
          text: label,
          fontSize: 12.setFontSize,
          fontWeight: FontWeight.w500,
          textColor: isTotal ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).txtGray,
        ),
        CommonText(
          text: price,
          fontSize: 12.setFontSize,
          fontWeight: isTotal ? FontWeight.w600 : FontWeight.w500,
          textColor: CustomAppColor.of(context).txtBlack,
        ),
      ],
    );
  }
}
