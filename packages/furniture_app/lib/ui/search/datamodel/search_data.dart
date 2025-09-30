class CategoryModel {
  final String title;
  final String image;

  CategoryModel({required this.title, required this.image, required String icon});
}

class ProductModel {
  final String title;
  final String subtitle;
  final String image;
  final double rating;
  final double price;

  ProductModel({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.rating,
    required this.price,
  });
}
