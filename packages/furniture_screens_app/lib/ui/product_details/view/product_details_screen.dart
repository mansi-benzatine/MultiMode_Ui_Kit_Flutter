import 'package:flutter/material.dart';
import 'package:furniture_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:furniture_screens_app_package/localization/language/languages.dart';
import 'package:furniture_screens_app_package/ui/checkout/view/checkout_screen.dart';
import 'package:furniture_screens_app_package/ui/reviews/view/reviews_screen.dart';
import 'package:furniture_screens_app_package/utils/app_assets.dart';
import 'package:furniture_screens_app_package/utils/app_color.dart';
import 'package:furniture_screens_app_package/utils/constant.dart';
import 'package:furniture_screens_app_package/utils/sizer_utils.dart';
import 'package:furniture_screens_app_package/widgets/button/common_button.dart';
import 'package:furniture_screens_app_package/widgets/text/common_text.dart';
import 'package:furniture_screens_app_package/widgets/top_bar/topbar.dart';
import 'package:readmore/readmore.dart';

import '../../../widgets/bottom_sheet/share_bottom_sheet.dart';
import '../../category_details/datamodel/catergory_details_data.dart';

class ProductDetailsScreen extends StatefulWidget {
  final bool isForShareDialog;
  static Route<void> route({bool isForShareDialog = false}) {
    return MaterialPageRoute(builder: (_) => ProductDetailsScreen(isForShareDialog: isForShareDialog));
  }

  const ProductDetailsScreen({super.key, this.isForShareDialog = false});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> implements TopBarClickListener {
  int selectedImageIndex = 0;

  final List<String> sofaImages = [
    AppAssets.imgDummySofa1,
    AppAssets.imgDummySofa1,
    AppAssets.imgDummySofa1,
  ];
  final List<ProductItem> similarProducts = [
    ProductItem(
      name: "Lolita Sofa",
      description: "Luxury Big Sofa",
      image: AppAssets.imgDummySofa,
      rating: 4.3,
      price: 299.00,
      category: "Sofa",
    ),
    ProductItem(
      name: "Lolita Sofa",
      description: "Luxury Big Sofa",
      image: AppAssets.imgDummySofa,
      rating: 4.5,
      price: 299.00,
      category: "Sofa",
    ),
  ];
  final List<ProductItem> youMayAlsoLikeProducts = [
    ProductItem(
      name: "Arm Chair",
      description: "Luxury Big Sofa",
      image: AppAssets.imgDummyChair,
      rating: 4.3,
      price: 299.00,
      category: "Luxury Big Sofa",
    ),
    ProductItem(
      name: "Grifo Lamp",
      description: "Luxury Big Sofa",
      image: AppAssets.imgDummyLamp,
      rating: 4.5,
      price: 299.00,
      category: "Night Lamp",
    ),
  ];
  final ProductItem item = ProductItem(
    name: "Lolita Sofa",
    description: "Luxury Big Sofa",
    image: AppAssets.imgDummySofa,
    rating: 4.3,
    price: 299.00,
    category: "Luxury Big Sofa",
  );
  int selectedIndex = 0;
  bool _isBottomSheetOpen = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isForShareDialog) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          setState(() {
            _isBottomSheetOpen = true;
          });
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            useSafeArea: true,
            isDismissible: false,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (_) => const ShareBottomSheet(),
          ).whenComplete(
            () {
              if (_isBottomSheetOpen) {
                setState(() {
                  _isBottomSheetOpen = false;
                });
                Navigator.pop(context);
              }
            },
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !_isBottomSheetOpen,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && _isBottomSheetOpen) {
          Navigator.pop(context);
          setState(() {
            _isBottomSheetOpen = false;
          });
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).cardBg,
        body: SafeArea(
          child: Column(
            children: [
              TopBar(
                this,
                isShowBack: true,
                title: "Details",
                isShowShare: true,
                isShowCart: true,
                textAlign: TextAlign.center,
                appBarColor: CustomAppColor.of(context).cardBg,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.setHeight),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 260.setHeight,
                                    padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
                                    color: CustomAppColor.of(context).cardBg,
                                    child: PageView.builder(
                                      controller: PageController(initialPage: selectedImageIndex),
                                      itemCount: sofaImages.length,
                                      onPageChanged: (index) {
                                        setState(() => selectedImageIndex = index);
                                      },
                                      itemBuilder: (context, index) {
                                        return Image.asset(
                                          sofaImages[index],
                                          fit: BoxFit.contain,
                                        );
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    left: 0,
                                    bottom: 20.setHeight,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: List.generate(
                                        sofaImages.length,
                                        (index) => Container(
                                          margin: EdgeInsets.symmetric(horizontal: 2.setWidth),
                                          width: selectedImageIndex == index ? 16.setWidth : 4.setWidth,
                                          height: 4.setHeight,
                                          decoration: BoxDecoration(
                                            color: selectedImageIndex == index ? CustomAppColor.of(context).primary : CustomAppColor.of(context).dividerColor,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 50.setHeight,
                                color: CustomAppColor.of(context).bgScreen,
                              ),
                            ],
                          ),
                          Positioned(
                            right: 16.setHeight,
                            bottom: 25.setHeight,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  item.isSelected = !item.isSelected;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: CustomAppColor.of(context).primary,
                                ),
                                child: Image.asset(
                                  item.isSelected ? AppAssets.icSelectedOrder : AppAssets.icUnselectedOrder,
                                  height: 24.setHeight,
                                  width: 24.setWidth,
                                  color: CustomAppColor.of(context).white,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 25.setHeight,
                            left: 20.setWidth,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    sofaImages.length,
                                    (index) => GestureDetector(
                                      onTap: () {
                                        setState(() => selectedImageIndex = index);
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 2),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: selectedImageIndex == index ? CustomAppColor.of(context).primary : CustomAppColor.of(context).dividerColor,
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(8),
                                            color: CustomAppColor.of(context).containerBg),
                                        child: Image.asset(
                                          sofaImages[index],
                                          width: selectedImageIndex == index ? 46.setHeight : 40.setHeight,
                                          height: selectedImageIndex == index ? 46.setHeight : 40.setHeight,
                                          fit: BoxFit.contain,
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
                      _productDetails(),
                      _productColour(),
                      _productReview(context),
                      _similarProductAndYouMayAlsoLikeListView(categoriesList: similarProducts, title: Languages.of(context).txtSimilarProduct),
                      _similarProductAndYouMayAlsoLikeListView(categoriesList: youMayAlsoLikeProducts, title: Languages.of(context).txtYouMayAlsoLike),
                    ],
                  ),
                ),
              ),
              const BuyNowView()
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
    if (name == Constant.strShare) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (_) => const ShareBottomSheet(),
      );
    }
  }

  _productDetails() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScreen,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: "Lolita Sofa",
                fontFamily: Constant.fontFamilyBold700,
                fontSize: 26.setFontSize,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AppAssets.icStar,
                    height: 16.setHeight,
                    width: 16.setHeight,
                  ),
                  SizedBox(width: 5.setWidth),
                  CommonText(
                    text: "4.3 (23 Reviews)",
                    fontFamily: Constant.fontFamilyMedium500,
                    fontSize: 16.setFontSize,
                  ),
                ],
              )
            ],
          ),
          CommonText(
            text: "Luxury Big Sofa",
            fontFamily: Constant.fontFamilyMedium500,
            fontSize: 14.setFontSize,
            textColor: CustomAppColor.of(context).txtLightGrey,
          ),
          SizedBox(height: 2.setHeight),
          CommonText(
            text: "\$299.00",
            fontFamily: Constant.fontFamilyBold700,
            fontSize: 26.setFontSize,
          ),
          SizedBox(height: 15.setHeight),
          ReadMoreText(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever Lorem Ipsu is simply dummy Lorem Ipsum is simply dummy text of the printing and type setting industry',
            trimMode: TrimMode.Line,
            trimLines: 4,
            trimCollapsedText: 'Show more',
            trimExpandedText: '...Show less',
            style: TextStyle(
              fontSize: 14.setFontSize,
              fontFamily: Constant.fontFamilyRegular400,
              package: 'furniture_screens_app_package',
            ),
            lessStyle: TextStyle(
              fontSize: 14.setFontSize,
              fontFamily: Constant.fontFamilySemiBold600,
              color: CustomAppColor.of(context).txtPrimary,
              package: 'furniture_screens_app_package',
            ),
            moreStyle: TextStyle(
              fontSize: 14.setFontSize,
              fontFamily: Constant.fontFamilySemiBold600,
              color: CustomAppColor.of(context).txtPrimary,
              package: 'furniture_screens_app_package',
            ),
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: Languages.of(context).txtMaterial,
            fontFamily: Constant.fontFamilyBold700,
            fontSize: 14.setFontSize,
          ),
          ReadMoreText(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever Lorem Ipsu is simply dummy Lorem Ipsum is simply dummy text of the printing and type setting industry',
            trimMode: TrimMode.Line,
            trimLines: 4,
            trimCollapsedText: 'Show more',
            trimExpandedText: '...Show less',
            style: TextStyle(
              fontSize: 14.setFontSize,
              fontFamily: Constant.fontFamilyRegular400,
              package: 'furniture_screens_app_package',
            ),
            lessStyle: TextStyle(
              fontSize: 14.setFontSize,
              fontFamily: Constant.fontFamilySemiBold600,
              color: CustomAppColor.of(context).txtPrimary,
              package: 'furniture_screens_app_package',
            ),
            moreStyle: TextStyle(
              fontSize: 14.setFontSize,
              fontFamily: Constant.fontFamilySemiBold600,
              color: CustomAppColor.of(context).txtPrimary,
              package: 'furniture_screens_app_package',
            ),
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: Languages.of(context).txtFebric,
            fontFamily: Constant.fontFamilyBold700,
            fontSize: 14.setFontSize,
          ),
          ReadMoreText(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever Lorem Ipsu is simply dummy Lorem Ipsum is simply dummy text of the printing and type setting industry',
            trimMode: TrimMode.Line,
            trimLines: 4,
            trimCollapsedText: 'Show more',
            trimExpandedText: '...Show less',
            style: TextStyle(
              fontSize: 14.setFontSize,
              fontFamily: Constant.fontFamilyRegular400,
              package: 'furniture_screens_app_package',
            ),
            moreStyle: TextStyle(
              fontSize: 14.setFontSize,
              fontFamily: Constant.fontFamilySemiBold600,
              color: CustomAppColor.of(context).txtPrimary,
              package: 'furniture_screens_app_package',
            ),
            lessStyle: TextStyle(
              fontSize: 14.setFontSize,
              fontFamily: Constant.fontFamilySemiBold600,
              color: CustomAppColor.of(context).txtPrimary,
              package: 'furniture_screens_app_package',
            ),
          ),
          SizedBox(height: 20.setHeight),
        ],
      ),
    );
  }

  _productColour() {
    final colors = [
      Colors.orange,
      Colors.grey.shade300,
      Colors.blue.shade400,
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 10),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScreen,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CommonText(
            text: "${Languages.of(context).txtColor} :",
            fontSize: 20.setFontSize,
            fontFamily: Constant.fontFamilySemiBold600,
          ),
          SizedBox(width: 12.setWidth),
          Row(
            children: List.generate(colors.length, (index) {
              final isSelected = index == selectedIndex;
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 12.setWidth),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: colors[index],
                          shape: BoxShape.circle,
                        ),
                      ),
                      if (isSelected)
                        const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 18,
                        ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  _productReview(BuildContext context) {
    final ratingDistribution = {
      5: 0.75,
      4: 0.30,
      3: 0.10,
      2: 0.18,
      1: 0.01,
    };

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScreen,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.setHeight),
          IgnorePointer(
            ignoring: true,
            child: InkWell(
              onTap: () => Navigator.push(context, ReviewsScreen.route()),
              child: CommonText(
                text: "${Languages.of(context).txtReview} :",
                fontSize: 20.setFontSize,
                fontFamily: Constant.fontFamilySemiBold600,
              ),
            ),
          ),
          SizedBox(height: 20.setHeight),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonText(
                    text: "4.5",
                    fontSize: 60.setFontSize,
                    height: 0,
                    fontFamily: Constant.fontFamilyRegular400,
                  ),
                  Row(
                    children: List.generate(5, (index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.setWidth),
                        child: Image.asset(
                          AppAssets.icStar,
                          height: 18.setHeight,
                          width: 18.setHeight,
                          color: index == 4 ? CustomAppColor.of(context).txtGray : null,
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 8.setHeight),
                  CommonText(
                    text: "4,487 Review",
                    fontSize: 14.setFontSize,
                    fontFamily: Constant.fontFamilyMedium500,
                  ),
                ],
              ),
              SizedBox(width: 35.setWidth),
              Expanded(
                child: Column(
                  children: ratingDistribution.entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            AppAssets.icStar,
                            width: 15.setHeight,
                            height: 15.setHeight,
                          ),
                          SizedBox(width: 4.setWidth),
                          CommonText(
                            text: entry.key.toString(),
                            textColor: const Color(0xffFABD3B),
                            fontFamily: Constant.fontFamilyRegular400,
                          ),
                          SizedBox(width: 8.setWidth),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: entry.value,
                              backgroundColor: CustomAppColor.of(context).borderTextFormField,
                              color: Colors.amber,
                              minHeight: 2,
                              borderRadius: const BorderRadius.all(Radius.circular(12)),
                            ),
                          ),
                          SizedBox(width: 8.setWidth),
                          CommonText(
                            text: "${(entry.value * 100).toInt()}%",
                            fontFamily: Constant.fontFamilyRegular400,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.setHeight),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 5.setHeight,
                    width: 5.setWidth,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: CustomAppColor.of(context).icBlackWhite,
                    ),
                  ),
                  SizedBox(width: 5.setWidth),
                  CommonText(
                    text: "Premium Fabric, Lasting Quality",
                    fontSize: 14.setFontSize,
                  ),
                ],
              ),
              SizedBox(height: 3.setHeight),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 5.setHeight,
                    width: 5.setWidth,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: CustomAppColor.of(context).icBlackWhite,
                    ),
                  ),
                  SizedBox(width: 5.setWidth),
                  CommonText(
                    text: "Superior Craftsmanship,Lasting Strength",
                    fontSize: 14.setFontSize,
                  ),
                ],
              ),
              SizedBox(height: 3.setHeight),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 5.setHeight,
                    width: 5.setWidth,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: CustomAppColor.of(context).icBlackWhite,
                    ),
                  ),
                  SizedBox(width: 5.setWidth),
                  CommonText(
                    text: "Plush Feel, Premium Quality",
                    fontSize: 14.setFontSize,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.setHeight),
        ],
      ),
    );
  }

  _similarProductAndYouMayAlsoLikeListView({required List<ProductItem> categoriesList, required String title}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScreen,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                text: title,
                fontFamily: Constant.fontFamilyBold700,
                fontSize: 22.setFontSize,
              ),
              CommonText(
                text: Languages.of(context).txtSeeAll,
                fontFamily: Constant.fontFamilyMedium500,
                fontSize: 16.setFontSize,
              ),
            ],
          ),
          SizedBox(height: 10.setHeight),
          Wrap(
            spacing: 18.setWidth,
            runSpacing: 16.setHeight,
            children: List.generate(
              categoriesList.length,
              (index) {
                final item = categoriesList[index];
                return SizedBox(
                  width: (MediaQuery.of(context).size.width - (18.setWidth * 2) - 30.setWidth) / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Image.asset(
                              item.image,
                              width: double.infinity,
                              height: 185.setHeight,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 10.setHeight,
                            right: 10.setWidth,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  item.isSelected = !item.isSelected;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: CustomAppColor.of(context).white.withValues(alpha: 0.3),
                                ),
                                padding: const EdgeInsets.all(6),
                                child: Image.asset(
                                  item.isSelected ? AppAssets.icSelectedOrder : AppAssets.icUnselectedOrder,
                                  height: 16.setHeight,
                                  width: 16.setWidth,
                                  color: item.isSelected ? CustomAppColor.of(context).primary : null,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10.setHeight),
                      Row(
                        children: [
                          Expanded(
                            child: CommonText(
                              text: item.category,
                              fontSize: 18.setFontSize,
                              fontFamily: Constant.fontFamilySemiBold600,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                AppAssets.icStar,
                                height: 16.setHeight,
                                width: 16.setWidth,
                              ),
                              SizedBox(width: 3.setWidth),
                              CommonText(
                                text: item.rating.toString(),
                                fontSize: 14.setFontSize,
                                fontFamily: Constant.fontFamilySemiBold600,
                              ),
                            ],
                          ),
                        ],
                      ),
                      CommonText(
                        text: item.name,
                        fontSize: 12.setFontSize,
                        fontFamily: Constant.fontFamilyMedium500,
                        textColor: CustomAppColor.of(context).txtGray,
                      ),
                      CommonText(
                        text: "\$${item.price.toStringAsFixed(2)}",
                        fontSize: 18.setFontSize,
                        fontFamily: Constant.fontFamilySemiBold600,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BuyNowView extends StatefulWidget {
  const BuyNowView({super.key});

  @override
  State<BuyNowView> createState() => _BuyNowViewState();
}

class _BuyNowViewState extends State<BuyNowView> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScreen,
      ),
      padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 20.setHeight),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.setWidth, vertical: 10.setHeight),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).containerBg,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: CustomAppColor.of(context).dividerColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  _buildCircleButton(
                    icon: Icons.remove,
                    onTap: () {
                      if (quantity > 1) {
                        setState(() {
                          quantity--;
                        });
                      }
                    },
                  ),
                  SizedBox(width: 12.setWidth),
                  CommonText(
                    text: quantity.toString(),
                    fontSize: 24.setFontSize,
                    textColor: CustomAppColor.of(context).txtPrimary,
                    fontFamily: Constant.fontFamilySemiBold600,
                  ),
                  SizedBox(width: 12.setWidth),
                  _buildCircleButton(
                    icon: Icons.add,
                    onTap: () {
                      setState(() {
                        quantity++;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: IgnorePointer(
                ignoring: true,
                child: CommonButton(
                  borderColor: CustomAppColor.of(context).btnPrimary,
                  text: Languages.of(context).txtBuyNow,
                  image: AppAssets.icShoppingCart,
                  imageColor: CustomAppColor.of(context).white,
                  onTap: () => Navigator.push(context, CheckoutScreen.route()),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCircleButton({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 10.setHeight),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: CustomAppColor.of(context).primary,
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}
