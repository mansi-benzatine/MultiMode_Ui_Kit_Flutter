class Product {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final double rating;
  final int reviewCount;
  final List<String> availableColors;
  final List<Product> similarProducts;
  final List<Product> youMayAlsoLike;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.availableColors,
    this.similarProducts = const [],
    this.youMayAlsoLike = const [],
  });
}
