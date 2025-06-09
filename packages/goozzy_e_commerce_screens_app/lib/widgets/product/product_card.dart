import 'package:flutter/material.dart';
import 'package:goozzy_e_commerce_screens_app_package/utils/utils.dart';

import '../../localization/language/languages.dart';
import '../../ui/home_screen/datamodel/home_screen_data.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import '../../utils/sizer_utils.dart';
import '../../utils/string_constant.dart';
import '../button/common_button.dart';
import '../text/common_text.dart';

class ProductsDetail extends StatelessWidget {
  final List<Products> productsList;
  final dynamic Function()? onTap;
  final bool? isShowTrusted;
  final bool? isShowMrp;
  final bool? isRatingShown;
  final bool? isDownloadVisible;
  final String btnText;
  final bool? isFavouriteVisible;
  final double? imageWidth;
  final bool? isImageBorderVisible;
  final bool? isFilledFavouriteVisible;

  const ProductsDetail({
    super.key,
    required this.productsList,
    this.onTap,
    this.isShowMrp = false,
    this.isShowTrusted = false,
    this.isRatingShown = true,
    required this.btnText,
    this.isFavouriteVisible = false,
    this.imageWidth,
    this.isImageBorderVisible,
    this.isDownloadVisible = false,
    this.isFilledFavouriteVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).bgTopBar,
      width: AppSizes.fullWidth,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(10)),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: productsList.length,
        itemBuilder: (context, index) {
          final product = productsList[index];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(5)),
            child: Container(
              padding: EdgeInsets.only(left: AppSizes.setWidth(15), top: AppSizes.setHeight(18)),
              decoration: BoxDecoration(color: CustomAppColor.of(context).bgScaffold),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(8)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CommonText(
                            text: product.productName,
                            fontWeight: FontWeight.w700,
                            fontSize: AppSizes.setFontSize(15),
                            textColor: CustomAppColor.of(context).txtGrey,
                            textAlign: TextAlign.start,
                            maxLines: 2,
                          ),
                        ),
                        Visibility(
                          visible: isFavouriteVisible ?? false,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(18)),
                            child: Image.asset(
                              AppAssets.icHeart,
                              width: AppSizes.setWidth(24),
                              height: AppSizes.setHeight(24),
                              color: CustomAppColor.of(context).txtGrey,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: isFilledFavouriteVisible ?? false,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(18)),
                            child: Image.asset(
                              AppAssets.icFilledFavourite,
                              width: AppSizes.setWidth(20),
                              height: AppSizes.setHeight(19),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: AppSizes.setHeight(22)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (isImageBorderVisible ?? false)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(10)),
                            child: Container(
                              height: AppSizes.setHeight(124),
                              width: AppSizes.setWidth(89),
                              padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(10)),
                              decoration: BoxDecoration(
                                  color: CustomAppColor.of(context).white,
                                  border: Border.all(color: CustomAppColor.of(context).bgContainerGrey.withOpacityPercent(0.3)),
                                  borderRadius: BorderRadius.circular(5)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  product.productImage,
                                  height: AppSizes.setHeight(124),
                                  width: imageWidth ?? AppSizes.setWidth(89),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        if (!(isImageBorderVisible ?? false))
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(5)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                product.productImage,
                                height: AppSizes.setHeight(124),
                                width: AppSizes.setWidth(89),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        SizedBox(width: AppSizes.setWidth(8)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: AppSizes.setHeight(4)),
                              Row(
                                children: [
                                  CommonText(
                                    text: "\$ ${product.productPrice}",
                                    fontWeight: FontWeight.w700,
                                    fontSize: AppSizes.setFontSize(18),
                                    textColor: CustomAppColor.of(context).txtBlack,
                                  ),
                                  SizedBox(width: AppSizes.setWidth(14)),
                                  CommonText(
                                    text: Languages.of(context).freeDelivery,
                                    fontWeight: FontWeight.w500,
                                    fontSize: AppSizes.setFontSize(12),
                                    textColor: CustomAppColor.of(context).txtGrey,
                                  ),
                                ],
                              ),
                              SizedBox(height: AppSizes.setHeight(4)),
                              Row(
                                children: [
                                  Image.asset(
                                    AppAssets.icDiscount,
                                    height: AppSizes.setHeight(11),
                                    width: AppSizes.setWidth(10),
                                  ),
                                  SizedBox(width: AppSizes.setWidth(2)),
                                  CommonText(
                                    text: product.discount,
                                    fontWeight: FontWeight.w700,
                                    fontSize: AppSizes.setFontSize(10),
                                    textColor: CustomAppColor.of(context).txtBlack,
                                  ),
                                ],
                              ),
                              SizedBox(height: isShowMrp ?? false ? AppSizes.setHeight(10) : AppSizes.setHeight(10)),
                              Visibility(
                                visible: isShowMrp ?? false,
                                child: Row(
                                  children: [
                                    CommonText(
                                      text: Languages.of(context).mrp,
                                      fontWeight: FontWeight.w700,
                                      fontSize: AppSizes.setFontSize(10),
                                      textColor: CustomAppColor.of(context).txtGrey,
                                    ),
                                    SizedBox(width: AppSizes.setWidth(2)),
                                    CommonText(
                                      text: "\$599",
                                      fontWeight: FontWeight.w700,
                                      fontSize: AppSizes.setFontSize(10),
                                      textColor: CustomAppColor.of(context).txtBlack,
                                    ),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: isShowTrusted ?? false,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(6)),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        AppAssets.icTrust,
                                        height: AppSizes.setHeight(14),
                                        width: AppSizes.setWidth(14),
                                      ),
                                      SizedBox(width: AppSizes.setWidth(8)),
                                      Container(
                                        width: AppSizes.setWidth(43),
                                        height: AppSizes.setHeight(14),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(2),
                                          color: CustomAppColor.of(context).btnPurple.withOpacityPercent(0.1),
                                        ),
                                        child: CommonText(
                                          text: Languages.of(context).trusted,
                                          fontWeight: FontWeight.w500,
                                          fontSize: AppSizes.setFontSize(8),
                                          textColor: CustomAppColor.of(context).txtPurple,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: isRatingShown ?? false,
                                child: Row(
                                  children: [
                                    Container(
                                      width: AppSizes.setWidth(41),
                                      height: AppSizes.setHeight(20),
                                      decoration: BoxDecoration(color: CustomAppColor.of(context).green, borderRadius: BorderRadius.circular(3)),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          CommonText(
                                            text: "3.8",
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
                                    SizedBox(width: AppSizes.setWidth(8)),
                                    CommonText(
                                      text: AppStrings.fourRating,
                                      textColor: CustomAppColor.of(context).txtGrey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: AppSizes.setFontSize(12),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: AppSizes.setWidth(4)),
                              Visibility(
                                visible: !(isDownloadVisible ?? false),
                                child: Padding(
                                  padding: isRatingShown ?? false
                                      ? EdgeInsets.only(top: AppSizes.setHeight(10))
                                      : EdgeInsets.only(top: AppSizes.setHeight(0)),
                                  child: Row(
                                    children: [
                                      CommonButton(
                                        radius: 3,
                                        height: AppSizes.setHeight(34),
                                        width: AppSizes.setWidth(173),
                                        btnText: btnText,
                                        onTap: onTap,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: AppSizes.setWidth(18)),
                                        child: CommonButton(
                                          height: AppSizes.setHeight(34),
                                          width: AppSizes.setWidth(34),
                                          radius: 3,
                                          buttonColor: CustomAppColor.of(context).darkGreen,
                                          child: Image.asset(
                                            AppAssets.icWhatsapp,
                                            width: AppSizes.setWidth(18),
                                            height: AppSizes.setHeight(19),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: isDownloadVisible ?? false,
                                child: Padding(
                                  padding: isRatingShown ?? false
                                      ? EdgeInsets.only(
                                          top: AppSizes.setHeight(10),
                                        )
                                      : EdgeInsets.only(top: AppSizes.setHeight(0)),
                                  child: Row(
                                    children: [
                                      CommonButton(
                                        height: AppSizes.setHeight(34),
                                        width: AppSizes.setWidth(101),
                                        radius: 3,
                                        buttonColor: CustomAppColor.of(context).darkGreen,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              AppAssets.icWhatsapp,
                                              width: AppSizes.setWidth(18),
                                              height: AppSizes.setHeight(19),
                                            ),
                                            SizedBox(width: AppSizes.setWidth(4)),
                                            CommonText(
                                              text: Languages.of(context).shareNow,
                                              fontSize: AppSizes.setFontSize(12),
                                              textColor: CustomAppColor.of(context).white,
                                              fontWeight: FontWeight.w600,
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: AppSizes.setWidth(26)),
                                      Column(
                                        children: [
                                          Image.asset(
                                            AppAssets.icDownload,
                                            width: AppSizes.setWidth(24),
                                            height: AppSizes.setHeight(24),
                                          ),
                                          CommonText(
                                            text: Languages.of(context).download,
                                            fontWeight: FontWeight.w700,
                                            fontSize: AppSizes.setFontSize(10),
                                          )
                                        ],
                                      ),
                                      SizedBox(width: AppSizes.setWidth(24)),
                                      Column(
                                        children: [
                                          Image.asset(
                                            AppAssets.icShare,
                                            color: CustomAppColor.of(context).txtGrey,
                                            width: AppSizes.setWidth(20),
                                            height: AppSizes.setHeight(20),
                                          ),
                                          CommonText(
                                            text: Languages.of(context).share,
                                            fontWeight: FontWeight.w700,
                                            fontSize: AppSizes.setFontSize(10),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(20)),
                    child: SizedBox(
                      height: AppSizes.setHeight(70),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: product.productImageList.length,
                        itemBuilder: (context, index) {
                          final image = product.productImageList[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(10)),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: CustomAppColor.of(context).white,
                                  border: Border.all(
                                      color: isImageBorderVisible ?? false
                                          ? CustomAppColor.of(context).bgContainerGrey.withOpacityPercent(0.3)
                                          : CustomAppColor.of(context).txtWhite),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Image.asset(
                                image,
                                height: AppSizes.setHeight(69),
                                width: AppSizes.setWidth(78),
                                fit: BoxFit.contain,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
