class HomeTabData {
  final String name;
  final String iconPath;

  HomeTabData({required this.name, required this.iconPath});
}

class MostRecentUsedCategoryData {
  final String categoryImagePath;
  final String categoryName;
  final String categoryItemCount;

  MostRecentUsedCategoryData({
    required this.categoryImagePath,
    required this.categoryItemCount,
    required this.categoryName,
  });
}

class ItemsData {
  final String itemName;
  final String itemImage;
  final String itemWeight;
  double itemDiscountPrice;
  double itemOriginalPrice;
  bool isFavourite;
  final int itemDiscount;
  bool isAddedToCart;
  int cartCount;
  bool isOutOfStock;
  double baseDiscountPrice;

  ItemsData({
    required this.itemName,
    required this.itemImage,
    required this.itemWeight,
    required this.itemDiscountPrice,
    required this.itemOriginalPrice,
    required this.itemDiscount,
    this.isFavourite = false,
    this.isAddedToCart = false,
    this.cartCount = 0,
    this.isOutOfStock = false,
  }) : baseDiscountPrice = itemDiscountPrice;
}
