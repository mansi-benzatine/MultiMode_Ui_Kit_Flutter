import 'dart:ui';

import '../../../../../localization/language/languages.dart';
import '../../../../../utils/app_assets.dart';
import '../../../../../utils/app_color.dart';
import '../../../../../utils/string_constant.dart';
import '../../app/my_app.dart';

class BannerSliderData {
  final String? imagePath;

  BannerSliderData({this.imagePath});
}

class CategoryList {
  final String? imagePath;
  final String? name;
  final Color? color;
  final int? discount;

  CategoryList({
    this.imagePath,
    this.name,
    this.color,
    this.discount,
  });
}

class Products {
  final String productName;
  final String productPrice;
  final String? productMrp;
  final String discount;
  final String productImage;
  final List<String> productImageList;

  Products({
    required this.productName,
    required this.productPrice,
    required this.discount,
    required this.productImage,
    required this.productImageList,
    this.productMrp,
  });
}

class SortByData {
  final String? label;
  final bool? isSelected;
  final bool? isDotVisible;
  final String? imagePath;

  SortByData({this.label, this.isSelected, this.imagePath, this.isDotVisible});
}

List<BannerSliderData> bannerSliderList = [
  BannerSliderData(imagePath: AppAssets.imgBanner1),
  BannerSliderData(imagePath: AppAssets.imgBanner2),
  BannerSliderData(imagePath: AppAssets.imgBanner3),
];

List<CategoryList> categoryList = [
  CategoryList(
    imagePath: AppAssets.icDress,
    name: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).women,
    color: AppColor.containerGreen,
  ),
  CategoryList(
    imagePath: AppAssets.icCoat,
    name: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).men,
    color: AppColor.containerBlue,
  ),
  CategoryList(
    imagePath: AppAssets.icKids,
    name: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).kids,
    color: AppColor.containerPink,
  ),
  CategoryList(
    imagePath: AppAssets.icFootwear,
    name: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).footwear,
    color: AppColor.containerOrange,
  ),
];

List<CategoryList> trendingDealsList = [
  CategoryList(
    imagePath: AppAssets.imgKurti,
    name: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).kurti,
    discount: 50,
  ),
  CategoryList(
    imagePath: AppAssets.imgWomenTop,
    name: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).womenTop,
    discount: 70,
  ),
  CategoryList(
    imagePath: AppAssets.imgJumpSuit,
    name: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).womenTop,
    discount: 50,
  )
];

List<Products> productsList = [
  Products(
    productName: AppStrings.anniDesignerWomenArt,
    productPrice: "299",
    discount: AppStrings.productDiscount1,
    productImage: AppAssets.imgAnniDesigner,
    productMrp: "599",
    productImageList: [
      AppAssets.imgSaree1,
      AppAssets.imgSaree2,
      AppAssets.imgSaree3,
      AppAssets.imgSaree1,
    ],
  ),
  Products(
    productName: AppStrings.womenArtSilkWithBlouse,
    productPrice: "299",
    discount: AppStrings.productDiscount1,
    productImage: AppAssets.imgWomenArtSilk,
    productMrp: "599",
    productImageList: [
      AppAssets.imgSaree1,
      AppAssets.imgSaree2,
      AppAssets.imgSaree3,
      AppAssets.imgDefault,
    ],
  ),
];

List<Products> anniDesignerSareeList = [
  Products(
    productName: AppStrings.anniDesignerWomenArt,
    productPrice: "299",
    discount: AppStrings.productDiscount1,
    productImage: AppAssets.imgAnniDesigner,
    productMrp: "599",
    productImageList: [
      AppAssets.imgYellowSaree1,
      AppAssets.imgYellowSaree2,
      AppAssets.imgYellowSaree3,
      AppAssets.imgDefault,
    ],
  ),
  Products(
    productName: AppStrings.anniDesignerWomenArt,
    productPrice: "299",
    discount: AppStrings.productDiscount1,
    productImage: AppAssets.imgOrangeSaree5,
    productMrp: "599",
    productImageList: [
      AppAssets.imgOrangeSaree1,
      AppAssets.imgOrangeSaree2,
      AppAssets.imgOrangeSaree3,
      AppAssets.imgOrangeSaree4,
    ],
  ),
];

List<Products> wishList = [
  Products(
    productName: AppStrings.anniDesignerWomenArt,
    productPrice: "299",
    discount: AppStrings.productDiscount1,
    productImage: AppAssets.imgAnniDesigner,
    productMrp: "599",
    productImageList: [
      AppAssets.imgYellowSaree1,
      AppAssets.imgYellowSaree2,
      AppAssets.imgYellowSaree3,
      AppAssets.imgDefault,
    ],
  ),
  Products(
    productName: AppStrings.anniDesignerWomenArt,
    productPrice: "299",
    discount: AppStrings.productDiscount1,
    productImage: AppAssets.imgOrangeSaree5,
    productMrp: "599",
    productImageList: [
      AppAssets.imgOrangeSaree1,
      AppAssets.imgOrangeSaree2,
      AppAssets.imgOrangeSaree3,
      AppAssets.imgOrangeSaree4,
    ],
  ),
];
List<Products> wishList2 = [
  Products(
    productName: AppStrings.dennisLingoMensSolidSlimFitCasualShirt,
    productPrice: "299",
    discount: AppStrings.productDiscount1,
    productImage: AppAssets.imgDennisShirt,
    productImageList: [
      AppAssets.imgShirt1,
      AppAssets.imgShirt2,
      AppAssets.imgShirt3,
      AppAssets.imgShirt4,
    ],
  ),
];

List<SortByData> sortByList = [
  SortByData(label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).mostRelevant, isSelected: true),
  SortByData(label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).newArrivals, isSelected: false),
  SortByData(label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).mostPopular, isSelected: false),
  SortByData(label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).priceLowToHigh, isSelected: false),
  SortByData(label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).priceHighToLow, isSelected: false),
  SortByData(label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).ratingHighToLow, isSelected: false),
];

List<SortByData> productsCategoryList = [
  SortByData(label: AppStrings.saree, isSelected: true),
  SortByData(label: AppStrings.apronsAndGloves, isSelected: true),
  SortByData(label: AppStrings.babyDolls, isSelected: false),
  SortByData(label: AppStrings.applianceCovers, isSelected: false),
  SortByData(label: AppStrings.bakingMouldsAndTools, isSelected: false),
  SortByData(label: AppStrings.bagPack, isSelected: false),
  SortByData(label: AppStrings.bathroomAccessories, isSelected: false),
  SortByData(label: AppStrings.banglesAndBracelets, isSelected: false),
  SortByData(label: AppStrings.choppersAndPeelers, isSelected: false),
  SortByData(label: AppStrings.bathScrubsAndSoaps, isSelected: false),
  SortByData(label: AppStrings.cookware, isSelected: false),
  SortByData(label: AppStrings.dinnerSets, isSelected: false),
];

List<SortByData> genderList = [
  SortByData(
    label: AppStrings.boy,
    isSelected: false,
    imagePath: AppAssets.icBoy,
  ),
  SortByData(
    label: AppStrings.girl,
    isSelected: true,
    imagePath: AppAssets.icGirl,
  ),
  SortByData(
    label: AppStrings.women,
    isSelected: false,
    imagePath: AppAssets.icWomen,
  ),
  SortByData(
    label: AppStrings.men,
    isSelected: true,
    imagePath: AppAssets.icMen,
  ),
];

List<SortByData> filterList = [
  SortByData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).category,
    isSelected: false,
    isDotVisible: false,
  ),
  SortByData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).gender,
    isSelected: false,
    isDotVisible: true,
  ),
  SortByData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).colors,
    isSelected: false,
    isDotVisible: false,
  ),
  SortByData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).fabric,
    isSelected: false,
    isDotVisible: true,
  ),
  SortByData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).size,
    isSelected: false,
    isDotVisible: false,
  ),
  SortByData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).price,
    isSelected: false,
    isDotVisible: false,
  ),
  SortByData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).rating,
    isSelected: false,
    isDotVisible: true,
  ),
  SortByData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).occasion,
    isSelected: false,
    isDotVisible: true,
  ),
  SortByData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).combo,
    isSelected: false,
    isDotVisible: false,
  ),
  SortByData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).discount,
    isSelected: false,
    isDotVisible: false,
  ),
  SortByData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).reversible,
    isSelected: false,
    isDotVisible: false,
  ),
  SortByData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).fitShape,
    isSelected: false,
    isDotVisible: false,
  ),
  SortByData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).material,
    isSelected: false,
    isDotVisible: false,
  ),
  SortByData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).patternType,
    isSelected: false,
    isDotVisible: true,
  ),
  SortByData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).bottomwearFabric,
    isSelected: false,
    isDotVisible: true,
  ),
  SortByData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).bottomPatternType,
    isSelected: false,
    isDotVisible: true,
  ),
  SortByData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).border,
    isSelected: false,
    isDotVisible: true,
  ),
  SortByData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).backType,
    isSelected: false,
    isDotVisible: true,
  ),
  SortByData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).topType,
    isSelected: false,
    isDotVisible: true,
  ),
  SortByData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).brand,
    isSelected: false,
    isDotVisible: true,
  ),
  SortByData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).warrantyPeriod,
    isSelected: false,
    isDotVisible: true,
  ),
  SortByData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).bottomType,
    isSelected: false,
    isDotVisible: true,
  ),
  SortByData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).heelType,
    isSelected: false,
    isDotVisible: true,
  ),
  SortByData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).concern,
    isSelected: false,
    isDotVisible: true,
  ),
  SortByData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).typeOfSkin,
    isSelected: false,
    isDotVisible: true,
  ),
  SortByData(
    label: Languages.of(GoozzyECommerceMyApp.navigatorKey.currentState!.context).shade,
    isSelected: false,
    isDotVisible: true,
  ),
];

List<SortByData> colorList = [
  SortByData(label: AppStrings.black, isSelected: false),
  SortByData(label: AppStrings.white, isSelected: false),
  SortByData(label: AppStrings.blue, isSelected: false),
  SortByData(label: AppStrings.brown, isSelected: false),
  SortByData(label: AppStrings.skin, isSelected: true),
  SortByData(label: AppStrings.green, isSelected: false),
  SortByData(label: AppStrings.grey, isSelected: false),
  SortByData(label: AppStrings.khaki, isSelected: false),
  SortByData(label: AppStrings.multiColor, isSelected: false),
  SortByData(label: AppStrings.olive, isSelected: false),
  SortByData(label: AppStrings.orange, isSelected: false),
  SortByData(label: AppStrings.pink, isSelected: true),
  SortByData(label: AppStrings.purple, isSelected: true),
  SortByData(label: AppStrings.red, isSelected: false),
  SortByData(label: AppStrings.skin, isSelected: false),
  SortByData(label: AppStrings.white, isSelected: false),
  SortByData(label: AppStrings.silver, isSelected: false),
];

List<SortByData> sizeList = [
  SortByData(label: "0-2 years", isSelected: true),
  SortByData(label: "10", isSelected: true),
  SortByData(label: "10-16 years", isSelected: false),
  SortByData(label: "2-5 years", isSelected: true),
  SortByData(label: "2.4", isSelected: false),
  SortByData(label: "2.6", isSelected: false),
  SortByData(label: "2.8", isSelected: false),
  SortByData(label: "2.4", isSelected: true),
  SortByData(label: "4.2 meters", isSelected: false),
  SortByData(label: "4.8 meters", isSelected: false),
  SortByData(label: "1 meters", isSelected: true),
  SortByData(label: "1.5 meters", isSelected: true),
  SortByData(label: "2 meters", isSelected: false),
  SortByData(label: "2.5 meters", isSelected: true),
  SortByData(label: "2.7 meters", isSelected: false),
  SortByData(label: "1.5 meters", isSelected: false),
  SortByData(label: "3 meters", isSelected: false),
  SortByData(label: "3.5 meters", isSelected: true),
  SortByData(label: "XL", isSelected: false),
  SortByData(label: "Xs", isSelected: false),
  SortByData(label: "XXL", isSelected: false),
];
List<SortByData> filterCategoryList = [
  SortByData(label: AppStrings.allTopWear, isSelected: true),
  SortByData(label: AppStrings.tops, isSelected: true),
  SortByData(label: AppStrings.kurtis, isSelected: false),
  SortByData(label: AppStrings.tShirt, isSelected: true),
  SortByData(label: AppStrings.shirt, isSelected: false),
  SortByData(label: AppStrings.sarees, isSelected: false),
  SortByData(label: AppStrings.jacket, isSelected: false),
  SortByData(label: AppStrings.earningAndStuds, isSelected: true),
  SortByData(label: AppStrings.menJewellery, isSelected: false),
  SortByData(label: AppStrings.belt, isSelected: false),
  SortByData(label: AppStrings.handbags, isSelected: true),
  SortByData(label: AppStrings.bedSheets, isSelected: false),
  SortByData(label: AppStrings.smartwatches, isSelected: false),
  SortByData(label: AppStrings.speakers, isSelected: false),
  SortByData(label: AppStrings.shorts, isSelected: false),
  SortByData(label: AppStrings.dresses, isSelected: false),
  SortByData(label: AppStrings.nightwear, isSelected: false),
  SortByData(label: AppStrings.capsAndHats, isSelected: false),
  SortByData(label: AppStrings.shararaSets, isSelected: false),
  SortByData(label: AppStrings.lehengaCholis, isSelected: false),
];
List<SortByData> fabricList = [
  SortByData(label: AppStrings.acrylic, isSelected: true),
  SortByData(label: AppStrings.artSilk, isSelected: true),
  SortByData(label: AppStrings.silk, isSelected: false),
  SortByData(label: AppStrings.linen, isSelected: true),
  SortByData(label: AppStrings.rayon, isSelected: false),
  SortByData(label: AppStrings.chiffon, isSelected: false),
  SortByData(label: AppStrings.georgette, isSelected: false),
  SortByData(label: AppStrings.canvas, isSelected: true),
  SortByData(label: AppStrings.cotton, isSelected: false),
  SortByData(label: AppStrings.lace, isSelected: false),
  SortByData(label: AppStrings.leather, isSelected: true),
  SortByData(label: AppStrings.organza, isSelected: true),
  SortByData(label: AppStrings.satin, isSelected: false),
  SortByData(label: AppStrings.polyester, isSelected: false),
  SortByData(label: AppStrings.velvet, isSelected: false),
  SortByData(label: AppStrings.mugaSilk, isSelected: false),
  SortByData(label: AppStrings.eriSilk, isSelected: false),
  SortByData(label: AppStrings.kosaSilk, isSelected: false),
  SortByData(label: AppStrings.banarasiSilk, isSelected: false),
  SortByData(label: AppStrings.kanjeevarmSilk, isSelected: false),
  SortByData(label: AppStrings.patolaSilk, isSelected: false),
  SortByData(label: AppStrings.denim, isSelected: false),
];
List<SortByData> filterGenderList = [
  SortByData(label: AppStrings.boy, isSelected: true),
  SortByData(label: AppStrings.girl, isSelected: false),
  SortByData(label: AppStrings.women, isSelected: false),
  SortByData(label: AppStrings.men, isSelected: false),
];
List<SortByData> priceList = [
  SortByData(label: "Under ₹149", isSelected: true),
  SortByData(label: "Under ₹199", isSelected: false),
  SortByData(label: "Under ₹249", isSelected: false),
  SortByData(label: "Under ₹299", isSelected: false),
  SortByData(label: "Under ₹349", isSelected: false),
  SortByData(label: "Under ₹399", isSelected: false),
  SortByData(label: "Under ₹449", isSelected: false),
  SortByData(label: "Under ₹499", isSelected: false),
  SortByData(label: "Under ₹549", isSelected: false),
  SortByData(label: "Under ₹599", isSelected: false),
  SortByData(label: "₹150 - ₹199 ", isSelected: true),
  SortByData(label: "₹200 - ₹249 ", isSelected: false),
  SortByData(label: "₹250 - ₹299 ", isSelected: false),
  SortByData(label: "₹300 - ₹349 ", isSelected: false),
  SortByData(label: "₹350 - ₹399 ", isSelected: false),
  SortByData(label: "₹400 - ₹449 ", isSelected: false),
  SortByData(label: "₹450 - ₹499 ", isSelected: false),
  SortByData(label: "₹500 - ₹549 ", isSelected: false),
  SortByData(label: "₹550 - ₹599 ", isSelected: false),
  SortByData(label: "₹600 - ₹649 ", isSelected: false),
  SortByData(label: "₹700 - ₹800", isSelected: false),
  SortByData(label: "₹800 - ₹900 ", isSelected: false),
  SortByData(label: "₹900 & Above ", isSelected: false),
  SortByData(label: "₹1000 & Above ", isSelected: false),
  SortByData(label: "₹2000 & Above ", isSelected: false),
];
List<SortByData> ratingList = [
  SortByData(label: "2.0 & Above", isSelected: true),
  SortByData(label: "3.0 & Above", isSelected: false),
  SortByData(label: "3.5 & Above", isSelected: false),
  SortByData(label: "4.0 & Above", isSelected: false),
  SortByData(label: "M - Trusted", isSelected: false),
];
List<SortByData> occasionList = [
  SortByData(label: AppStrings.wedding, isSelected: true),
  SortByData(label: AppStrings.festival, isSelected: false),
  SortByData(label: AppStrings.officeWear, isSelected: false),
  SortByData(label: AppStrings.casualWear, isSelected: false),
  SortByData(label: AppStrings.travelling, isSelected: false),
];
List<SortByData> comboList = [
  SortByData(label: AppStrings.combos, isSelected: true),
  SortByData(label: AppStrings.multiPack, isSelected: false),
  SortByData(label: AppStrings.packOfOne, isSelected: false),
  SortByData(label: AppStrings.packOfTwo, isSelected: false),
  SortByData(label: AppStrings.packOfThree, isSelected: false),
  SortByData(label: AppStrings.packOfFour, isSelected: false),
  SortByData(label: AppStrings.packOfFive, isSelected: false),
  SortByData(label: AppStrings.packOfSix, isSelected: false),
  SortByData(label: AppStrings.packOfSeven, isSelected: false),
  SortByData(label: AppStrings.packOfEight, isSelected: false),
  SortByData(label: AppStrings.packOfNine, isSelected: false),
  SortByData(label: AppStrings.packOfTwelve, isSelected: false),
];
List<SortByData> discountList = [
  SortByData(label: AppStrings.tenAbove, isSelected: true),
  SortByData(label: AppStrings.twentyAbove, isSelected: false),
  SortByData(label: AppStrings.allDiscount, isSelected: false),
  SortByData(label: AppStrings.deals, isSelected: false),
];
List<SortByData> reversibleList = [SortByData(label: AppStrings.no, isSelected: false)];
List<SortByData> fitShapeList = [
  SortByData(label: AppStrings.aLine, isSelected: true),
  SortByData(label: AppStrings.anarkali, isSelected: false),
  SortByData(label: AppStrings.angrakha, isSelected: false),
  SortByData(label: AppStrings.asymmetrical, isSelected: false),
  SortByData(label: AppStrings.blouson, isSelected: false),
  SortByData(label: AppStrings.cargo, isSelected: false),
  SortByData(label: AppStrings.regular, isSelected: false),
  SortByData(label: AppStrings.tummy, isSelected: false),
  SortByData(label: AppStrings.wrap, isSelected: false),
  SortByData(label: AppStrings.flared, isSelected: false),
  SortByData(label: AppStrings.highSlit, isSelected: false),
  SortByData(label: AppStrings.layered, isSelected: false),
];
List<SortByData> materialList = [
  SortByData(label: AppStrings.acrylic, isSelected: true),
  SortByData(label: AppStrings.aluminium, isSelected: false),
  SortByData(label: AppStrings.baneChina, isSelected: false),
  SortByData(label: AppStrings.copper, isSelected: false),
  SortByData(label: AppStrings.clay, isSelected: false),
  SortByData(label: AppStrings.ceramic, isSelected: false),
  SortByData(label: AppStrings.glass, isSelected: false),
  SortByData(label: AppStrings.iron, isSelected: false),
  SortByData(label: AppStrings.plastic, isSelected: false),
  SortByData(label: AppStrings.polyCotton, isSelected: false),
  SortByData(label: AppStrings.polypropylene, isSelected: false),
  SortByData(label: AppStrings.silicon, isSelected: false),
  SortByData(label: AppStrings.steel, isSelected: false),
  SortByData(label: AppStrings.terryCotton, isSelected: false),
];
List<SortByData> patternList = [
  SortByData(label: AppStrings.colourBLack, isSelected: true),
  SortByData(label: AppStrings.iKat, isSelected: false),
  SortByData(label: AppStrings.knitted, isSelected: false),
  SortByData(label: AppStrings.newspaperPrint, isSelected: false),
  SortByData(label: AppStrings.paisley, isSelected: false),
  SortByData(label: AppStrings.polkaDots, isSelected: false),
  SortByData(label: AppStrings.selfDesign, isSelected: false),
];
List<SortByData> bottomWearFabricList = [
  SortByData(label: AppStrings.artSilk, isSelected: true),
  SortByData(label: AppStrings.net, isSelected: false),
  SortByData(label: AppStrings.satin, isSelected: false),
  SortByData(label: AppStrings.silk, isSelected: false),
  SortByData(label: AppStrings.velvet, isSelected: false),
  SortByData(label: AppStrings.taffetaSilk, isSelected: false),
  SortByData(label: AppStrings.georgette, isSelected: false),
];
List<SortByData> bottomPatternTypeList = [
  SortByData(label: AppStrings.checked, isSelected: true),
  SortByData(label: AppStrings.net, isSelected: false),
  SortByData(label: AppStrings.satin, isSelected: false),
  SortByData(label: AppStrings.silk, isSelected: false),
  SortByData(label: AppStrings.velvet, isSelected: false),
  SortByData(label: AppStrings.taffetaSilk, isSelected: false),
  SortByData(label: AppStrings.georgette, isSelected: false),
];
List<SortByData> borderList = [
  SortByData(label: AppStrings.noBorder, isSelected: true),
  SortByData(label: AppStrings.embellished, isSelected: false),
  SortByData(label: AppStrings.embroidered, isSelected: false),
  SortByData(label: AppStrings.lace, isSelected: false),
  SortByData(label: AppStrings.fringed, isSelected: false),
  SortByData(label: AppStrings.bobble, isSelected: false),
  SortByData(label: AppStrings.solid, isSelected: false),
  SortByData(label: AppStrings.printed, isSelected: false),
  SortByData(label: AppStrings.tassels, isSelected: false),
  SortByData(label: AppStrings.zari, isSelected: false),
];
List<SortByData> backTypeList = [
  SortByData(label: AppStrings.backless, isSelected: true),
  SortByData(label: AppStrings.deepScoop, isSelected: false),
  SortByData(label: AppStrings.loop, isSelected: false),
  SortByData(label: AppStrings.mindScoop, isSelected: false),
  SortByData(label: AppStrings.paan, isSelected: false),
  SortByData(label: AppStrings.roundNeck, isSelected: false),
  SortByData(label: AppStrings.vNeck, isSelected: false),
];
List<SortByData> topTypeList = [
  SortByData(label: AppStrings.cropTop, isSelected: true),
  SortByData(label: AppStrings.jacket, isSelected: false),
  SortByData(label: AppStrings.shirt, isSelected: false),
  SortByData(label: AppStrings.tShirt, isSelected: false),
  SortByData(label: AppStrings.tunic, isSelected: false),
];
List<SortByData> brandList = [
  SortByData(label: AppStrings.apple, isSelected: true),
  SortByData(label: AppStrings.huawei, isSelected: false),
  SortByData(label: AppStrings.nokia, isSelected: false),
  SortByData(label: AppStrings.onePlus, isSelected: false),
  SortByData(label: AppStrings.oppo, isSelected: false),
  SortByData(label: AppStrings.realMe, isSelected: false),
  SortByData(label: AppStrings.redmi, isSelected: false),
  SortByData(label: AppStrings.vivo, isSelected: false),
];
List<SortByData> warrantyList = [
  SortByData(label: "1 Month", isSelected: true),
  SortByData(label: "1 Year", isSelected: false),
  SortByData(label: "3 Months", isSelected: false),
  SortByData(label: "6 Months", isSelected: false),
];
List<SortByData> bottomTypeList = [
  SortByData(label: AppStrings.dungarees, isSelected: true),
  SortByData(label: AppStrings.palazzos, isSelected: false),
  SortByData(label: AppStrings.pent, isSelected: false),
  SortByData(label: AppStrings.shorts, isSelected: false),
];
List<SortByData> heelTypeList = [
  SortByData(label: AppStrings.blockHeel, isSelected: false),
  SortByData(label: AppStrings.comfortHeel, isSelected: false),
  SortByData(label: AppStrings.slimHeel, isSelected: false),
  SortByData(label: AppStrings.wedges, isSelected: true),
];
List<SortByData> concernList = [
  SortByData(label: AppStrings.antiAgeing, isSelected: true),
  SortByData(label: AppStrings.dandruff, isSelected: false),
  SortByData(label: AppStrings.hairGrowth, isSelected: false),
];

List<SortByData> typeOfSkinList = [
  SortByData(label: AppStrings.allSkinType, isSelected: true),
  SortByData(label: AppStrings.antiAgeing, isSelected: false),
  SortByData(label: AppStrings.normal, isSelected: false),
  SortByData(label: AppStrings.oilySkin, isSelected: false),
];
List<SortByData> shadeList = [
  SortByData(label: AppStrings.black, isSelected: true),
  SortByData(label: AppStrings.blue, isSelected: false),
  SortByData(label: AppStrings.naturalGlow, isSelected: false),
  SortByData(label: AppStrings.nude, isSelected: false),
  SortByData(label: AppStrings.silver, isSelected: false),
  SortByData(label: AppStrings.golden, isSelected: false),
];
