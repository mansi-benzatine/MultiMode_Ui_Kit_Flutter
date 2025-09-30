class CategoriesData {
  final String categoryImage;
  final String categoryName;
  final String categoryItemsQuantity;

  CategoriesData({
    required this.categoryImage,
    required this.categoryItemsQuantity,
    required this.categoryName,
  });
}

class TrendingNowData {
  final String trendingItemImage;
  final String trendingItemName;
  final String trendingItemCategoryName;
  final double trendingItemRating;
  final double trendingItemPrice;
  bool isSelected;

  TrendingNowData({
    required this.trendingItemCategoryName,
    required this.trendingItemImage,
    required this.trendingItemName,
    required this.trendingItemPrice,
    required this.trendingItemRating,
    this.isSelected = false,
  });
}

class NewArrivalData {
  final String newArrivalItemImage;
  final String newArrivalItemName;
  final String newArrivalItemCategoryName;
  final double newArrivalItemRating;
  final double newArrivalItemPrice;
  bool isSelected;

  NewArrivalData({
    required this.newArrivalItemCategoryName,
    required this.newArrivalItemImage,
    required this.newArrivalItemName,
    required this.newArrivalItemPrice,
    required this.newArrivalItemRating,
    this.isSelected = false,
  });
}

class BestSellersData {
  final String bestSellerItemImage;
  final String bestSellerItemName;
  final String bestSellerItemCategoryName;
  final double bestSellerItemRating;
  final double bestSellerItemPrice;
  bool isSelected;

  BestSellersData({
    required this.bestSellerItemCategoryName,
    required this.bestSellerItemImage,
    required this.bestSellerItemName,
    required this.bestSellerItemPrice,
    required this.bestSellerItemRating,
    this.isSelected = false,
  });
}
