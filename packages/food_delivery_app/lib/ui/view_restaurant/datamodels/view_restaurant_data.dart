class OfferData {
  final String dealName;
  final String dealDetail;
  final String dealCouponDetail;
  final String? dealPrice;

  OfferData({
    required this.dealName,
    required this.dealDetail,
    required this.dealCouponDetail,
    this.dealPrice,
  });
}

class FoodData {
  final String foodName;
  final String foodImageUrl;
  final int? price;
  final int? totalPrice;
  final String offer;
  bool isAddCart;
  int cartItem;

  FoodData({
    required this.foodName,
    required this.foodImageUrl,
    this.price,
    this.totalPrice,
    required this.offer,
    this.isAddCart = false,
    this.cartItem = 0,
  });
}
