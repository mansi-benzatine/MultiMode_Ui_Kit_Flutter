class FoodCategoryData {
  final String imageUrl;
  final String foodName;
  final String totalPlaces;

  FoodCategoryData({
    required this.foodName,
    required this.imageUrl,
    required this.totalPlaces,
  });
}

class FoodDetailData {
  final String foodName;
  final String foodImageUrl;
  final List<String> foodTypes;
  final double? rating;
  final int? time;
  final int? price;
  final String? personQuantity;
  int quantity;
  final String? location;

  FoodDetailData({
    required this.foodImageUrl,
    required this.foodTypes,
    this.rating,
    this.time,
    this.price,
    this.personQuantity,
    required this.foodName,
    this.quantity = 1,
    this.location,
  });
}

class BrandsData {
  final String brandImageUrl;
  final String brandDiscount;
  final String brandName;
  final int time;

  BrandsData({
    required this.brandImageUrl,
    required this.brandDiscount,
    required this.brandName,
    required this.time,
  });
}

class RestaurantData {
  final String restaurantImage;
  final String restaurantName;
  final List<String> cuisineType;
  final String location;
  final String distance;
  final double rating;
  final int time;
  final String discountDetail;
  final String discount;
  final String? price;

  RestaurantData({
    required this.restaurantImage,
    required this.restaurantName,
    required this.cuisineType,
    required this.location,
    required this.distance,
    required this.rating,
    required this.time,
    required this.discountDetail,
    required this.discount,
    this.price,
  });
}
